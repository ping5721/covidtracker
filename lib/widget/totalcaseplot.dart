import 'package:covid/thaicasebydate.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Totalcaseplot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        child: FutureBuilder(
          future: getCasebyDate(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return Stack(
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: LineChart(
                      LineChartData(
                        lineTouchData: LineTouchData(
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Colors.black,
                          ),
                          touchCallback: (LineTouchResponse touchResponse) {},
                          handleBuiltInTouches: true,
                        ),
                        gridData: FlGridData(
                          drawHorizontalLine: true,
                          drawVerticalLine: true,
                          verticalInterval: 30,
                          horizontalInterval: 500,
                          show: true,
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            getTitles: (value) {
                              switch (value.toInt()) {
                                case 500:
                                  return '500';
                                case 1000:
                                  return '1000';
                                case 1500:
                                  return '1500';
                                case 2000:
                                  return '2000';
                                case 2500:
                                  return '2500';
                                case 3000:
                                  return '3000';
                                case 3500:
                                  return '3500';
                              }
                              return '';
                            },
                            margin: 10,
                            reservedSize: 30,
                          ),
                          bottomTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            left: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            right: BorderSide(
                              color: Colors.transparent,
                            ),
                            top: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              for (int i = 0; i < snapshot.data[0].length; i++)
                                FlSpot(
                                  double.parse(i.toString()),
                                  double.parse(snapshot.data[1][i].toString()),
                                ),
                            ],
                            isCurved: false,
                            colors: [
                              Colors.white,
                            ],
                            barWidth: 4,
                            isStrokeCapRound: true,
                            dotData: FlDotData(
                              show: false,
                            ),
                            belowBarData: BarAreaData(
                              show: false,
                            ),
                          ),
                          LineChartBarData(
                            spots: [
                              for (int i = 0; i < snapshot.data[0].length; i++)
                                FlSpot(
                                  double.parse(i.toString()),
                                  double.parse(snapshot.data[2][i].toString()),
                                ),
                            ],
                            isCurved: false,
                            colors: [
                              Colors.yellow,
                            ],
                            barWidth: 4,
                            isStrokeCapRound: true,
                            dotData: FlDotData(
                              show: false,
                            ),
                            belowBarData: BarAreaData(
                              show: false,
                            ),
                          ),
                          LineChartBarData(
                            spots: [
                              for (int i = 0; i < snapshot.data[0].length; i++)
                                FlSpot(
                                  double.parse(i.toString()),
                                  double.parse(snapshot.data[3][i].toString()),
                                ),
                            ],
                            isCurved: false,
                            colors: [
                              Colors.green[500],
                            ],
                            barWidth: 4,
                            isStrokeCapRound: true,
                            dotData: FlDotData(
                              show: false,
                            ),
                            belowBarData: BarAreaData(
                              show: false,
                            ),
                          ),
                          LineChartBarData(
                            spots: [
                              for (int i = 0; i < snapshot.data[0].length; i++)
                                FlSpot(
                                  double.parse(i.toString()),
                                  double.parse(snapshot.data[4][i].toString()),
                                ),
                            ],
                            isCurved: false,
                            colors: [
                              Colors.teal,
                            ],
                            barWidth: 4,
                            isStrokeCapRound: true,
                            dotData: FlDotData(
                              show: false,
                            ),
                            belowBarData: BarAreaData(
                              show: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.7, 0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total case",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Recovered",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Hospitalized",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Death",
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              );
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Container();
          },
        ),
      ),
    );
  }
}
