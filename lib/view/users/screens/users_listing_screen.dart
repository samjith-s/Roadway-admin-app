import 'package:admin/application/users/users_cubit.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/domain/user/user_model.dart';
import 'package:admin/view/pre_bookings/widgets/custom_search_field_widget.dart';
import 'package:admin/view/users/screens/users_details_show_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersListingScreen extends StatefulWidget {
  const UsersListingScreen({Key? key}) : super(key: key);

  @override
  State<UsersListingScreen> createState() => _UsersListingScreenState();
}

class _UsersListingScreenState extends State<UsersListingScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsersCubit>(context).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return Scaffold(
          //backgroundColor: Color.fromARGB(255, 213, 213, 223),
          appBar: AppBar(
            title: const Text('Total Users'),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: kBlack,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            elevation: 0,
          ),
          body: Column(
            children: [
              CustomSearchFieldWidget(
                hintText: 'search user',
                onChanged: (value) {
                  BlocProvider.of<UsersCubit>(context).searchUser(
                    searchKey: value,
                    allList: state.totalUsers,
                  );
                },
              ),
              const SizedBox(height: 20),
              state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state.isError
                      ? const Center(
                          child: Text('SomeThing went wrong check'),
                        )
                      : state.showSearchResult
                          ? state.userSearchResult.isNotEmpty
                              ? ConfigurableUserListViewWidget(
                                  usersList: state.userSearchResult,
                                )
                              : const Center(
                                  child: Text('SomeThing went wrong check'),
                                )
                          : state.totalUsers.isNotEmpty
                              ? ConfigurableUserListViewWidget(
                                  usersList: state.totalUsers,
                                )
                              : const Center(
                                  child: Text('SomeThing went wrong check'),
                                ),
            ],
          ),
        );
      },
    );
  }
}

class ConfigurableUserListViewWidget extends StatelessWidget {
  final List<UserModel> usersList;
  const ConfigurableUserListViewWidget({
    Key? key,
    required this.usersList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: ((context, index) {
          final user = usersList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => ShowUserDetailsScreen(
                        user: user,
                      )),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: darkGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: user.profilePicUrl != null
                        ? Image.network(
                            user.profilePicUrl!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext ctx, obj, _) {
                              return const SizedBox(
                                width: 50,
                                height: 50,
                              );
                            },
                          )
                        : const Icon(Icons.person),
                  ),
                  const SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: GoogleFonts.nunito(
                          fontSize: 15,
                          color: kWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        user.email,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: kWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
        separatorBuilder: (ctx, ind) {
          return const SizedBox(
            height: 8,
          );
        },
        itemCount: usersList.length,
      ),
    );
  }
}
