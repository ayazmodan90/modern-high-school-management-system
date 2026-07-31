import 'package:flutter/material.dart';

import 'payment_status_chip.dart';

class PaymentHistoryTile extends StatelessWidget {
  final double amount;
  final String date;
  final String status;
  final String transactionId;

  const PaymentHistoryTile({
    super.key,
    required this.amount,
    required this.date,
    required this.status,
    required this.transactionId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: const Icon(
            Icons.payments_outlined,
            color: Colors.blue,
          ),
        ),
        title: Text(
          "₹${amount.toStringAsFixed(0)}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text("Date: $date"),
            Text(
              "Transaction ID: $transactionId",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: PaymentStatusChip(
          status: status,
        ),
      ),
    );
  }
}