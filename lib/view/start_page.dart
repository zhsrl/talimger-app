import 'package:flutter/material.dart';
import 'package:talimger/view/widgets/app_color.dart';
import 'package:talimger/view/widgets/screen_size.dart';
import 'package:talimger/view/widgets/talimger_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.all(16),
        height: 150,
        width: getScreenWidth(context),
        child: Column(
          children: [
            TalimgerButton(
              text: 'Войти',
              onPressed: () {
                Navigator.pushNamed(context, '/sign-in');
              },
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            'assets/images/start-page-background.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
