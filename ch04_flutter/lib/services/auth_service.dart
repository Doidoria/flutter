import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_service.dart';

class AuthService {
  final ApiService _apiService = ApiService.instance;
  
  // SharedPreferences에 저장할 키 이름
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _usernameKey = 'username';

  // 회원가입
  Future<Map<String, dynamic>> join({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _apiService.dio.post(
        '/join',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return {'success': true, 'message': '회원가입 성공'};
      }
      return {'success': false, 'message': '회원가입 실패'};
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data['message'] ?? '회원가입 중 오류 발생'
      };
    }
  }

  // 로그인
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _apiService.dio.post(
        '/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // 로그인 성공 시 로컬 저장소에 상태 저장
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(_isLoggedInKey, true);
        await prefs.setString(_usernameKey, username);

        return {
          'success': true,
          'message': response.data['message'] ?? '로그인 성공',
        };
      }
      return {'success': false, 'message': '로그인 실패'};
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data['message'] ?? '로그인 중 오류 발생'
      };
    }
  }

  // 로그아웃
  Future<void> logout() async {
    try {
      // 백엔드에 로그아웃 요청
      await _apiService.dio.post('/logout');
    } catch (e) {
      // 로그아웃 실패해도 로컬 상태는 삭제
    } finally {
      // 쿠키 삭제
      await _apiService.clearCookies();
      
      // 로컬 저장소에서 로그인 정보 삭제
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_isLoggedInKey);
      await prefs.remove(_usernameKey);
    }
  }

  // 토큰 유효성 검증
  Future<bool> validateToken() async {
    try {
      final response = await _apiService.dio.get('/validate');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // 사용자 정보 조회
  Future<Map<String, dynamic>?> getUserInfo() async {
    try {
      final response = await _apiService.dio.get('/user');
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // 로그인 상태 확인
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // 저장된 사용자명 가져오기
  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }
}

