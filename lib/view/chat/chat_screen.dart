import 'package:admin/application/Chat/chat_cubit.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/domain/chat/chat_model.dart';
import 'package:admin/view/chat/widgets/single_message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminChatScreen extends StatefulWidget {
  final String userName;
  final String userId;
  final String? userImage;

  const AdminChatScreen({
    Key? key,
    required this.userName,
    required this.userId,
    this.userImage,
  }) : super(key: key);

  @override
  State<AdminChatScreen> createState() => _AdminChatScreenState();
}

class _AdminChatScreenState extends State<AdminChatScreen> {
  late TextEditingController _messageController;

  @override
  void initState() {
    BlocProvider.of<ChatCubit>(context).getAllMessages(
      userId: widget.userId,
    );
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 90),
                  child: ListView.builder(
                    reverse: true,
                    itemBuilder: ((context, index) {
                      Chat chat = state.currentUserMsgs[index];
                      return SingleMessageWidget(
                        chat: chat,
                        index: index,
                      );
                    }),
                    itemCount: state.currentUserMsgs.length,
                  ),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 5,
              ),
              height: 80,
              decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: widget.userImage != null
                        ? Image.network(
                            widget.userImage!,
                            fit: BoxFit.cover,
                            width: 35,
                            height: 35,
                          )
                        : const SizedBox(
                            width: 35,
                            height: 35,
                            child: Icon(Icons.person),
                          ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.userName,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                width: MediaQuery.of(context).size.width - 40,
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type something...',
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_messageController.text.isNotEmpty) {
                          final message = Chat(
                            message: _messageController.text.trim(),
                            time: Timestamp.now(),
                            isAdmin: true,
                            userId: widget.userId,
                          );
                          BlocProvider.of<ChatCubit>(context).addMessage(
                            message: message,
                          );
                          _messageController.text = '';
                        }
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 18, 46, 70),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Align(
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(-40 / 360),
                            child: Icon(
                              Icons.send_rounded,
                              color: kWhite,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
