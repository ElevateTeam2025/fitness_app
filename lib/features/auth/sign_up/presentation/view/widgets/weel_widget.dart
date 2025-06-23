import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

class WheelWidget extends StatefulWidget {
  const WheelWidget({
    super.key,
    required this.minVal,
    required this.maxVal,
    required this.initVal,
    required this.onValueChange,
    required this.label,
  });

  final int minVal;
  final int maxVal;
  final int initVal;
  final ValueChanged<int> onValueChange;
  final String label;

  @override
  State<WheelWidget> createState() => _WheelWidgetState();
}

class _WheelWidgetState extends State<WheelWidget> with AutomaticKeepAliveClientMixin<WheelWidget> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initVal - widget.minVal;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    int totalCount = widget.maxVal - widget.minVal + 1;
    super.build(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Text(
            widget.label,
            style: AppTextStyles.BalooThambi2_400_14.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 250.HeightResponsive,
          width: double.infinity,
          child: Stack(
            children: [
              // Wheel Slider
              WheelSlider.customWidget(
                totalCount: totalCount,
                initValue: currentIndex,
                isInfinite: false,
                squeeze: 1.2,
                perspective: 0.004,
                itemSize: 90,
                horizontal: true,
                showPointer: false,
                onValueChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                  widget.onValueChange((widget.minVal + index).toInt());
                },
                children: List.generate(totalCount, (index) {
                  bool isSelected = index == currentIndex;
                  int displayValue = widget.minVal + index;
                  return Container(
                    height: 80.HeightResponsive,
                    width: 100.WidthResponsive,
                    alignment: Alignment.center,
                    child: Text(
                      displayValue.toString(),
                      style: isSelected
                          ? AppTextStyles.BalooThambi2_800_20.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 44,
                      )
                          : AppTextStyles.BalooThambi2_400_16.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 33,
                      ),
                    ),
                  );
                }),
              ),
              // Centered Arrow
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Center(
                  child: Icon(
                    Icons.arrow_drop_up,
                    color: AppColors.primaryColor,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}