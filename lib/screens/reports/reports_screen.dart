import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intern_task_tracker/utils/app_theme.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports & Performance')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPerformanceCard(),
            const SizedBox(height: 20),
            _buildTaskCompletionChart(),
            const SizedBox(height: 20),
            _buildWeeklyProductivityChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceCard() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overall Performance', style: TextStyle(color: Colors.white70, fontSize: 16)),
            SizedBox(height: 8),
            Text('87%', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
            Text('Excellent performance this month!', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCompletionChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Task Completion', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const Center(
                    child: Text(
                      '75%',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CircularProgressIndicator(
                    value: 0.75,
                    strokeWidth: 12,
                    backgroundColor: Colors.orange.shade100,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(Colors.green, 'Completed'),
                const SizedBox(width: 20),
                _buildLegendItem(Colors.orange, 'Pending'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyProductivityChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Weekly Productivity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            SizedBox(
              height: 150,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(color: Colors.grey, fontSize: 12);
                          String text;
                          switch (value.toInt()) {
                            case 0: text = 'W1'; break;
                            case 1: text = 'W2'; break;
                            case 2: text = 'W3'; break;
                            case 3: text = 'W4'; break;
                            case 4: text = 'W5'; break;
                            case 5: text = 'W6'; break;
                            case 6: text = 'W7'; break;
                            default: text = ''; break;
                          }
                          return SideTitleWidget(meta: meta, child: Text(text, style: style));
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    _makeBarData(0, 60), _makeBarData(1, 75),
                    _makeBarData(2, 65), _makeBarData(3, 85),
                    _makeBarData(4, 80), _makeBarData(5, 92),
                    _makeBarData(6, 88),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeBarData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: AppTheme.primaryColor,
          width: 15,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}