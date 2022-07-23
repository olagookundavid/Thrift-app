// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrift_project/resources/dialogues.dart';
import 'package:thrift_project/services/withdrawal_service.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_input_fields.dart';

class WithdrawalPage extends StatelessWidget {
  WithdrawalPage({Key? key}) : super(key: key);
  final TextEditingController cardNo = TextEditingController();
  final TextEditingController amountNo = TextEditingController();
  final TextEditingController accountNo = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Back',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Enter Withdrawal',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              TextNumInputField(
                hintText: 'Card Number',
                controller: cardNo,
                isbold: true,
              ),
              const SizedBox(
                height: 15,
              ),
              TextNumInputField(
                hintText: 'Account Number  (optional)',
                controller: accountNo,
                isbold: false,
              ),
              const SizedBox(
                height: 15,
              ),
              TextNumInputField(
                hintText: 'Amount',
                controller: amountNo,
              ),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 35,
                      color: Colors.red[50],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'For Amounts greater than 10,000\n    you should request approval.',
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                  ],
                ),
              ),
              ClickableButton(
                press: () async {
                  bool isWithdraw = await WithdrawalService()
                      .withdraw(cardNo.text, accountNo.text, amountNo.text);
                  if (isWithdraw) {
                    await successDialog(context, 'Withdrawal successful');
                  }
                  await showErrorDialog(context, 'Withdrawal failed');
                },
                text: 'Withdraw',
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ClickableButton(
                press: () async {
                  bool isapprovedsent = await WithdrawalService()
                      .withdraw(cardNo.text, accountNo.text, amountNo.text);
                  if (isapprovedsent) {
                    await successDialog(context, 'Approval sent successfully');
                  }
                  await showErrorDialog(context, 'Approval failed to send');
                },
                text: 'Request Approval',
              ),
              const Spacer(),
              const Image(image: AssetImage('assets/logo.png')),
              const SizedBox(height: 5),
              const Text(
                'Thrift safely with us',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
