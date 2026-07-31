import 'package:flutter/material.dart';

import '../widgets/fee_summary_card.dart';
import '../widgets/payment_history_tile.dart';

class FeesPage extends StatelessWidget {
  const FeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> payments = [
      {
        "amount": 20000.0,
        "date": "15 Jan 2026",
        "status": "Paid",
        "transactionId": "TXN100245",
      },
      {
        "amount": 15000.0,
        "date": "10 Jun 2026",
        "status": "Paid",
        "transactionId": "TXN100678",
      },
      {
        "amount": 15000.0,
        "date": "10 Aug 2026",
        "status": "Pending",
        "transactionId": "TXN101120",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fees"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const FeeSummaryCard(
              totalFees: 50000,
              paidFees: 35000,
              pendingFees: 15000,
              dueDate: "10 Aug 2026",
            ),

            const SizedBox(height: 24),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Payment History",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: payments.length,
              itemBuilder: (context, index) {
                final payment = payments[index];

                return PaymentHistoryTile(
                  amount: payment["amount"],
                  date: payment["date"],
                  status: payment["status"],
                  transactionId: payment["transactionId"],
                );
              },
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Receipt download feature coming soon...",
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.download),
                label: const Text(
                  "Download Latest Receipt",
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}