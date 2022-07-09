import 'package:admin/application/Chat/chat_cubit.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/domain/chat/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SingleMessageWidget extends StatelessWidget {
  const SingleMessageWidget({
    Key? key,
    required this.chat,
    required this.index,
  }) : super(key: key);
  final Chat chat;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: chat.isAdmin ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        GestureDetector(
          onLongPress: () {
            showDeleteDialog(
              context: context,
              chat: chat,
              lastMsg: index == 0,
            );
          },
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 6,
                  bottom: 20,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                constraints: const BoxConstraints(
                  maxWidth: 250,
                  minWidth: 120,
                ),
                decoration: BoxDecoration(
                  color: chat.isAdmin ? const Color.fromARGB(255, 17, 71, 116) : kWhite,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(18),
                    bottomRight: chat.isAdmin ? const Radius.circular(0) : const Radius.circular(18),
                    topLeft: chat.isAdmin ? const Radius.circular(18) : const Radius.circular(0),
                    topRight: const Radius.circular(18),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.message,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: chat.isAdmin ? kWhite : kBlack,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 12,
                right: 35,
                child: Text(
                  DateFormat('hh:mm a').format(chat.time.toDate()),
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    color: kGray,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Future<dynamic> showDeleteDialog({required BuildContext context, required Chat chat, required bool lastMsg}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Delete this message?',
            style: GoogleFonts.nunito(
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'No',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: kBlack,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<ChatCubit>(context).deleteChat(
                    message: chat,
                    isLast: lastMsg,
                  );
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Yes',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
