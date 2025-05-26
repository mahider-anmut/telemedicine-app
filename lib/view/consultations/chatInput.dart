import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telemedicine/constants/colors.dart';
import 'package:telemedicine/controller/chatController.dart';

import '../../service/cloudinary_service.dart';
// import 'package:record/record.dart';


class ChatInputWidget extends StatefulWidget {
  final Function(String content, String type) onSendMessage;

  const ChatInputWidget({Key? key, required this.onSendMessage}) : super(key: key);

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final TextEditingController _controller = TextEditingController();
  final picker = ImagePicker();

  bool isRecording = false;

  void sendText() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSendMessage(text, "text");
      _controller.clear();
    }
  }

  Future<void> pickImage({bool fromCamera = false}) async {
    try {
      final picked = await picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      );
      if (picked != null) {
        String? uploadedUrl = await ChatController.uploadFile(File(picked.path));
        if (uploadedUrl != null) {
          widget.onSendMessage(uploadedUrl, "image");
        }
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  Future<void> pickVideo({bool fromCamera = false}) async {
    try {
      final picked = await picker.pickVideo(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      );
      if (picked != null) {
        String? uploadedUrl = await ChatController.uploadFile(File(picked.path));
        if (uploadedUrl != null) {
          widget.onSendMessage(uploadedUrl, "video");
        }
      }
    } catch (e) {
      debugPrint("Error picking video: $e");
    }
  }

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        widget.onSendMessage(result.files.single.path!, "file");
      }
    } catch (e) {
      debugPrint("Error picking file: $e");
    }
  }

  // Future<void> startRecording() async {
  //   try {
  //     bool hasPermission = await record.hasPermission();
  //     if (!hasPermission) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Microphone permission is required to record voice messages')),
  //       );
  //       return;
  //     }
  //
  //     await record.start(
  //       encoder: AudioEncoder.AAC, // good codec for voice
  //       bitRate: 128000,
  //       // Optionally specify path here, otherwise auto-generated temp file is used
  //     );
  //
  //     setState(() {
  //       isRecording = true;
  //     });
  //   } catch (e) {
  //     debugPrint("Error starting recording: $e");
  //   }
  // }
  //
  //
  // Future<void> stopRecording() async {
  //   try {
  //     final path = await record.stop();
  //     setState(() {
  //       isRecording = false;
  //     });
  //     if (path != null) {
  //       widget.onSendMessage(path, "voice");
  //     }
  //   } catch (e) {
  //     debugPrint("Error stopping recording: $e");
  //   }
  // }


  void showMediaOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Pick Image from Gallery"),
              onTap: () {
                Navigator.pop(context);
                pickImage(fromCamera: false);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Take Photo with Camera"),
              onTap: () {
                Navigator.pop(context);
                pickImage(fromCamera: true);
              },
            ),
            ListTile(
              leading: Icon(Icons.video_library),
              title: Text("Pick Video from Gallery"),
              onTap: () {
                Navigator.pop(context);
                pickVideo(fromCamera: false);
              },
            ),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text("Record Video with Camera"),
              onTap: () {
                Navigator.pop(context);
                pickVideo(fromCamera: true);
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.attach_file),
            //   title: Text("Pick File"),
            //   onTap: () {
            //     Navigator.pop(context);
            //     pickFile();
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            // Media Button
            IconButton(
              icon: Icon(Icons.add,color: AppColors.primaryLightColor,),
              onPressed: showMediaOptions,
            ),

            // Text Input
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Type a message",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                ),
                minLines: 1,
                maxLines: 5,
              ),
            ),

            // Record Voice Button
            // isRecording
            //     ? IconButton(
            //   icon: Icon(Icons.stop_circle, color: Colors.red, size: 32),
            //   onPressed: stopRecording,
            // )
            //     : IconButton(
            //   icon: Icon(Icons.mic),
            //   onPressed: startRecording,
            // ),

            // Send Text Button
            IconButton(
              icon: Icon(Icons.send,color: AppColors.primaryColor,),
              onPressed: sendText,
            ),
          ],
        ),
      ),
    );
  }
}
