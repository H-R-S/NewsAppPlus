import 'package:flutter/material.dart';

class GradientLabelButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color labelColor;
  final double width;
  final double height;
  final Gradient gradient;

  GradientLabelButton(
      {required this.onPressed,
      required this.icon,
      required this.label,
      required this.labelColor,
      this.width = double.infinity,
      this.height = 55.0,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: gradient,
        ),
        child: Material(
          color: Colors.transparent,
          child: ElevatedButton.icon(
              style: ButtonStyle(
                alignment: Alignment.centerLeft,
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: onPressed,
              icon: Icon(
                icon,
                size: 35,
              ),
              label: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  label,
                  style: TextStyle(
                      color: labelColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )),
        ));
  }
}
