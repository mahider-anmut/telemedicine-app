import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom/customtextfield.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/headerMiniCardWidget.dart';
import 'consultationChat.dart';


class ConsultationHomePage extends StatelessWidget {
  const ConsultationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Blue Background
          HeaderMiniCardWidget(title: "Consultation",),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: const CustomTextField(
              label: 'Search Consultation',
              icon: Icons.search,
            ),
          ),
          SizedBox(height: 8.0),
          // Conversations
          Expanded(
            child: Container(
              // color: AppColors.tabColor,
              child: ListView(
                children: [
                  _buildConversation(
                    'Carla Schoen',
                    'Perfect, will check it',
                    'assets/images/img/doctor01.jpeg',
                    '09:34 PM',
                    2,
                    context,
                  ),
                  _buildConversation(
                    'Mrs. Sheila Lemke',
                    'Thanks',
                    'assets/images/img/drshazia.jpg',
                    '09:34 PM',
                    0,
                    context,
                  ),
                  _buildConversation(
                    'Deanna Botsford V',
                    'Welcome!',
                    'assets/images/img/drrobert.jpg',
                    '09:34 PM',
                    3,
                    context,
                  ),
                  _buildConversation(
                    'Mr. Katie Bergnaum',
                    'Good Morning!',
                    'assets/images/img/doctor03.jpeg',
                    '09:34 PM',
                    0,
                    context,
                  ),
                  _buildConversation(
                    'Armando Ferry',
                    'Can I check that?',
                    'assets/images/img/doctor04.jpeg',
                    '09:34 PM',
                    4,
                    context,
                  ),
                  _buildConversation(
                    'Annette Fritsch',
                    'Thanks!',
                    'assets/images/img/doccc.jpg',
                    '09:34 PM',
                    0,
                    context,
                  ),
                  _buildConversation(
                    'Carla Schoen',
                    'Perfect, will check it',
                    'assets/images/img/doctor01.jpeg',
                    '09:34 PM',
                    2,
                    context,
                  ),
                  _buildConversation(
                    'Mrs. Sheila Lemke',
                    'Thanks',
                    'assets/images/img/drshazia.jpg',
                    '09:34 PM',
                    0,
                    context,
                  ),
                  _buildConversation(
                    'Deanna Botsford V',
                    'Welcome!',
                    'assets/images/img/drrobert.jpg',
                    '09:34 PM',
                    3,
                    context,
                  ),
                  // Add more if needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectMessage(String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ConsultationChat()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }

  Widget _buildConversation(
      String name,
      String message,
      String imagePath,
      String time,
      int unreadCount,
      BuildContext context,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ConsultationChat()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade800),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imagePath),
          ),
          title: Text1(text1: name),
          subtitle: Text2(text2: message),
          trailing: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (unreadCount > 0)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.buttonColor,
                      child: Text(
                        '$unreadCount',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                Text2(text2: time), // Always show the time at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
