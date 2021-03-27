import 'package:flutter/material.dart';
import 'package:time_chart/time_chart.dart';
import 'package:transportation2/config/theme.dart';

class SleepStatistic extends StatelessWidget {
  // Data must be sorted.
  final data = [
    DateTimeRange(
      start: DateTime(2021, 2, 25, 12, 00),
      end: DateTime(2021, 2, 25, 12, 45),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 24, 23, 15),
      end: DateTime(2021, 2, 25, 7, 30),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 22, 1, 55),
      end: DateTime(2021, 2, 22, 9, 12),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 20, 0, 25),
      end: DateTime(2021, 2, 20, 7, 34),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 17, 21, 23),
      end: DateTime(2021, 2, 18, 4, 52),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 13, 6, 32),
      end: DateTime(2021, 2, 13, 13, 12),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 1, 9, 32),
      end: DateTime(2021, 2, 1, 15, 22),
    ),
    DateTimeRange(
      start: DateTime(2021, 1, 22, 12, 10),
      end: DateTime(2021, 1, 22, 16, 20),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final sizedBox = const SizedBox(height: 16);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            sizedBox,
            const Text('Weekly amount chart'),
            TimeChart(
              data: data,
              chartType: ChartType.amount,
              viewMode: ViewMode.weekly,
              barColor: AppColors.blue,
            ),
          ],
        ),
      ),
    );
  }
}