// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrift_project/local_storage/shared_preferences.dart';
import 'package:thrift_project/resources/dialogues.dart';
import 'package:thrift_project/screens/login/login_page.dart';
import 'package:thrift_project/notication/notification_screen.dart';
import 'package:thrift_project/widgets/action_tiles.dart';
import 'package:thrift_project/screens/transfer_page.dart';
import 'package:thrift_project/screens/withdrawal_page.dart';
import 'deposit_screen.dart';
import 'loan_collection_screen.dart';
import 'register_customer_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        return await exitDialog(context);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0XFF282C40),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.blueAccent[100],
              ),
              tooltip: 'Open Notifications',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const NotificationScreen()),
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: const Color(0XFF282C40),
              height: height * (2 / 3) - 100,
              width: width,
              child: Column(
                children: [
                  const Spacer(flex: 3),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionTile(
                        icon: Icons.home_outlined,
                        color: const Color(0XFF2875C4),
                        text: 'Register\nCustomer',
                        onpressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => RegisterCustomerPage()),
                            ),
                          );
                        },
                      ),
                      ActionTile(
                        icon: Icons.date_range_outlined,
                        color: const Color(0XFF4258C3),
                        text: 'Withdrawal',
                        onpressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => WithdrawalPage()),
                            ),
                          );
                        },
                      ),
                      ActionTile(
                        icon: Icons.money,
                        color: const Color(0XFF4F49C4),
                        text: 'Deposit',
                        onpressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => DepositPage()),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  const Spacer(flex: 2),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionTile(
                        icon: Icons.person_outline,
                        color: const Color(0XFF2875C4),
                        text: 'Logout',
                        onpressed: () async {
                          bool logout = await showLogoutDialog(context);
                          LoginSharedPreferences.clearPref();
                          if (logout) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: ((context) => const LoginPage()),
                              ),
                              (route) => false,
                            );
                          }
                        },
                      ),
                      ActionTile(
                        icon: Icons.warning_amber,
                        color: const Color(0XFF4258C3),
                        text: 'Loan\nCollection',
                        onpressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => LoanCollectionPage()),
                            ),
                          );
                        },
                      ),
                      ActionTile(
                        icon: Icons.check_circle_outline,
                        color: const Color(0XFF4F49C4),
                        text: 'Transfer',
                        onpressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => const TransferPage()),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3),
                  topRight: Radius.circular(3),
                ),
                color: Color(0XFF9D9D9D),
              ),
              height: height * (1 / 3),
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Image(image: AssetImage('assets/logo.png')),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Thrift safely with us',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
