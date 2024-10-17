import 'package:flutter/material.dart';
import 'package:talimger/utils/field_validate.dart';
import 'package:talimger/view/widgets/app_color.dart';
import 'package:talimger/view/widgets/app_snackbar.dart';
import 'package:talimger/view/widgets/talimger_button.dart';
import 'package:talimger/view/widgets/talimget_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;

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
                        'Забыли пароль',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Если вы забыли пароль, восстановите доступ для контроля посещаемости',
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
                        hintText: '@example@gmail.com',
                        controller: _emailController,
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      TalimgerButton(
                        text: 'Отправить ссылку',
                        isLoading: false,
                        onPressed: _emailController.text.isNotEmpty
                            ? () {
                                String email = _emailController.text;

                                if (email.isValidEmail() == true) {
                                  showAppSnackBar(
                                      context: context, text: 'Successful!');
                                } else {
                                  showAppSnackBar(
                                      context: context, text: 'Invalid email');
                                }
                              }
                            : null,
                      ),
                      SizedBox(
                        height: 300,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'У вас есть аккаунт?? ',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Войти',
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
