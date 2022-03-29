import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorHistory extends StatelessWidget {
  String plotId;

  CalculatorHistory(this.plotId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<AuthProvider>(context, listen: false)
            .fetchCalculator(plotId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data['data'];
            return ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                        left: 0, right: 10, top: 20, bottom: 20),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "S.No",
                                    style: robotoBold.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 11),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "Product Name",
                                    style: robotoBold.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 11),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "Applied Date",
                                    style: robotoBold.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 11),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "Quantity",
                                    style: robotoBold.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 11),
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 17.0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      "${index + 1}",
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      data[index]["product_name"],
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      data[index]["applied_on"],
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      data[index]["quantity"],
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
