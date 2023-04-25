import 'package:flutter/material.dart';
import 'package:ilanam_assignment/Constants/AppColors.dart';

class DateSelectionWidget extends StatelessWidget {
  final bool isSelected;
  final DateTime date;
  final Function(DateTime) onCLick;

  const DateSelectionWidget(
      {Key? key,
      required this.isSelected,
      required this.date,
      required this.onCLick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCLick(date);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? AppColors.mainColor : AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getUpperText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color:
                      isSelected ? AppColors.whiteText : AppColors.blackText),
            ),
            Text(
              getBottonDateText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color:
                      isSelected ? AppColors.whiteText : AppColors.blackText),
            ),
          ],
        ),
      ),
    );
  }

  String getBottonDateText() {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sept',
      'Oct',
      'Nov',
      'Dec'
    ];
    return "${date.day} ${months[date.month - 1]}";
  }

  String getUpperText() {
    DateTime now = DateTime.now();
    print(now);
    if (date.day == now.day) {
      return "Today";
    } else if (date.day == DateTime(now.year, now.month, now.day + 1).day) {
      return "Tomorrow";
    } else if (date.day == DateTime(now.year, now.month, now.day + 2).day) {
      return "Overmorrow";
    } else {
      return "";
    }
  }
}
