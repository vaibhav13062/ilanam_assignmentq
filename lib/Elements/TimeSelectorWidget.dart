import 'package:flutter/material.dart';
import 'package:ilanam_assignment/Constants/TimeSlots.dart';

import '../Constants/AppColors.dart';

class TimeSelectorWidget extends StatelessWidget {
  final bool isMorning;
  final String? selectedSlot;
  final Function(String) onSelect;

  const TimeSelectorWidget(
      {Key? key,
      required this.isMorning,
      this.selectedSlot,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isMorning ? "Morning" : "Afternoon",
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.blackText),
        ),
        const SizedBox(
          height: 10,
        ),
        PopupMenuButton(
          onSelected: (v) {
            onSelect(v);
          },
          itemBuilder: (BuildContext context) {
            return getListOfTimeSlot();
          },
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white),
            child: Row(
              children: [
                Expanded(child: Text(selectedSlot ?? "Select Time")),
                const Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          ),
        )
      ],
    );
  }

  List<PopupMenuItem> getListOfTimeSlot() {
    List<PopupMenuItem> list = [];
    if (isMorning) {
      for (var value in TimeSlots().morning) {
        list.add(PopupMenuItem(
          child: Text(value),
          value: value,
        ));
      }
    } else {
      for (var value in TimeSlots().afternoon) {
        list.add(PopupMenuItem(
          child: Text(value),
          value: value,
        ));
      }
    }
    return list;
  }
}
