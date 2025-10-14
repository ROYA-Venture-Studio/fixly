import 'package:fixly/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ---- Model Classes ----
class PaymentTransaction {
  final String userName;
  final String userImage;
  final DateTime datetime;
  final double amount;
  final bool received; // true == income, false == out
  final String iconBg;

  PaymentTransaction({
    required this.userName,
    required this.userImage,
    required this.datetime,
    required this.amount,
    required this.received,
    required this.iconBg,
  });
}

// ---- Payments List Screen ----
class PaymentsScreen extends StatelessWidget {
  PaymentsScreen({super.key});
  final List<PaymentTransaction> transactions = [
    PaymentTransaction(
      userName: "Jacob Jone",
      userImage: "https://via.placeholder.com/48", // use asset or network
      datetime: DateTime(2025, 8, 10, 15, 0),
      amount: 12.0,
      received: false,
      iconBg: "assets/icons/added_payment.svg",
    ),
    PaymentTransaction(
      userName: "Jacob Jone",
      userImage: "https://via.placeholder.com/48/FFCCCC",
      datetime: DateTime(2025, 8, 10, 15, 0),
      amount: -12.0,
      received: true,
      iconBg: "assets/icons/sub_payment.svg",
    ),
    PaymentTransaction(
      userName: "Jacob Jone",
      userImage: "https://via.placeholder.com/48/FFCCCC",
      datetime: DateTime(2025, 8, 10, 15, 0),
      amount: 12.0,
      received: true,
      iconBg: "assets/icons/rotate_payment.svg",
    ),
  ];

  final double walletBalance = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 12, bottom: 24),
              child: Row(
                children: [
                  Text(
                    "Payments",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  spacing: 8,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xffEEEEEE),
                      child: SvgPicture.asset(
                        "assets/icons/payments_nav.svg",
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wallet Balance",
                          style: TextStyle(color: Color(0xFF948EA4)),
                        ),
                        Row(
                          children: [
                            Text(
                              "USD",
                              style: TextStyle(
                                color: Color(0xFF948EA4),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 9),
                            Text(
                              walletBalance.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF39303C),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18, 22, 0, 14),
              child: Row(
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(
                      color: Color(0xFF7A7692),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 0),
                itemCount: transactions.length,
                separatorBuilder: (_, __) => SizedBox(height: 13),
                itemBuilder: (context, idx) {
                  final tx = transactions[idx];
                  return GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    TransactionDetailsScreen(transaction: tx),
                          ),
                        ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Color(0xFFE9ECEF)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                      child: Row(
                        children: [
                          SvgPicture.asset(tx.iconBg),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx.userName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "${_formatDate(tx.datetime)}",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "${tx.received ? '' : '- '}\$${tx.amount.abs().toStringAsFixed(2)}",
                            style: TextStyle(
                              color:
                                  tx.received
                                      ? Color(0xFF39303C)
                                      : Color(0xFF39303C),
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    // e.g. Aug 10, 2025 3:00 PM
    return "${_monthName(dt.month)} ${dt.day}, ${dt.year}  ${_timeFormat(dt)}";
  }

  String _monthName(int m) {
    const months = [
      "",
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[m];
  }

  String _timeFormat(DateTime dt) {
    int hour =
        dt.hour > 12
            ? dt.hour - 12
            : dt.hour == 0
            ? 12
            : dt.hour;
    String ampm = dt.hour >= 12 ? "PM" : "AM";
    return "$hour:${dt.minute.toString().padLeft(2, '0')} $ampm";
  }
}

// ---- Transaction Details ----
class TransactionDetailsScreen extends StatelessWidget {
  final PaymentTransaction transaction;

  const TransactionDetailsScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 12, bottom: 7),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset("assets/icons/back.svg"),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Transaction Details",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
              decoration: BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(14),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 9,
                  horizontal: 10,
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Image.asset(
                    "assets/images/hero_clean.jpg",
                    width: 52,
                    height: 52,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  transaction.userName,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                subtitle: Text(
                  "Handyman",
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
                trailing: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFF51B77D),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Paid",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_formatDate(transaction.datetime)}",
                    style: TextStyle(fontSize: 15, color: Color(0xFF948EA4)),
                  ),
                  Text(
                    "Req #2335",
                    style: TextStyle(fontSize: 15, color: Color(0xFF948EA4)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 19),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: EdgeInsets.symmetric(vertical: 23, horizontal: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "USD",
                        style: TextStyle(
                          color: Color(0xFF948EA4),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 9),
                      Text(
                        transaction.amount.abs().toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF39303C),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment method",
                        style: TextStyle(color: Color(0xFF948EA4)),
                      ),
                      Text(
                        "Wallet",
                        style: TextStyle(
                          color: Color(0xFF39303C),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/download.svg"),
                label: Text(
                  "Download Invoice",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return "${_monthName(dt.month)} ${dt.day}, ${dt.year}  ${_timeFormat(dt)}";
  }

  String _monthName(int m) {
    const months = [
      "",
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[m];
  }

  String _timeFormat(DateTime dt) {
    int hour =
        dt.hour > 12
            ? dt.hour - 12
            : dt.hour == 0
            ? 12
            : dt.hour;
    String ampm = dt.hour >= 12 ? "PM" : "AM";
    return "$hour:${dt.minute.toString().padLeft(2, '0')} $ampm";
  }
}
