import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talimger/view/widgets/app_color.dart';
import 'package:talimger/view/widgets/talimger_button.dart';
import 'package:talimger/view/widgets/talimget_textfield.dart';
import 'package:talimger/viewmodel/signin_viewmodel.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignInViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.chevron_left,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 45,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Войти',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Войдите, чтобы управлять и проверять посещаемость — вашу и вашей группы',
                        style: TextStyle(
                          color: Color(0xFFB2B2B2),
                        ),
                      ),
                    ],
                  ),
                ),

                // Поля для ввода
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Column(
                    children: [
                      TalimgerTextField(
                        labelText: 'Электронная почта',
                        hintText: 'example@gmail.com',
                        controller: _emailController,
                        onChanged: (val) {
                          setState(() {});
                        },
                      ),
                      TalimgerTextField(
                        labelText: 'Пароль',
                        hintText: '******',
                        controller: _passwordController,
                        isPassword: true,
                        onChanged: (val) {
                          setState(() {});
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                          Text(
                            'Забыли пароль?',
                            style: TextStyle(color: Color(0xFFB2B2B2)),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TalimgerButton(
                        text: 'Войти',
                        isLoading: viewModel.isLoading,
                        onPressed: _emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty
                            ? () {
                                String email = _emailController.text.trim();
                                String password =
                                    _passwordController.text.trim();

                                viewModel.signIn(email, password).then(
                                  (user) {
                                    setState(() {});
                                    if (user != null) {
                                      Navigator.pushReplacementNamed(
                                          context, '/dashboard');
                                    } else {
                                      debugPrint('error');
                                    }
                                  },
                                );
                              }
                            : null,
                      ),
                      SizedBox(
                        height: 150,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Вы еще не зарегистрировались? ',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/sign-up');
                            },
                            child: Text(
                              'Зарегистрироваться',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
