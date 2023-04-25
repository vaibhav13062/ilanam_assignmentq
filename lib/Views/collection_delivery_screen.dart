import 'package:flutter/material.dart';
import 'package:ilanam_assignment/Constants/AppColors.dart';
import 'package:ilanam_assignment/Elements/TimeSelectorWidget.dart';
import 'package:ilanam_assignment/Elements/date_selection_widget.dart';
import 'package:ilanam_assignment/Providers/CollectionDeliveryProvider.dart';
import 'package:provider/provider.dart';

class CollectionDeliveryScreen extends StatelessWidget {
  const CollectionDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            CollectionWidget(),
            SizedBox(
              height: 30,
            ),
            DeliveryWidget(),
          ],
        )),
      ),
    );
  }
}

class CollectionWidget extends StatelessWidget {
  const CollectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Select Collection Date & Time",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.blackText),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: DateSelectionWidget(
                isSelected: Provider.of<CollectionDeliveryProvider>(context)
                    .isSelectedCollection(DateTime.now()),
                date: DateTime.now(),
                onCLick: (date) {
                  Provider.of<CollectionDeliveryProvider>(context,
                          listen: false)
                      .selectCollectionDate(date);
                },
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: DateSelectionWidget(
                isSelected: Provider.of<CollectionDeliveryProvider>(context)
                    .isSelectedCollection(DateTime(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day + 1)),
                date: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 1),
                onCLick: (date) {
                  Provider.of<CollectionDeliveryProvider>(context,
                          listen: false)
                      .selectCollectionDate(date);
                },
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: DateSelectionWidget(
                isSelected: Provider.of<CollectionDeliveryProvider>(context)
                    .isSelectedCollection(DateTime(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day + 2)),
                date: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 2),
                onCLick: (date) {
                  Provider.of<CollectionDeliveryProvider>(context,
                          listen: false)
                      .selectCollectionDate(date);
                },
              ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: TimeSelectorWidget(
                selectedSlot: Provider.of<CollectionDeliveryProvider>(context)
                    .collectionMorningSlot,
                isMorning: true,
                onSelect: (value) {
                  Provider.of<CollectionDeliveryProvider>(context,
                          listen: false)
                      .setCollectionTimeSlot(value);
                },
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TimeSelectorWidget(
                selectedSlot: Provider.of<CollectionDeliveryProvider>(context)
                    .collectionAfternoonSlot,
                isMorning: false,
                onSelect: (value) {
                  Provider.of<CollectionDeliveryProvider>(context,
                          listen: false)
                      .setCollectionTimeSlot(value);
                },
              )),
            ],
          ),
        ],
      ),
    );
  }
}

class DeliveryWidget extends StatelessWidget {
  const DeliveryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Select Delivery Date & Time",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.blackText),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: DateSelectionWidget(
                isSelected: Provider.of<CollectionDeliveryProvider>(context)
                    .isSelectedDelivery(DateTime.now()),
                date: DateTime.now(),
                onCLick: (date) {
                  Provider.of<CollectionDeliveryProvider>(context,
                          listen: false)
                      .selectDeliveryDate(date);
                },
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: DateSelectionWidget(
                isSelected: Provider.of<CollectionDeliveryProvider>(context)
                    .isSelectedDelivery(DateTime(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day + 1)),
                date: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 1),
                onCLick: (date) {
                  Provider.of<CollectionDeliveryProvider>(context,
                          listen: false)
                      .selectDeliveryDate(date);
                },
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: DateSelectionWidget(
                isSelected: Provider.of<CollectionDeliveryProvider>(context)
                    .isSelectedDelivery(DateTime(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day + 2)),
                date: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day + 2),
                onCLick: (date) {
                  Provider.of<CollectionDeliveryProvider>(context,
                          listen: false)
                      .selectDeliveryDate(date);
                },
              ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: TimeSelectorWidget(
                selectedSlot: Provider.of<CollectionDeliveryProvider>(context)
                    .deliveryMorningSlot,
                isMorning: true,
                onSelect: (value) {
                  Provider.of<CollectionDeliveryProvider>(context,
                          listen: false)
                      .setDeliveryTimeSlot(value);
                },
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TimeSelectorWidget(
                selectedSlot: Provider.of<CollectionDeliveryProvider>(context)
                    .deliveryAfternoonSlot,
                isMorning: false,
                onSelect: (value) {
                  Provider.of<CollectionDeliveryProvider>(context,
                          listen: false)
                      .setDeliveryTimeSlot(value);
                },
              )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.mainColor.withOpacity(0.3)),
            child: const Center(
              child: Text(
                "Note: a delivery charged of \$3.00 will be incurred for a full service",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          InkWell(
            onTap: () {
              Provider.of<CollectionDeliveryProvider>(context, listen: false)
                  .onContinue();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.mainColor),
              child: const Center(
                child: Text(
                  "Continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteText),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
