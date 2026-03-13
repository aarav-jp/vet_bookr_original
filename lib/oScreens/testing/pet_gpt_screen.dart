import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../../constant.dart';

class PetGPTScreen extends StatefulWidget {
  const PetGPTScreen({super.key});

  @override
  State<PetGPTScreen> createState() => _PetGPTScreenState();
}

class _PetGPTScreenState extends State<PetGPTScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, String>> messages = [];

  bool isLoading = false;

  /// Auto Scroll
  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add({"role": "user", "content": text});
      isLoading = true;
    });

    _controller.clear();

    scrollToBottom();

    try {
      final response = await http.post(
        Uri.parse('https://llamaaimodel.cto-ee4.workers.dev/pet'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer HelloTest',
        },
        body: jsonEncode({"question": text}),
      );

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        final data = jsonDecode(decodedBody);

        setState(() {
          messages.add({
            "role": "assistant",
            "content": data["answer"] ?? "No response"
          });
        });
      } else {
        setState(() {
          messages.add({
            "role": "assistant",
            "content": "Server error: ${response.statusCode}"
          });
        });
      }
    } catch (e) {
      setState(() {
        messages.add({"role": "assistant", "content": "Something went wrong."});
      });
    }

    setState(() {
      isLoading = false;
    });

    scrollToBottom();
  }

  Widget chatBubble(String text, bool isUser) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.01.sh),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
            padding: EdgeInsets.all(12.sp),
            constraints: BoxConstraints(maxWidth: 0.75.sw),
            decoration: BoxDecoration(
              color: isUser ? const Color(0xffFF8B6A) : const Color(0xffFAEEE2),
              borderRadius: BorderRadius.circular(14.sp),
            ),
            child: MarkdownBody(
                data: text.replaceAll(r'\n', '\n'),
              selectable: false,
              styleSheet: MarkdownStyleSheet(
                p: TextStyle(
                  fontSize: 14.sp,
                  height: 1.4,
                  color: isUser ? Colors.white : Colors.black87,
                ),
                strong: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: isUser ? Colors.white : Colors.black87
                ),
                listBullet: TextStyle(
                  fontSize: 14.sp,
                  color: isUser ? Colors.white : Colors.black87
                )
              ),
            )
            // Text(
            //   text.replaceAll(r'\n', '\n'),
            //   softWrap: true,
            //   style: TextStyle(
            //     fontSize: 14.sp,
            //     height: 1.4,
            //     color: isUser ? Colors.white : Colors.black87,
            //   ),
            // ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: kBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        height: h,
        width: w,
        child: Column(
          children: [
            SizedBox(height: 10.h),

            Text(
              "PetGPT",
              style: TextStyle(
                color: const Color(0xffF08714),
                fontSize: 0.05.sw,
              ),
            ),

            SizedBox(height: 10.h),

            /// Chat messages
            Expanded(
              child: messages.isEmpty
                  ? Center(
                      child: Text(
                        "Ask anything about your pet 🐶",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.only(bottom: 10.h),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];

                        return chatBubble(
                          msg["content"]!,
                          msg["role"] == "user",
                        );
                      },
                    ),
            ),

            if (isLoading)
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: const CircularProgressIndicator(
                  color: Color(0xffFF8B6A),
                ),
              ),

            /// Input area
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.04.sw,
                vertical: 0.01.sh,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (value) {
                        sendMessage(value);
                      },
                      decoration: InputDecoration(
                        hintText: "Ask PetGPT...",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CircleAvatar(
                    backgroundColor: const Color(0xffFF8B6A),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        sendMessage(_controller.text);
                      },
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 10.h)
          ],
        ),
      ),
    );
  }
}
