import 'package:flutter/material.dart';

class MarksTable extends StatelessWidget {
  final List<Map<String, dynamic>> marks;

  const MarksTable({
    super.key,
    required this.marks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            const Text(
              "Subject-wise Marks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            Table(
              border: TableBorder.symmetric(
                inside: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),

              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },

              children: [

                const TableRow(
                  children: [

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Subject",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Marks",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Grade",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                ),

                ...marks.map(
                      (subject) => TableRow(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(subject["subject"]),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          subject["marks"].toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          subject["grade"],
                          textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}