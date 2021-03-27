import 'package:flutter/material.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/order.dart';
import 'package:transportation2/entity/segment.dart';
import 'package:transportation2/firebase/logic.dart';

class CustomCheckBox extends StatefulWidget {

  String point1;
  String point2;
  bool isChecked;
  int segmentId;
  List<Segment> segments;
  String idOrder;
  Order order;

  CustomCheckBox({this.point1, this.point2, this.isChecked, this.segments,
    this.segmentId, this.idOrder, this.order});

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

  TextStyle normalStyle = new TextStyle(
      color: AppColors.black,
      fontSize: 15,
      fontWeight: FontWeight.normal
  );

  @override
  void initState() {
    super.initState();
  }

  _onChanged(bool value) {
    for (var i = 0; i < widget.order.segments.length; i++) {
      if (widget.order.segments[i].id == widget.segmentId) {
        widget.order.segments[i].isOriginChecked = value;
        widget.order.segments[i].isDestinationChecked = value;
      }
    }
    FirebaseLogic.updateOrder(widget.order);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
              value: widget.isChecked,
              onChanged: (newValue) {
                setState(() {
                  widget.isChecked = newValue;
                  _onChanged(newValue);
                });
              },
          ),
          Text(
            widget.point1,
            style: normalStyle,
          ),
          Text(
              " - ${widget.point2}",
              style: normalStyle
          ),
        ],
      ),
    );
  }
}
