import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../utils/ip_helper.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  // 폼 검증을 위한 키
  final _formKey = GlobalKey<FormState>();
  
  // 텍스트 입력 컨트롤러
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  
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

  // 회원가입 처리 함수
  Future<void> _handleJoin() async {
    // 폼 검증
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // 비밀번호 일치 확인
    if (_passwordController.text != _passwordConfirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('비밀번호가 일치하지 않습니다')),
      );
      return;
    }

    // 로딩 시작
    setState(() {
      _isLoading = true;
    });

    // 회원가입 API 호출
    final result = await _authService.join(
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
        // 회원가입 성공 시 성공 메시지 표시 후 로그인 화면으로 돌아가기
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('회원가입 성공')),
        );
        Navigator.pop(context);
      } else {
        // 회원가입 실패 시 에러 메시지 표시
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
        title: const Text('회원가입'),
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
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력하세요';
                  }
                  if (value.length < 4) {
                    return '비밀번호는 4자 이상이어야 합니다';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // 비밀번호 확인 입력 필드
              TextFormField(
                controller: _passwordConfirmController,
                decoration: const InputDecoration(
                  labelText: '비밀번호 확인',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호 확인을 입력하세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              
              // 회원가입 버튼
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _handleJoin,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
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
    _passwordConfirmController.dispose();
    super.dispose();
  }
}

