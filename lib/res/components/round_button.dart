import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.height = 50,
    this.width = 60,
    this.loading = false,
    this.textColor = AppColors.primaryTextColor,
    this.buttonColor = AppColors.primaryButtonColor,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
