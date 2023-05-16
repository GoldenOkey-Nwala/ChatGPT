import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/spacers.dart';
import '../services/assets.dart';
import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.msg,
    required this.chatIndex,
  });

  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              chatIndex == 0 ? Assets.userImage : Assets.botImage,
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: TextWidget(label: msg),
            ),
            chatIndex == 0
                ? const SizedBox.shrink()
                : Row(children: [
                    widthSpace(5),
                    const Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.white,
                    ),
                    widthSpace(5),
                    const Icon(
                      Icons.thumb_down_alt_outlined,
                      color: Colors.white,
                    ),
                  ])
          ],
        ),
      ),
    ]);
  }
}
