import 'package:flutter/material.dart';
import 'package:transportation2/components/custom_checkbox.dart';
import 'package:transportation2/entity/order.dart';

class MarkPathWidget extends StatefulWidget {

  Order order;

  MarkPathWidget(this.order);

  @override
  _MarkPathWidgetState createState() => _MarkPathWidgetState();
}

class _MarkPathWidgetState extends State<MarkPathWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> widgetList = [];
    for(int i = 0; i < widget.order.segments.length; i++){
      widgetList.add(
          CustomCheckBox(
            point1: widget.order.segments[i].origin.split(",")[0],
            point2: widget.order.segments[i].destination.split(",")[0],
            isChecked: widget.order.segments[i].isDestinationChecked,
            segments: widget.order.segments,
            segmentId: widget.order.segments[i].id,
            idOrder: widget.order.id,
            order: widget.order,
          )
      );
    }

    return Column(
      children: widgetList
    );
  }
}
