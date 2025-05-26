import 'package:flutter/material.dart';
import 'package:telemedicine/controller/chatController.dart';

import '../../constants/colors.dart';
import '../../model/Chat.dart';
import '../../widgets/custom/customtextfield.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/headerMiniCardWidget.dart';
import 'chatItem.dart';
import 'consultationChat.dart';


class ConsultationHomePage extends StatefulWidget {
  const ConsultationHomePage({super.key});

  @override
  State<ConsultationHomePage> createState() => _ConsultationHomePageState();
}

class _ConsultationHomePageState extends State<ConsultationHomePage> {
  List<Chat> allChats = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchChats();
  }

  Future<void> _fetchChats() async {
    setState(() => isLoading = true);
    try {
      List<Chat> Chats = await ChatController.getChats();

      setState(() {
        allChats = Chats;
      });
    } catch (e) {
      debugPrint("Error fetching chats: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

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
          // Conversations
          Expanded(
            child: Container(
              // color: AppColors.tabColor,
                child: ListView.builder(
                    itemCount: allChats.length,
                    itemBuilder: (context, index) {
                      final chat = allChats[index];
                      return ChatItem(chat: chat);
                    }
                )

            ),
          ),
        ],
      ),
    );
  }
}