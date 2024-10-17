import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talimger/view/widgets/app_color.dart';
import 'package:talimger/view/widgets/screen_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _profileWidget(),
                _shortInfo(),
                _attendanceHistory(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
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
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Пт, 20 Сен 2024',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/location-marker.svg'),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Школа №124',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shortInfoItem({
    Widget? icon,
    String? title,
    dynamic value,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.f6f8fa,
        // color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon!,
              SizedBox(
                width: 6,
              ),
              Text(title!),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _shortInfo() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _shortInfoItem(
                  icon: SvgPicture.asset('assets/svg/arrival.svg'),
                  title: 'Прибытия',
                  value: '07:45'),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: _shortInfoItem(
                icon: SvgPicture.asset('assets/svg/departure.svg'),
                title: 'Отъезд',
                value: '17:45',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: _shortInfoItem(
                  icon: SvgPicture.asset('assets/svg/absense.svg'),
                  title: 'Отсутствие',
                  value: '3 день'),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: _shortInfoItem(
                icon: SvgPicture.asset('assets/svg/total.svg'),
                title: 'Общий',
                value: '15 дней',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _attendanceHistoryItem() {
    return Container(
      width: getScreenWidth(context),
      decoration: BoxDecoration(
        color: AppColor.f6f8fa,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(
        bottom: 18,
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          // Attendance Date
          Container(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 9,
            ),
            child: Column(
              children: [
                Text(
                  '22',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ср',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Attendance arrival, absense, departure info
          Container(
            padding: EdgeInsets.only(
              left: 22,
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      '07:57',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Прибытия',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: VerticalDivider(
                    thickness: 1,
                    color: AppColor.primaryColor.withOpacity(0.1),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '07:57',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Отъезд',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: VerticalDivider(
                    thickness: 1,
                    color: AppColor.primaryColor.withOpacity(0.1),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '07:57',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Общий',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _attendanceHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 40,
            bottom: 20,
          ),
          child: Text(
            'История посещений',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        ListView.builder(
          itemCount: 7,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _attendanceHistoryItem();
          },
        )
      ],
    );
  }
}
