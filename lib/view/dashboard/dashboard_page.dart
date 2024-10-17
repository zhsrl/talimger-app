import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talimger/view/dashboard/pages/attendance_page.dart';
import 'package:talimger/view/dashboard/pages/home_page.dart';
import 'package:talimger/view/dashboard/pages/qr_page.dart';
import 'package:talimger/view/dashboard/pages/settings_page.dart';
import 'package:talimger/view/widgets/app_color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  Widget _profileWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(
                'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            radius: 25,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Добро пожаловать!',
                style: TextStyle(
                  color: Color(0xFF687182),
                  fontSize: 14,
                ),
              ),
              Text(
                'Утепов Наурызбек',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List _pages = [
      HomePage(),
      // QRPage(),
      HomePage(),
      AttendancePage(),
      SettingsPage(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Главная',
            icon: SvgPicture.asset('assets/svg/home.svg'),
            activeIcon: SvgPicture.asset(
              'assets/svg/home-02.svg',
              color: AppColor.primaryColor,
              // theme: SvgTheme(
              //   currentColor: Colors.red,
              // ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'QR',
            icon: SvgPicture.asset('assets/svg/scan.svg'),
            activeIcon: SvgPicture.asset(
              'assets/svg/scan.svg',

              color: AppColor.primaryColor,
              // theme: SvgTheme(
              //   currentColor: Colors.red,
              // ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Посещаемость',
            icon: SvgPicture.asset('assets/svg/calendar.svg'),
            activeIcon: SvgPicture.asset(
              'assets/svg/calendar.svg',
              color: AppColor.primaryColor,
              // theme: SvgTheme(
              //   currentColor: Colors.red,
              // ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Настройки',
            icon: SvgPicture.asset(
              'assets/svg/settings.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/svg/settings.svg',
              color: AppColor.primaryColor,
              // theme: SvgTheme(
              //   currentColor: Colors.red,
              // ),
            ),
          ),
        ],
        selectedItemColor: AppColor.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12),
        currentIndex: _currentIndex,
        elevation: 1,
        onTap: (index) {
          HapticFeedback.mediumImpact();

          if (index == 1) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, sanimation) {
                  return QRPage();
                },
                transitionsBuilder:
                    (context, animation, secondartAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
      body: _pages.elementAt(_currentIndex),
    );
  }
}
