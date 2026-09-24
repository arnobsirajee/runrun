import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ConcentricProgressIndicator extends StatelessWidget {
final List<RingData> rings;
final double outermostRadius; // The radius of the largest, outer ring
final double lineWidth;       // Spacing/thickness of each line
final double ringSpacing;     // The visual gap between the rings
final Widget? child;          // Optional widget to place in the very center

const ConcentricProgressIndicator({
  Key? key,
  required this.rings,
  this.outermostRadius = 100.0,
  this.lineWidth = 10.0,
  this.ringSpacing = 4.0,
  this.child,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Dynamically generate rings from outer to inner
          ...List.generate(rings.length, (index) {
            final data = rings[index];

            // Calculate decreasing radius for each subsequent inner ring
            final currentRadius = outermostRadius - (index * (lineWidth + ringSpacing));

            // Prevent negative radius values if too many rings are passed
            if (currentRadius <= 0) return const SizedBox.shrink();

            return CircularPercentIndicator(
              radius: currentRadius,
              lineWidth: lineWidth,
              percent: data.percentage,
              progressColor: data.progressColor,
              backgroundColor: data.bgColor ?? data.progressColor.withOpacity(0.15),
              circularStrokeCap: CircularStrokeCap.round,
              startAngle: 180, // Matches your image alignment
              animation: true, // Animates smoothly on load
              animationDuration: 1200,
            );
          }),

          // Place the optional center widget (like text, avatar, or icon)
          if (child != null) child!,
        ],
      ),
    );
  }
}


class RingData{
  final double percentage;
  final Color progressColor;
  final Color? bgColor;

  RingData({
    required this.percentage, required this.progressColor,this.bgColor
  });


}