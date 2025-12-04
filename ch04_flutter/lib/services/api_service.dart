import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ApiService {
  // 백엔드 서버 주소
  static const String baseUrl = 'http://192.168.5.8:8090';

  // 싱글톤 인스턴스
  static ApiService? _instance;

  // Dio 인스턴스와 쿠키 관리자
  late Dio _dio;
  late PersistCookieJar _cookieJar;
  bool _initialized = false;

  // 싱글톤 생성자
  ApiService._internal();

  // 싱글톤 인스턴스 가져오기
  static ApiService get instance {
    _instance ??= ApiService._internal();
    return _instance!;
  }

  // 비동기 초기화 (앱 시작 시 한 번만 호출)
  Future<void> initialize() async {
    if (_initialized) return;

    // 영구 쿠키 저장소 초기화
    final appDocDir = await getApplicationDocumentsDirectory();
    final cookiePath = '${appDocDir.path}/.cookies';
    _cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));

    // Dio 인스턴스 초기화
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {'Content-Type': 'application/json'},
        // 쿠키를 포함하여 요청 전송 (CookieManager가 자동 처리)
        followRedirects: true,
        validateStatus: (status) => status! < 500,
      ),
    );

    // 쿠키 관리자 추가 (자동으로 쿠키 저장/전송)
    _dio.interceptors.add(CookieManager(_cookieJar));

    // 디버깅을 위한 로깅 인터셉터 추가
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    _initialized = true;
  }

  // Dio 인스턴스를 외부에서 사용할 수 있도록 getter 제공
  Dio get dio {
    if (!_initialized) {
      throw Exception('ApiService가 초기화되지 않았습니다. initialize()를 먼저 호출하세요.');
    }
    return _dio;
  }

  // 쿠키 초기화 (로그아웃 시 사용)
  Future<void> clearCookies() async {
    if (_initialized) {
      await _cookieJar.deleteAll();
    }
  }
}
