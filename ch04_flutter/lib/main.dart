import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/join_screen.dart';
import 'screens/home_screen.dart';
import 'services/auth_service.dart';
import 'services/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // ApiService 초기화 (쿠키 저장소 설정)
  await ApiService.instance.initialize();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 인증 앱',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 초기 화면을 SplashScreen으로 설정
      initialRoute: '/',
      // 라우트 설정
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/join': (context) => const JoinScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

// 스플래시 화면 (로그인 상태 확인)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 로그인 상태 확인
    _checkLoginStatus();
  }

  // 로그인 상태 확인 함수
  Future<void> _checkLoginStatus() async {
    final authService = AuthService();
    
    // 로컬 저장소에서 로그인 상태 확인
    final isLoggedIn = await authService.isLoggedIn();
    
    // 화면이 아직 마운트되어 있는지 확인
    if (mounted) {
      if (isLoggedIn) {
        // 로그인 상태라면 토큰 유효성 검증
        final isValid = await authService.validateToken();
        if (isValid) {
          // 토큰이 유효하면 홈 화면으로 이동
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          // 토큰이 무효하면 로그인 화면으로 이동
          Navigator.pushReplacementNamed(context, '/login');
        }
      } else {
        // 로그인 상태가 아니면 로그인 화면으로 이동
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  
}
