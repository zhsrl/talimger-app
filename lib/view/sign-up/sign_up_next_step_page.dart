import 'package:flutter/material.dart';
import 'package:talimger/view/widgets/talimger_button.dart';
import 'package:talimger/view/widgets/talimger_dropdown.dart';
import 'package:talimger/view/widgets/talimget_textfield.dart';

class SingUpNextStepPage extends StatefulWidget {
  const SingUpNextStepPage({super.key});

  @override
  State<SingUpNextStepPage> createState() => _SingUpNextStepPageState();
}

class _SingUpNextStepPageState extends State<SingUpNextStepPage> {
  @override
  Widget build(BuildContext context) {
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
                        'Регистрация',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Присоединяйтесь, чтобы легко отслеживать и управлять посещаемостью',
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
                      TalimgerDropdown(
                        labelText: 'Учреждение',
                        hintText: 'Выберите',
                        items: [
                          DropdownMenuItem(
                            value: 'ALT',
                            child: Text('ALT'),
                          ),
                          DropdownMenuItem(
                            value: 'KBTU',
                            child: Text('KBTU'),
                          ),
                          DropdownMenuItem(
                            value: 'IITU',
                            child: Text('IITU'),
                          ),
                          DropdownMenuItem(
                            value: 'Қазақ қыздар университеті',
                            child: Text('Қазақ қыздар университеті'),
                          ),
                        ],
                      ),
                      TalimgerDropdown(
                        labelText: 'Учитель',
                        hintText: 'Выберите',
                      ),
                      TalimgerTextField(
                        labelText: 'Почта',
                        hintText: '@example@gmail.com',
                      ),
                      TalimgerTextField(
                        labelText: 'Пароль',
                        hintText: '********',
                        isPassword: true,
                      ),
                      TalimgerTextField(
                        labelText: 'Повторите пароль',
                        hintText: '********',
                        isPassword: true,
                      ),
                      TalimgerButton(
                        text: 'Зарегистрироваться',
                        onPressed: null,
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
