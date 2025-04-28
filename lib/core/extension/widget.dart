import 'package:flutter/material.dart';

extension PaddingWidgte on Widget {
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget toButton(
    Function()? onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: this,
    );
  }

  Align toAlign(
          {Alignment alignment = Alignment.center,
          double widthFactor = 1.0,
          double heightFactor = 1.0}) =>
      Align(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  Widget toCenter() => Center(
        child: this,
      );

  toRow(
          {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
          MainAxisSize mainAxisSize = MainAxisSize.max}) =>
      Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: [this],
      );

  Widget toColumn(
          {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
          MainAxisSize mainAxisSize = MainAxisSize.max}) =>
      Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: [this],
      );
  //to eleveedButton
  Widget toElevatedButton(
    Function()? onPressed,
    Color? color,
    Color? textColor,
    double? elevation,
    double? borderRadius,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      ),
      child: this,
    );
  }

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget toMainColor({Color color = const Color(0xFFF6F6F6)}) => ColoredBox(
        color: color,
        child: this,
      );

  Widget paddingOnly(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );

  Widget paddingFromLTRB(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );
  //margin
  Widget marginAll(double margin) => Container(
        margin: EdgeInsets.all(margin),
        child: this,
      );

  Widget marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Container(
        margin:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget marginOnly(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Container(
        margin:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );

  Widget marginFromLTRB(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Container(
        margin: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  //to SizedBox

  SizedBox toheightSizedBox(double value) => SizedBox(
        height: value,
        child: this,
      );
  SizedBox towidthSizedBox(double value) => SizedBox(
        width: value,
        child: this,
      );

  Expanded toExpanded({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );

  SizedBox toSizedBox({double height = 0.0, double width = 0.0}) => SizedBox(
        height: height,
        width: width,
        child: this,
      );

  SingleChildScrollView toScroll({Axis axis = Axis.horizontal}) =>
      SingleChildScrollView(
        scrollDirection: axis,
        child: this,
      );
}

//extension statelessWidget on Widget {

//lottie

extension ColumnEx on List<Widget> {
  Widget toColumn(
          {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
          MainAxisSize mainAxisSize = MainAxisSize.max}) =>
      Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: this,
      );

  ListView toListView({Axis axis = Axis.vertical}) => ListView(
        scrollDirection: axis,
        children: this,
      );

  Widget toRow(
          {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
          CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
          MainAxisSize mainAxisSize = MainAxisSize.max}) =>
      Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: this,
      );
}
