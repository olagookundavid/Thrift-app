import 'package:flutter/material.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_input_fields.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController accountname = TextEditingController();
    final TextEditingController accountNo = TextEditingController();
    final TextEditingController depositorname = TextEditingController();
    final TextEditingController depositorPhoneNo = TextEditingController();

    String? selectedBank, paymentMode;
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
            'Create Customer Account',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(
                flex: 2,
              ),
              TextInputField(
                  hintText: "Account Name",
                  controller: accountname,
                  isbold: true,
                  color: const Color(0xFFE5E5E5)),
              const SizedBox(
                height: 10,
              ),
              TextNumInputField(
                  hintText: "Account Number",
                  controller: accountNo,
                  color: const Color(0xFFE5E5E5)),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 8),
                child: Row(
                  children: const [
                    Text(
                      'Bank',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Spacer()
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedBank ?? "UBA",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      DropdownButton(
                          menuMaxHeight: 50,
                          dropdownColor: Colors.white,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 40,
                          ),
                          underline: Container(),
                          onChanged: (value) {
                            setState(() {
                              selectedBank = value.toString();
                              // ignore: avoid_print
                              print(selectedBank);
                            });
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'UBA',
                              child: Text(
                                'UBA',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '',
                              child: Text(
                                '',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextInputField(
                hintText: "Depositor Name",
                controller: depositorname,
                color: const Color(0xFFE5E5E5),
                isbold: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextNumInputField(
                hintText: "Depositor Phone Number",
                controller: depositorPhoneNo,
                color: const Color(0xFFE5E5E5),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 8),
                child: Row(
                  children: const [
                    Text(
                      'Mode of Payment',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        paymentMode ?? 'Cash',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      DropdownButton(
                          menuMaxHeight: 50,
                          dropdownColor: Colors.white,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 40,
                          ),
                          underline: Container(),
                          onChanged: (value) {
                            setState(() {
                              paymentMode = value.toString();
                            });
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'Cash',
                              child: Text(
                                'Cash',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '',
                              child: Text(
                                '',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              ClickableButton(press: () {}, text: 'Transfer'),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Thrift safely with us',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: double.infinity,
                height: 10,
              ),
            ],
          ),
        ));
  }
}
