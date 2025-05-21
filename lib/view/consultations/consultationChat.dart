import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/headerMiniChatCardWidget.dart';

class ConsultationChat extends StatelessWidget {
  const ConsultationChat({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen()));
      },
      child: Scaffold(
        body: Column(
          children: [
            // Top Blue Background
            const HeaderMiniChatCardWidget(title: "doctor 1"),
            SizedBox(height: 8.0),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                decoration: const BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [
                    // Date Label
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          'TODAY',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Incoming Message
                    _buildIncomingMessage('Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '08:04 pm', 'assets/images/img/doctor01.jpeg'),
                    const SizedBox(height: 10),
                    // Outgoing Message
                    _buildOutgoingMessage('Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '08:04 pm'),
                    const SizedBox(height: 10),
                    // Image Message
                    _buildIncomingImageMessage('assets/images/img/doctor01.jpeg', '08:04 pm'),
                    const SizedBox(height: 10),
                    // Voice Message
                    _buildOutgoingVoiceMessage('08:04 pm', '0:13'),
                    const SizedBox(height: 134,),
                    Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Hey, I want to',
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                suffixIcon: Image.asset('assets/images/img/Emoji.png'),
                                contentPadding:
                                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: AppColors.buttonColor,
                          child: IconButton(
                            onPressed: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (_) => const GroupCallScreen()));


                            },
                            icon: const Icon(
                              Icons.mic,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncomingMessage(String message, String time, String avatar) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(avatar),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xff293651), // First container background color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(message, style: const TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 5),
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),

            ],
          ),
        ),

      ],
    );
  }

  Widget _buildOutgoingMessage(String message, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/img/doctor05.jpeg'), // Replace with your image path
        ),
      ],
    );
  }

  Widget _buildIncomingImageMessage(String imagePath, String time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 140,
                  width: 250,

                ),
              ),


              const SizedBox(height: 5),
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOutgoingVoiceMessage(String time, String duration) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.play_arrow, color: Colors.white),
                    const SizedBox(width: 10),

                    Image.asset('assets/images/img/Group 28.png',color: Colors.white,),
                    const Spacer(),
                    Text(
                      duration,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/img/doctor05.jpeg'), // Replace with your image path
        ),
      ],
    );
  }
}
