import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:talimger/utils/storage_secure.dart';
import 'package:talimger/view/dashboard/pages/qr_page.dart';
import 'package:talimger/view/forgot_password_page.dart';
import 'package:talimger/view/dashboard/dashboard_page.dart';
import 'package:talimger/view/sign-up/sign_up.dart';
import 'package:talimger/view/sign-up/sign_up_next_step_page.dart';
import 'package:talimger/view/sign_in.dart';
import 'package:talimger/viewmodel/signin_viewmodel.dart';

String _savedToken = '';

// Future _readSecureStorage() async {
//   await AppStorageSecure()
//       .getRefreshToken()
//       .then((value) => _savedToken = value!);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await _readSecureStorage();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SignInViewModel()),
    ],
    child: MyApp(
      token: _savedToken,
    ),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({@required token, super.key});

  final String token = '';

  @override
  Widget build(BuildContext context) {
    // debugPrint('Token 2: $token');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      routes: {
        '/sign-up': (context) => SignUpPage(),
        '/sign-up-next': (context) => SingUpNextStepPage(),
        '/sign-in': (context) => SignInPage(),
        '/forgot-password': (context) => ForgotPasswordPage(),
        '/dashboard': (context) => Dashboard(),
        '/qr': (context) => QRPage(),
      },
      home: Dashboard(),
      // home: token.isNotEmpty && !JwtDecoder.isExpired(token)
      //     ? HomePage()
      //     : StartPage(),
    );
  }
}
