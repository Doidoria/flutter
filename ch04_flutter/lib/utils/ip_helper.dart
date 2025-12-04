import 'dart:io';

class IpHelper {
  // 기기의 IP 주소 가져오기
  static Future<String> getDeviceIpAddress() async {
    try {
      // 먼저 includeLinkLocal: false로 시도 (일반적인 IP)
      var interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLinkLocal: false,
      );

      // WiFi IP 주소 우선 찾기 (wlan0, wlan1 등)
      for (var interface in interfaces) {
        if (interface.name.toLowerCase().contains('wlan') || 
            interface.name.toLowerCase().contains('wifi') ||
            interface.name.toLowerCase().contains('eth')) {
          for (var addr in interface.addresses) {
            if (!addr.isLoopback && addr.type == InternetAddressType.IPv4) {
              return addr.address;
            }
          }
        }
      }

      // WiFi 인터페이스를 찾지 못하면 모든 인터페이스에서 찾기
      for (var interface in interfaces) {
        for (var addr in interface.addresses) {
          // 로컬호스트가 아닌 IP 주소 반환
          if (!addr.isLoopback && addr.type == InternetAddressType.IPv4) {
            return addr.address;
          }
        }
      }

      // includeLinkLocal: false로 찾지 못하면 true로 재시도
      interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLinkLocal: true,
      );

      for (var interface in interfaces) {
        if (interface.name.toLowerCase().contains('wlan') || 
            interface.name.toLowerCase().contains('wifi') ||
            interface.name.toLowerCase().contains('eth')) {
          for (var addr in interface.addresses) {
            if (!addr.isLoopback && addr.type == InternetAddressType.IPv4) {
              // Link-local 주소(169.254.x.x)는 제외
              if (!addr.address.startsWith('169.254.')) {
                return addr.address;
              }
            }
          }
        }
      }

      // 모든 인터페이스에서 찾기 (Link-local 제외)
      for (var interface in interfaces) {
        for (var addr in interface.addresses) {
          if (!addr.isLoopback && 
              addr.type == InternetAddressType.IPv4 &&
              !addr.address.startsWith('169.254.')) {
            return addr.address;
          }
        }
      }
      
      // IP 주소를 찾을 수 없으면 기본값 반환
      return 'IP 주소를 찾을 수 없습니다';
    } catch (e) {
      // 에러 상세 정보 반환 (디버깅용)
      return 'IP 주소를 가져올 수 없습니다: ${e.toString()}';
    }
  }
}

