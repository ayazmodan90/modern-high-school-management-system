import 'package:flutter/material.dart';

class TimetableDaySelector extends StatelessWidget {
  final List<String> days;
  final int selectedIndex;
  final Function(int) onDaySelected;

  const TimetableDaySelector({
    super.key,
    required this.days,
    required this.selectedIndex,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onDaySelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.blue
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                days[index],
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}