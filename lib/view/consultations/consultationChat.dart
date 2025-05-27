// import 'package:flutter/material.dart';
//
// import '../../constants/colors.dart';
// import '../../widgets/headerMiniChatCardWidget.dart';
//
// class ConsultationChat extends StatefulWidget {
//   final String chatId;
//   const ConsultationChat({super.key,required this.chatId});
//
//   @override
//   State<ConsultationChat> createState() => _ConsultationChatState();
// }
//
// class _ConsultationChatState extends State<ConsultationChat> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen()));
//       },
//       child: Scaffold(
//         body: Column(
//           children: [
//             // Top Blue Background
//             const HeaderMiniChatCardWidget(title: "doctor 1"),
//             SizedBox(height: 8.0),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
//                 decoration: const BoxDecoration(
//                     color: AppColors.tabColor,
//                     borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
//                 child: ListView(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   children: [
//                     // Date Label
//                     const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Center(
//                         child: Text(
//                           'TODAY',
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // Incoming Message
//                     _buildIncomingMessage('Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '08:04 pm', 'assets/images/img/doctor01.jpeg'),
//                     const SizedBox(height: 10),
//                     // Outgoing Message
//                     _buildOutgoingMessage('Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '08:04 pm'),
//                     const SizedBox(height: 10),
//                     // Image Message
//                     _buildIncomingImageMessage('assets/images/img/doctor01.jpeg', '08:04 pm'),
//                     const SizedBox(height: 10),
//                     // Voice Message
//                     _buildOutgoingVoiceMessage('08:04 pm', '0:13'),
//                     const SizedBox(height: 134,),
//                     Row(
//                       children: [
//                         Flexible(
//                           child: SizedBox(
//                             width: double.infinity,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 hintText: 'Hey, I want to',
//                                 filled: true,
//                                 fillColor: Colors.grey.shade200,
//                                 suffixIcon: Image.asset('assets/images/img/Emoji.png'),
//                                 contentPadding:
//                                 const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   borderSide: BorderSide.none,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         CircleAvatar(
//                           backgroundColor: AppColors.buttonColor,
//                           child: IconButton(
//                             onPressed: (){
//                               // Navigator.push(context, MaterialPageRoute(builder: (_) => const GroupCallScreen()));
//
//
//                             },
//                             icon: const Icon(
//                               Icons.mic,
//                               color: Colors.white,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildIncomingMessage(String message, String time, String avatar) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CircleAvatar(
//           backgroundImage: AssetImage(avatar),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: const Color(0xff293651), // First container background color
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(message, style: const TextStyle(color: Colors.white)),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 time,
//                 style: const TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//
//             ],
//           ),
//         ),
//
//       ],
//     );
//   }
//
//   Widget _buildOutgoingMessage(String message, String time) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: AppColors.buttonColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(
//                   message,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 time,
//                 style: const TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 10),
//         const CircleAvatar(
//           backgroundImage: AssetImage('assets/images/img/doctor05.jpeg'), // Replace with your image path
//         ),
//       ],
//     );
//   }
//
//   Widget _buildIncomingImageMessage(String imagePath, String time) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CircleAvatar(
//           backgroundImage: AssetImage(imagePath),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//
//                 child: Image.asset(
//                   imagePath,
//                   fit: BoxFit.cover,
//                   height: 140,
//                   width: 250,
//
//                 ),
//               ),
//
//
//               const SizedBox(height: 5),
//               Text(
//                 time,
//                 style: const TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildOutgoingVoiceMessage(String time, String duration) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: AppColors.buttonColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.play_arrow, color: Colors.white),
//                     const SizedBox(width: 10),
//
//                     Image.asset('assets/images/img/Group 28.png',color: Colors.white,),
//                     const Spacer(),
//                     Text(
//                       duration,
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 time,
//                 style: const TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 10),
//         const CircleAvatar(
//           backgroundImage: AssetImage('assets/images/img/doctor05.jpeg'), // Replace with your image path
//         ),
//       ],
//     );
//   }
// }









import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telemedicine/model/Message.dart';
import 'dart:io';

