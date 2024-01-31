import 'package:car_api_rapid/controller/controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class ModelSpecScreen extends StatefulWidget {
  const ModelSpecScreen({super.key});

  @override
  State<ModelSpecScreen> createState() => _ModelSpecScreenState();
}

class _ModelSpecScreenState extends State<ModelSpecScreen> {
  final GetDataController getDataController = Get.put(GetDataController());
  final RefreshController refreshControllerbrand =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    Future.delayed(Duration.zero, () async {
      await getDataController.modelSpecifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text(
            "specifications",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          elevation: 3,
          shadowColor: Colors.grey,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // await getDataController.getDataApi();
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.refresh),
        ),
        backgroundColor: Colors.deepPurple.shade100,
        body: Center(
          child: SmartRefresher(
            enablePullDown: true,
            // enablePullUp: true,
            onRefresh: () {
              getDataController.modelSpecifications();
              refreshControllerbrand.refreshCompleted();
            },

            controller: refreshControllerbrand,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'specifications of ${getDataController.selectedmodel.value} ${getDataController.selectedTrimId.value}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    getDataController.isDataLoadingforspec.value
                        ? const Center(child: CircularProgressIndicator())
                        : getDataController.modelSpec.isEmpty
                            ? const Center(
                                child: Text(
                                  "No data available, please try again",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: getDataController
                                    .modelSpec.first.data.length,
                                itemBuilder: (context, index) {
                                  var modelSpec = getDataController
                                      .modelSpec.first.data[index];

                                  return Card(
                                    elevation: 4,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${getDataController.selectedBrand} - ${getDataController.selectedmodel}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.deepPurple,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Power : ${modelSpec.horsepowerHp.toString()}hp',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Engine size: : ${modelSpec.size.toString()}Ltr',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Max Torque : ${modelSpec.torqueRpm.toString()}rpm',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Fuel type : ${modelSpec.fuelType}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Drive type : ${modelSpec.driveType}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Transmission : ${modelSpec.transmission}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Cam type : ${modelSpec.camType}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Valve timing : ${modelSpec.valveTiming}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Number of valves : ${modelSpec.valves.toString()}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
