import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travelapp/shared/store/home.dart';
import 'package:travelapp/shared/styles/common_style.dart';
import 'package:travelapp/shared/styles/textstyle_ext.dart';

import '../../../shared/widgets/app_bar_container.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  String range = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        if (args.value.endDate != null) {
          range =
              '${DateFormat('d MMMM').format(args.value.startDate)} - ${DateFormat('d MMMM yyyy').format(args.value.endDate)}';
        } else {
          range = DateFormat('d MMMM yyyy').format(args.value.startDate);
        }
      }
      print("nam23: $range");
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = Get.find();
    final screenSize = MediaQuery.of(context).size;
    return AppBarContainer(
      title: 'Select Date',
      description: '',
      extend: Column(
        children: [
          Center(
            child: Container(
              width: screenSize.width - 50,
              margin: EdgeInsets.only(top: 20),
              height: 300,
              child: SfDateRangePicker(
                headerStyle: DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center,
                    textStyle: TextStyles.defaultStyle),
                monthCellStyle: DateRangePickerMonthCellStyle(
                  textStyle: TextStyles.defaultStyle,
                  todayTextStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
                selectionShape: DateRangePickerSelectionShape.rectangle,
                startRangeSelectionColor: AppColor.orangeColor,
                endRangeSelectionColor: AppColor.orangeColor,
                rangeSelectionColor: AppColor.orangeColor.withOpacity(0.25),
                selectionTextStyle: TextStyles.defaultStyle.whiteTextColor.bold,
                rangeTextStyle: TextStyles.defaultStyle,
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              homeStore.setDate(range);
              Get.back();
            },
            child: Container(
              width: screenSize.width - 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: Gradients.defaultGradientBackground,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                'Select',
                style: TextStyles.normalStyle.whiteTextColor.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: screenSize.width - 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.secondColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                'Cancel',
                style: TextStyles.normalStyle.primaryTextColor.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
