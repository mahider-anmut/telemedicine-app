import 'package:flutter/material.dart';
import 'package:telemedicine/utils/utils.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../model/Chat.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import 'consultationChat.dart';

class ChatItem extends StatefulWidget {
  final Chat chat;

  ChatItem({required this.chat});

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    Widget chatItemView = GestureDetector(
      onTap: () {
        widget.chat.status! == 'open' ?Navigator.push(context, MaterialPageRoute(builder: (_) =>  ConsultationChat(chat: widget.chat))):null;
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
            backgroundImage: widget.chat.doctor?.profileImage != null
                ? NetworkImage(widget.chat.doctor!.profileImage!)
                : AssetImage(LocalAssets.avatar) as ImageProvider,
          ),
          title: Text1(text1: "${widget.chat.doctor?.firstName!} ${widget.chat.doctor?.lastName!}"),
          subtitle: Text2(text2: widget.chat.status=="closed"?"Chat is closed":widget.chat.lastMessage!),
          trailing: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (widget.chat.unreadCount! > 0)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.buttonColor,
                      child: Text(
                        "${widget.chat.unreadCount}",
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                Text2(text2: Utils.formatTime(widget.chat.lastMessageTimestamp!)),
              ],
            ),
          ),
        ),
      ),
    );

    if (widget.chat.status! == 'closed') {
      return Stack(
        children: [
          chatItemView,
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ],
      );
    }


    return chatItemView;

  }
}
