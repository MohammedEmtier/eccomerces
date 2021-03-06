import 'package:Harmik/Core/ViewModel/CheakOut_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

import '../Constants.dart';

class TrcakView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheakOutViewModel>(
        init: CheakOutViewModel(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Text(
                  "Order Status",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: StatusChange.tileBuilder(
                        theme: StatusChangeThemeData(
                          direction: Axis.vertical,
                          connectorTheme:
                              ConnectorThemeData(space: 1.0, thickness: 1.0),
                        ),
                        builder: StatusChangeTileBuilder.connected(
                          itemWidth: (_) =>
                              MediaQuery.of(context).size.width /
                              _processes.length,
                          contentWidgetBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                _content[index],
                                style: TextStyle(
                                  color: Colors
                                      .blue, // change color with dynamic color --> can find it with example section
                                ),
                              ),
                            );
                          },
                          nameWidgetBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                _processes[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: controller.getColor(index),
                                ),
                              ),
                            );
                          },
                          indicatorWidgetBuilder: (_, index) {
                            if (index <= controller.processIndex) {
                              return DotIndicator(
                                size: 35.0,
                                border:
                                    Border.all(color: Colors.green, width: 1),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return OutlinedDotIndicator(
                                size: 30,
                                borderWidth: 1.0,
                                color: todoColor,
                              );
                            }
                          },
                          lineWidgetBuilder: (index) {
                            if (index > 0) {
                              if (index == controller.processIndex) {
                                final prevColor =
                                    controller.getColor(index - 1);
                                final color = controller.getColor(index);
                                var gradientColors;
                                gradientColors = [
                                  prevColor,
                                  Color.lerp(prevColor, color, 0.5)
                                ];
                                return DecoratedLineConnector(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: gradientColors,
                                    ),
                                  ),
                                );
                              } else {
                                return SolidLineConnector(
                                  color: controller.getColor(index),
                                );
                              }
                            } else {
                              return null;
                            }
                          },
                          itemCount: _processes.length,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.skip_next),
                onPressed: () {
                  controller.skip();
                },
                backgroundColor: inProgressColor,
              ),
            ));
  }
}

final _processes = [
  'Order Signed\nLagos State, Nigeria',
  'Order Processed\nLagos State, Nigeria',
  'Shipped\nLagos State, Nigeria',
  'Out for delivery\nLagos State, Nigeria',
  'Delivered\nLagos State, Nigeria',
];

final _content = [
  '21/18',
  '21/18',
  '21/18',
  '21/18',
  '21/18',
];
