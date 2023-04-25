import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ilanam_assignment/Constants/TimeSlots.dart';

class CollectionDeliveryProvider extends ChangeNotifier {
  DateTime? collectionDate;
  String? collectionMorningSlot;
  String? collectionAfternoonSlot;

  DateTime? deliveryDate;
  String? deliveryMorningSlot;
  String? deliveryAfternoonSlot;

  onContinue() {
    if (collectionDate == null) {
      Fluttertoast.showToast(msg: "Please select a collection date");
      return;
    }
    if (collectionAfternoonSlot == null && collectionMorningSlot == null) {
      Fluttertoast.showToast(msg: "Please select a collection time slot");
      return;
    }
    if (deliveryDate == null) {
      Fluttertoast.showToast(msg: "Please select a delivery date");
      return;
    }

    if (deliveryAfternoonSlot == null && deliveryMorningSlot == null) {
      Fluttertoast.showToast(msg: "Please select a delivery time slot");
      return;
    }

    if (collectionDate!.day == deliveryDate!.day) {
      if (collectionMorningSlot != null && deliveryMorningSlot != null) {
        if (collectionMorningSlot! == deliveryMorningSlot!) {
          Fluttertoast.showToast(
              msg: "Collection and Delivery time slot is same");
          return;
        }
      }

      if (collectionAfternoonSlot != null && deliveryAfternoonSlot != null) {
        if (collectionAfternoonSlot! == deliveryAfternoonSlot!) {
          Fluttertoast.showToast(
              msg: "Collection and Delivery time slot is same");
          return;
        }
      }
    }

    Fluttertoast.showToast(msg: "Success");
  }

  setCollectionTimeSlot(String value) {
    if (TimeSlots().morning.contains(value)) {
      //MORNING
      collectionMorningSlot = value;
      collectionAfternoonSlot = null;
    } else {
      //AFTERNOON
      collectionMorningSlot = null;
      collectionAfternoonSlot = value;
    }
    notifyListeners();
  }

  setDeliveryTimeSlot(String value) {
    if (TimeSlots().morning.contains(value)) {
      //MORNING
      deliveryMorningSlot = value;
      deliveryAfternoonSlot = null;
    } else {
      //AFTERNOON
      deliveryMorningSlot = null;
      deliveryAfternoonSlot = value;
    }

    notifyListeners();
  }

  selectCollectionDate(DateTime date) {
    if (collectionDate == null) {
      collectionDate = date;
      if (deliveryDate != null) {
        if (collectionDate!.day > deliveryDate!.day) {
          deliveryDate = null;
        }
      }
    } else {
      collectionDate = date;
      if (deliveryDate != null) {
        if (collectionDate!.day > deliveryDate!.day) {
          deliveryDate = null;
        }
      }
    }

    notifyListeners();
  }

  selectDeliveryDate(DateTime date) {
    if (deliveryDate == null) {
      deliveryDate = date;
      if (collectionDate != null) {
        if (deliveryDate!.day < collectionDate!.day) {
          collectionDate = null;
        }
      }
    } else {
      deliveryDate = date;
      if (collectionDate != null) {
        if (deliveryDate!.day < collectionDate!.day) {
          collectionDate = null;
        }
      }
    }

    // if (deliveryDate == null) {
    //   deliveryDate = date;
    // } else if (deliveryDate!.day == date.day) {
    //   deliveryDate = null;
    //
    //   if (collectionDate != null) {
    //     if (deliveryDate!.day < collectionDate!.day) {
    //       collectionDate = null;
    //       notifyListeners();
    //
    //
    //     }
    //   }
    // }

    notifyListeners();
  }

  bool isSelectedDelivery(DateTime date) {
    if (deliveryDate == null) {
      return false;
    } else {
      return deliveryDate!.day == date.day;
    }
  }

  bool isSelectedCollection(DateTime date) {
    if (collectionDate == null) {
      return false;
    } else {
      return collectionDate!.day == date.day;
    }
  }
}