import '../../constants/constants.dart';
import '../../controller/chatController.dart';
import '../../model/Chat.dart';
import '../../service/shared_preference.dart';
import '../../utils/utils.dart';
import '../../widgets/headerMiniChatCardWidget.dart';
import 'chatInput.dart';
import 'videoBubble.dart';

class ConsultationChat extends StatefulWidget {
  final Chat chat;
  const ConsultationChat({required this.chat, super.key});

  @override
  State<ConsultationChat> createState() => _ConsultationChatState();
}

class _ConsultationChatState extends State<ConsultationChat> {
  final ScrollController _scrollController = ScrollController();

  String? userId;
  List<Message> allMessages = [];
  bool isLoading = false;


  bool isSending = false;
  File? imageFile;

  var role = "";

  Timer? _timer;


  @override
  void initState() {
    super.initState();

    fetchMessages();
    _startPullingMessages();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> fetchMessages() async {
    setState(() => isLoading = true);
    try {
      var userRole = await SharedPreference.getString(Constants.role);
      var user = await SharedPreference.getString(Constants.userId);
      List<Message> messages = await ChatController.getAllMessageByChatId(widget.chat.id!);

      setState(() {
        role=userRole;
        userId = user;
        allMessages = messages;
      });
    } catch (e) {
      debugPrint("Error fetching messages: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _startPullingMessages() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      pullMessage();
    });
  }
  pullMessage() async {
    List<Message> messages = await ChatController.getAllMessageByChatId(widget.chat.id!);
    if (!mounted) return;
    setState(() {
      allMessages = messages;
    });
  }

  Future<void> sendMessage(String content, {String type = "text"}) async {

    Message newMessage = Message(
        messageType: type,
        chatId: widget.chat.id!,
        content: content,
        senderId: userId!,
        seenBy: [userId!]
    );

    Message newMessageRes = await ChatController.sendMessage(newMessage);
    setState(() {
      allMessages.add(newMessageRes);
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 100,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Future<bool> requestPermissions() async {
    final statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    final allGranted = statuses.values.every((status) => status.isGranted);

    return allGranted;
  }


  Future<void> startVideoCall(BuildContext context) async {
    bool granted = await requestPermissions();
    if (granted) {
      ChatController.initVideoCall(context, widget.chat.appointmentId!);
    } else {
      Utils.showToast("Camera and microphone permissions are required to start the video call.",type: "error");
    }
    // ChatController.initVideoCall(context, widget.chat.appointmentId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderMiniChatCardWidget(title: "${role=="doctor"?widget.chat.patient?.firstName:widget.chat.doctor?.firstName} ${role=="doctor"?widget.chat.patient?.lastName:widget.chat.doctor?.lastName}",imgUrl: null,rightIconPress: startVideoCall,),
          SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: allMessages.length,
              itemBuilder: (_, index) {
                final msg = allMessages[index];
                final isMe = msg.senderId == userId;
                final time = Utils.formatTime(msg.timestamp!);
                final msgType = msg.messageType;

                Widget bubble;

                if (msgType == "image") {
                  bubble = Image.network(msg.content!,width: 200,);
                }else if (msgType == "video") {
                  bubble = VideoBubble(videoUrl: msg.content!);
                } else {
                  bubble = Text(msg.content!);
                }

                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        bubble,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              time,
                              style: TextStyle(fontSize: 10, color: Colors.black54),
                            ),
                            if (isMe)
                              Icon(
                                msg.seenBy!.contains(userId==widget.chat.patientId?widget.chat.doctorId:widget.chat.patientId) ? Icons.done_all : Icons.check,
                                size: 14,
                                color: msg.seenBy!.contains(userId==widget.chat.patientId?widget.chat.doctorId:widget.chat.patientId) ? Colors.blue : Colors.black54,
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          ChatInputWidget(
            onSendMessage: (content, type) {
              print("Send message of type $type with content: $content");
              if (content.trim().isNotEmpty) {
                sendMessage(content,type: type);
              }
            },
          )
        ],
      ),
    );
  }
}


