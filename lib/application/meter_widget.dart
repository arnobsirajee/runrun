import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:runrun/application/user_data.dart';

class meter_widget extends StatelessWidget {
  const meter_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: AnimatedRadialGauge(
          duration: const Duration(milliseconds: 800),
          // valueeeeeeeeeeeeeeeeeee
          value: bmiCheck,

          axis: GaugeAxis(
            min: 10,    // meter start from
            max: 40,  //and max

            progressBar: const GaugeBasicProgressBar(
              color: Colors.transparent,
            ),
            style: const GaugeAxisStyle(
              thickness: 20,
              background: Colors.grey,
            ),

            pointer:  NeedlePointer(
              width: 10, height: 50,
              color: Colors.black,
            ),

            zones: [
              GaugeZone(
                from: 10,
                to: 18.4,
                color: Colors.redAccent,
                label: GaugeZoneLabel(text: "18.5"),
              ),
              GaugeZone(
                from: 18.5,
                to: 25,
                color: Colors.green,
                label: GaugeZoneLabel(text: "25"),
              ),
              GaugeZone(
                from: 25,
                to: 30,
                color: Colors.yellow,
                label: GaugeZoneLabel(text: "30"),
              ),
              GaugeZone(
                from: 30,
                to: 35,
                color: Colors.orangeAccent,
                label: GaugeZoneLabel(text: "35"),
              ),
              GaugeZone(
                from: 35,
                to: 40,
                color: Colors.red,
                label: GaugeZoneLabel(text: "40"),
              ),
            ],

          ),
        ),
      ),
    );
  }
}