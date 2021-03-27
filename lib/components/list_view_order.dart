import 'package:flutter/material.dart';
import 'package:transportation2/components/mark_path.dart';
import 'package:transportation2/components/text_info_order.dart';
import 'package:transportation2/entity/order.dart';

class ListViewOrder extends StatefulWidget {

  List<Order> listOrders;

  ListViewOrder({this.listOrders});

  @override
  _ListViewOrderState createState() => _ListViewOrderState();
}

class _ListViewOrderState extends State<ListViewOrder> {

  Map tapDetector;

  Map createTapDetector() {
    Map tap = {};
    for (int i = 1; i <= widget.listOrders.length; i++) {
      tap[i] = false;
    }
    return tap;
  }

  @override
  void initState() {
    tapDetector = createTapDetector();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double screen_height = MediaQuery.of(context).size.height;

    return ListView.builder(
      itemCount: widget.listOrders.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.description),
                title: Text('Order ${index + 1}'),
                subtitle: Text("${widget.listOrders[index].id}"),
                trailing: Icon(
                  tapDetector[index + 1] == false
                      ? Icons.expand_more
                      : Icons.expand_less,
                ),
                onTap: () {
                  setState(() {
                    if (tapDetector[index + 1] == false) {
                      tapDetector.update(index + 1, (value) => true);
                    } else {
                      tapDetector.update(index + 1, (value) => false);
                    }
                  });
                },
              ),
            ),
            tapDetector[index + 1] == true
                ? Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: Column(
                      children: [
                        TexInfoOrder(
                          order: widget.listOrders[index],
                        ),
                        SizedBox(height: screen_height * 0.01),
                        MarkPathWidget(widget.listOrders[index]),
                      ],
                    ),
                 )
                : SizedBox(),
          ],
        );
      },
    );
  }
}


