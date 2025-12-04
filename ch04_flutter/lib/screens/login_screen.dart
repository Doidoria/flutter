import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/ip_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 폼 검증을 위한 키
  final _formKey = GlobalKey<FormState>();
  
  // 텍스트 입력 컨트롤러
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
  // 인증 서비스 인스턴스
  final _authService = AuthService();
  
  // 로딩 상태
  bool _isLoading = false;
  
  // IP 주소
  String _ipAddress = 'IP 주소 로딩 중...';

  @override
  void initState() {
    super.initState();
    _loadIpAddress();
  }

  // IP 주소 로드
  Future<void> _loadIpAddress() async {
    final ip = await IpHelper.getDeviceIpAddress();
    if (mounted) {
      setState(() {
        _ipAddress = ip;
      });
    }
  }

  // 로그인 처리 함수
  Future<void> _handleLogin() async {
    // 폼 검증
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // 로딩 시작
    setState(() {
      _isLoading = true;
    });

    // 로그인 API 호출
    final result = await _authService.login(
      username: _usernameController.text,
      password: _passwordController.text,
    );

    // 로딩 종료
    setState(() {
      _isLoading = false;
    });

    // 화면이 아직 마운트되어 있는지 확인
    if (mounted) {
      if (result['success'] == true) {
        // 로그인 성공 시 홈 화면으로 이동
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // 로그인 실패 시 에러 메시지 표시
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'])),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // IP 주소 표시
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.blue, size: 20),
                    const SizedBox(width: 8),
                    const Text(
                      '기기 IP: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        _ipAddress,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // 사용자명 입력 필드
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: '사용자명',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '사용자명을 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // 비밀번호 입력 필드
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true, // 비밀번호 숨김
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              
              // 로그인 버튼
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('로그인'),
                    ),
              const SizedBox(height: 16),
              
              // 회원가입 버튼
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/join');
                },
                child: const Text('회원가입'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 컨트롤러 메모리 해제
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

