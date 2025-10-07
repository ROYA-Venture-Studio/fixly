import 'package:fixly/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TalkToUsScreen extends StatefulWidget {
  @override
  State<TalkToUsScreen> createState() => _TalkToUsScreenState();
}

class _TalkToUsScreenState extends State<TalkToUsScreen> {
  final accent = Color(0xFF635B6A);
  final receivedBg = Color(0xFFF3F1F3);
  final inputBg = Color(0xFFF9F8FC);
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [
    {
      "sender": "support",
      "msg": "Hello, how can I help you?",
      "time": "3:05 PM",
    },
    {
      "sender": "user",
      "msg": "I am having an issue with my request",
      "time": "3:05 PM",
    },
    {
      "sender": "support",
      "msg": "Sorry for hearing that, would you please describe the issue?",
      "time": "3:05 PM",
    },
  ];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      messages.add({
        "sender": "user",
        "msg": text.trim(),
        "time": TimeOfDay.now().format(context),
      });
      _controller.clear();
    });
  }

  Future<void> _sendImage() async {
    // Integrate image_picker package as you need for production
    setState(() {
      messages.add({
        "sender": "user",
        "img": "assets/images/renner_group.jpg", // Use a picked image here
        "time": TimeOfDay.now().format(context),
      });
    });
  }

  Widget buildCustomAppBar(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(32),
            child: SvgPicture.asset("assets/icons/back.svg"),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fixly Support",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: Color(0xFF231531),
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Typically replies in a few minutes",
                style: TextStyle(fontSize: 13, color: Color(0xFFA29EA3)),
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: inputBg,
            radius: 18,
            child: Icon(Icons.call, color: accent, size: 18),
          ),
        ],
      ),
    );
  }

  Widget buildMessage(Map<String, dynamic> msg) {
    final isUser = msg["sender"] == "user";
    final bubbleColor = isUser ? accent : receivedBg;
    final textColor = isUser ? Colors.white : Color(0xFF231531);

    // Support image messages
    if (msg.containsKey("img")) {
      return Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  msg["img"],
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      );
    }

    // Text message bubble
    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            decoration: BoxDecoration(
              color: isUser ? primaryColor : Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment:
                  isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  msg["msg"],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  msg["time"] ?? '',
                  style: TextStyle(
                    color: isUser ? Colors.white60 : Color(0xFFA29EA3),
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            buildCustomAppBar(context),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 14),
                itemCount: messages.length,
                itemBuilder: (context, index) => buildMessage(messages[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 13),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: inputBg,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Color(0xFFE5E5E5)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: "Ask us anything...",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 0,
                                ),
                              ),
                              minLines: 1,
                              maxLines: 4,
                            ),
                          ),
                          InkWell(
                            onTap: _sendImage,
                            child: SvgPicture.asset("assets/icons/camera.svg"),
                          ),
                          SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Material(
                    color: accent,
                    borderRadius: BorderRadius.circular(22),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(22),
                      onTap: () => _sendMessage(_controller.text),
                      child: SvgPicture.asset("assets/icons/send_message.svg"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
