import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:who_app/constants.dart';

class RecentNumbersGraph extends StatefulWidget {
  const RecentNumbersGraph({
    Key key,
    this.timeseries,
    this.timeseriesKey,
  }) : super(key: key);

  final List timeseries;
  final String timeseriesKey;

  @override
  _RecentNumbersGraphState createState() => _RecentNumbersGraphState();
}

class _RecentNumbersGraphState extends State<RecentNumbersGraph> {
  final startDate = DateTime.utc(2020, 1, 1);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        axisTitleData: FlAxisTitleData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        clipToBorder: false,
        gridData: FlGridData(
          getDrawingVerticalLine: (
            double a,
          ) {
            return FlLine(
              strokeWidth: .25,
              color: Constants.neutral2Color,
            );
          },
          show: true,
          drawVerticalLine: true,
          drawHorizontalLine: true,
          horizontalInterval: horizontalInterval(),
          verticalInterval: verticalInterval(),
        ),
        lineBarsData: [
          LineChartBarData(
            barWidth: 6,
            colors: [
              Constants.primaryColor,
            ],
            dotData: FlDotData(
              show: false,
            ),
            isCurved: false,
            isStrokeCapRound: true,
            spots: _buildSpots(),
          ),
        ],
        lineTouchData: LineTouchData(enabled: false),
        titlesData: FlTitlesData(show: false),
      ),
      swapAnimationDuration: Duration(milliseconds: 750),
    );
  }

  double verticalInterval() {
    double total = 0;
    if (widget.timeseries != null) {
      for (var snapshot in widget.timeseries) {
        try {
          var xAxis = DateTime.fromMillisecondsSinceEpoch(snapshot['epochMsec'],
                  isUtc: true)
              .difference(startDate)
              .inHours
              .toDouble();
          if (xAxis > total) {
            total = xAxis;
          }
          // var yAxis = snapshot[widget.timeseriesKey].toDouble();
          // spots.add(FlSpot(xAxis, yAxis));
        } catch (e) {
          print('Error adding point for snapshot: $e');
        }
      }
    } else {
      final int daysSinceStart =
          DateTime.now().toUtc().difference(startDate).inDays;
      total = daysSinceStart.toDouble();
    }
    return total / 8;
  }

  double horizontalInterval() {
    double total = 0;
    if (widget.timeseries != null) {
      for (var snapshot in widget.timeseries) {
        try {
          double yAxis = snapshot[widget.timeseriesKey].toDouble();
          if (yAxis > total) {
            total = yAxis;
          }
        } catch (e) {
          print('Error adding point for snapshot: $e');
        }
      }
    } else {
      total = 0;
    }
    return total / 4;
  }

  List<FlSpot> _buildSpots() {
    var spots = <FlSpot>[];
    if (widget.timeseries != null) {
      for (var snapshot in widget.timeseries) {
        try {
          var xAxis = DateTime.fromMillisecondsSinceEpoch(snapshot['epochMsec'],
                  isUtc: true)
              .difference(startDate)
              .inHours
              .toDouble();
          var yAxis = snapshot[widget.timeseriesKey].toDouble();
          spots.add(FlSpot(xAxis, yAxis));
        } catch (e) {
          print('Error adding point for snapshot: $e');
        }
      }
    } else {
      final daysSinceStart =
          DateTime.now().toUtc().difference(startDate).inDays;
      for (int i = 0; i < daysSinceStart; i++) {
        spots.add(FlSpot((i * 24).toDouble(), 0.0));
      }
    }
    return spots;
  }
}
