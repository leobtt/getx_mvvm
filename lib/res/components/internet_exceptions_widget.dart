import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/colors.dart';
import 'package:get/get.dart';

class InternetExceptionsWidget extends StatefulWidget {
  const InternetExceptionsWidget({Key? key, required this.onPress})
      : super(key: key);

  final VoidCallback onPress;

  @override
  _InternetExceptionsWidgetState createState() =>
      _InternetExceptionsWidgetState();
}

class _InternetExceptionsWidgetState extends State<InternetExceptionsWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height * .15),
          const Icon(Icons.cloud_off, color: AppColors.redColor),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Text('internet_exception'.tr, textAlign: TextAlign.center),
            ),
          ),
          SizedBox(height: height * .15),
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'retry'.tr,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
