import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:population_app/view%20models/data_view_model.dart';

DataViewModel? dataVM;
void main() {
  initVM();
  runApp(const MyApp());
}

void initVM() {
  dataVM = DataViewModel();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController idNationController = TextEditingController();
  TextEditingController idYearController = TextEditingController();
  Future<void>? future;
  String population = "";

  @override
  void initState() {
    super.initState();
    dataVM?.addListener(dataListener);
    setState(() {
      future = Future.value();
    });
  }

  dataListener() {
    if (dataVM?.Population != null) {
      setState(() {
        population = dataVM!.Population;
      });
      log(population);
    }
  }

  @override
  void dispose() {
    dataVM?.removeListener(dataListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("Population App",style: TextStyle(color: Colors.white),),
          automaticallyImplyLeading: false,
          centerTitle: false,
        ),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(25),
            child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter ID Nation",
                          textDirection: TextDirection.ltr,
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.purple,width: 2),borderRadius: BorderRadius.circular(15)),
                          height: 50,
                           padding: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            decoration: const InputDecoration(border: InputBorder.none),
                            maxLines: 1,
                            textDirection: TextDirection.ltr,
                            controller: idNationController,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "Enter ID Year",
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.purple,width: 2), borderRadius: BorderRadius.circular(15)),
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            decoration: const InputDecoration(border: InputBorder.none),
                            textDirection: TextDirection.ltr,
                            maxLines: 1,
                            controller: idYearController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                              onPressed: () {
                                setState(() {
                                  future = dataVM?.getPopulationApi(
                                      idNationController.text,
                                      idYearController.text);
                                });
                              },
                              child: const Text("Submit",style: TextStyle(color: Colors.white),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            population,
                            textDirection: TextDirection.ltr,
                          ),
                        )
                      ],
                    );
                  default:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
