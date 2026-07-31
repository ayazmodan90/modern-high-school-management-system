import 'package:flutter/material.dart';

class FeeSummaryCard extends StatelessWidget {
  final double totalFees;
  final double paidFees;
  final double pendingFees;
  final String dueDate;

  const FeeSummaryCard({
    super.key,
    required this.totalFees,
    required this.paidFees,
    required this.pendingFees,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Text(
              "Fee Summary",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            _buildRow(
              "Total Fees",
              "₹${totalFees.toStringAsFixed(0)}",
              Colors.blue,
            ),

            const SizedBox(height: 12),

            _buildRow(
              "Paid",
              "₹${paidFees.toStringAsFixed(0)}",
              Colors.green,
            ),

            const SizedBox(height: 12),

            _buildRow(
              "Pending",
              "₹${pendingFees.toStringAsFixed(0)}",
              Colors.red,
            ),

            const Divider(height: 35),

            Row(
              children: [

                const Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                ),

                const SizedBox(width: 10),

                const Text(
                  "Due Date",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const Spacer(),

                Text(
                  dueDate,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildRow(
      String title,
      String value,
      Color color,
      ) {
    return Row(
      children: [

        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),

        const Spacer(),

        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }
}