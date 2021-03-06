import 'package:Harmik/View/Widgets/CustomText.dart';
import 'package:Harmik/helper/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.StandardDelivery;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          RadioListTile<Delivery>(
            controlAffinity: ListTileControlAffinity.trailing,
            value: Delivery.StandardDelivery,
            groupValue: delivery,
            onChanged: (Delivery val) {
              setState(() => delivery = val);
            },
            activeColor: kprimrycolor,
            title: CustomText(
              text: "Standard Delivery".tr,
              size: 22.5,
            ),
            subtitle: CustomText(
              text: "\nOrder will be delivered between 3 - 5 business days".tr,
              size: 15,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          RadioListTile<Delivery>(
            controlAffinity: ListTileControlAffinity.trailing,
            value: Delivery.NextdayDelivery,
            groupValue: delivery,
            onChanged: (Delivery val) => setState(() => delivery = val),
            activeColor: kprimrycolor,
            title: CustomText(
              text: "Next Day Delivery".tr,
              size: 22.5,
            ),
            subtitle: CustomText(
              text:
                  "\nPlace your order before 6pm and your items will be delivered the next day"
                      .tr,
              size: 15,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          RadioListTile<Delivery>(
            controlAffinity: ListTileControlAffinity.trailing,
            value: Delivery.NominatedDelivery,
            groupValue: delivery,
            onChanged: (Delivery val) => setState(() => delivery = val),
            activeColor: kprimrycolor,
            title: CustomText(
              text: "Nominated Delivery".tr,
              size: 22.5,
            ),
            subtitle: CustomText(
              text:
                  "\nPick a particular date from the calendar and order will be delivered on selected date"
                      .tr,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
