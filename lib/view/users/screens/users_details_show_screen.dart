import 'package:admin/core/constants/colors.dart';
import 'package:admin/domain/user/user_model.dart';
import 'package:admin/view/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowUserDetailsScreen extends StatelessWidget {
  const ShowUserDetailsScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: user.profilePicUrl != null
                                  ? Image.network(
                                      user.profilePicUrl!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset('lib/core/assets/images/Man-Icon.png'),
                            ),
                            const SizedBox(height: 20),
                            UserDetailItemWidget(
                              keyword: 'Name',
                              value: user.name,
                            ),
                            UserDetailItemWidget(
                              keyword: 'Mobile',
                              value: user.mobile,
                            ),
                            UserDetailItemWidget(
                              keyword: 'Email Id',
                              value: user.email,
                            ),
                            UserDetailItemWidget(
                              keyword: 'User Id',
                              value: user.userId,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          left: 5,
                          right: 5,
                          bottom: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(primary: kYellow),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.block,
                                color: kWhite,
                              ),
                              label: const Text(
                                'Block User',
                                style: TextStyle(color: kWhite),
                              ),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(primary: kYellow),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) => AdminChatScreen(
                                          userName: user.name,
                                          userId: user.userId,
                                          userImage: user.profilePicUrl,
                                        )),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.message,
                                color: kWhite,
                              ),
                              label: const Text(
                                'Chat',
                                style: TextStyle(color: kWhite),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailItemWidget extends StatelessWidget {
  const UserDetailItemWidget({
    Key? key,
    required this.keyword,
    required this.value,
  }) : super(key: key);

  final String keyword;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$keyword : ',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
