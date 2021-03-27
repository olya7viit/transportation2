import 'package:flutter/material.dart';
import 'package:transportation2/config/theme.dart';
import 'package:transportation2/entity/order.dart';

class TexInfoOrder extends StatelessWidget {

  Order order;

  TexInfoOrder({
    this.order
});

  TextStyle boldStyle = new TextStyle(
      color: AppColors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold
  );

  TextStyle normalStyle = new TextStyle(
      color: AppColors.black,
      fontSize: 15,
      fontWeight: FontWeight.normal
  );

  @override
  Widget build(BuildContext context) {

    double screen_height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(screen_height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'id: ',
                  style: boldStyle,
                ),
                TextSpan(
                    text: '${order.id}',
                    style: normalStyle,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'organization name: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text: '${order.organizationName}',
                  style: normalStyle,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'full route distance: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text: '${order.fullRouteDistatnc}',
                  style: normalStyle,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'day of dispatch: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text: '${order.dayOfDispatch}',
                  style: normalStyle,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'day of arrival: ',
                  style: boldStyle,
                ),
                TextSpan(
                  text: '${order.dayOfArrival}',
                  style: normalStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
