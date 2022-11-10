import 'package:flutter/material.dart';
import 'package:model_class_practice/model/population_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PopulationData dataEntry;
  bool isLoading = true;

  Future<void> data() async {
    http.Response res = await http.get(Uri.parse(
        "https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
    setState(() {
      isLoading = false;
      dataEntry = populationDataFromJson(res.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    data();
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (isLoading)
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Text("Budget"),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(

                      children: [
                          // Text("Budget"),
                        getContainer(170, 40),
                        getContainer(200, 40),
                        getContainer(0, 40),
                        getContainer(0, 40),
                        getContainer(0, 40),
                      ]),
                  ),
                ],
              ),
    )),
    );
  }

  Widget getContainer(double height, double width) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          //Text("Budget"),
          Container(
            height: height,
            width: width,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
