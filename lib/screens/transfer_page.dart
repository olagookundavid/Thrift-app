// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrift_project/resources/dialogues.dart';
import 'package:thrift_project/services/transfer_service.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_input_fields.dart';

String? selectedBank, paymentMode;

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController cardno = TextEditingController();
    final TextEditingController accountNo = TextEditingController();
    final TextEditingController receivername = TextEditingController();
    final TextEditingController receiveraccno = TextEditingController();
    final TextEditingController amountno = TextEditingController();

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
            'Transfer',
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
              Stack(
                children: [
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [getBankDropdown()],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextNumInputField(
                  hintText: "Card Number",
                  controller: cardno,
                  isbold: true,
                  color: const Color(0xFFE5E5E5)),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              TextInputField(
                hintText: "Receiver Account Name",
                controller: receivername,
                color: const Color(0xFFE5E5E5),
                isbold: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextNumInputField(
                hintText: "Receiver Account Number",
                controller: receiveraccno,
                color: const Color(0xFFE5E5E5),
              ),
              const SizedBox(
                height: 10,
              ),
              TextNumInputField(
                  hintText: "Amount",
                  controller: amountno,
                  color: const Color(0xFFE5E5E5),
                  isbold: true),
              // Padding(
              //   padding: const EdgeInsets.only(left: 5, right: 5, bottom: 8),
              //   child: Row(
              //     children: const [
              //       Text(
              //         'Mode of Payment',
              //         style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.black),
              //       ),
              //       Spacer(),
              //     ],
              //   ),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.05,
              //   color: Colors.black,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 10),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           paymentMode ?? 'Cash',
              //           style: const TextStyle(
              //             color: Colors.white,
              //           ),
              //         ),
              //         getPaymentModeDropdown()
              //       ],
              //     ),
              //   ),
              // ),
              const Spacer(
                flex: 3,
              ),
              ClickableButton(
                  press: () async {
                    bool isTransfer = await TransferService().transfer(
                        accountNo.text,
                        receiveraccno.text,
                        receivername.text,
                        amountno.text,
                        cardno.text,
                        selectedBank ?? '');
                    if (isTransfer) {
                      await successDialog(context, 'Transfer successful');
                    } else {
                      await showErrorDialog(context, 'Transfer failed');
                    }
                  },
                  text: 'Transfer'),
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

  DropdownButton<String> getBankDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String bank in banksList) {
      var newItem = DropdownMenuItem(
        value: bank,
        child: Text(bank),
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      menuMaxHeight: MediaQuery.of(context).size.height * .4,
      dropdownColor: Colors.grey[300],
      underline: Container(),
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedBank = value;
        });
      },
    );
  }

  DropdownButton<String> getPaymentModeDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String mode in payModeList) {
      var newItem = DropdownMenuItem(
        value: mode,
        child: Text(mode),
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      menuMaxHeight: MediaQuery.of(context).size.height * .2,
      dropdownColor: Colors.grey[300],
      underline: Container(),
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          paymentMode = value;
        });
      },
    );
  }
}

const List<String> payModeList = [
  'cash',
];

const List<String> banksList = [
  'Access Bank',
  'Fidelity Bank',
  'FCMB',
  'First Bank',
  'GTB',
  'Union Bank of Nigeria',
  'UBA',
  'Zenith Bank',
  'Citibank',
  'Ecobank',
  'Heritage Bank',
  'Keystone Bank',
  'Polaris Bank',
  'Stanbic IBTC Bank',
  'Standard Chartered',
  'Sterling Bank',
  'Titan Trust Bank',
  'Unity Bank',
  'Wema Bank',
  'Globus Bank',
  'Parallex Bank',
  'Providus Bank',
  'SunTrust Bank',
  'Jaiz Bank Plc',
  'LOTUS BANK',
  'TAJBank Limited',
  'Mutual Trust Microfinance',
  'Rephidim Microfinance',
  'Shepherd Trust Microfinance',
  'Empire Trust Microfinance',
  'Finca Microfinance',
  'Fina Trust Microfinance',
  'Accion Microfinance',
  'Peace Microfinance',
  'Infinity Microfinance',
  'Pearl Microfinance',
  'Covenant Microfinance',
  'Advans La Fayette Microfinance',
  'Sparkle Bank',
  'Kuda Bank',
  'Rubies Bank',
  'VFD Microfinance Bank',
  'Mint Finex MFB',
  'Mkobo MFB',
  'Coronation Merchant Bank',
  'FBNQuest',
  'Merchant Bank',
  'FSDH Merchant Bank',
  'Rand Merchant Bank',
  'Nova Merchant Bank'
];
