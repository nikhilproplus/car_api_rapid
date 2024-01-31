import 'package:car_api_rapid/controller/controller.dart';
import 'package:car_api_rapid/view/model_spec_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class ModelTrimScreen extends StatefulWidget {
  const ModelTrimScreen({super.key});

  @override
  State<ModelTrimScreen> createState() => _ModelTrimScreenState();
}

class _ModelTrimScreenState extends State<ModelTrimScreen> {
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
      await getDataController.trimsDetailsFetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Trims",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          elevation: 3,
          shadowColor: Colors.grey,
        ),
        backgroundColor: Colors.deepPurple.shade100,
        body: Center(
          child: SmartRefresher(
            enablePullDown: true,
            // enablePullUp: true,
            onRefresh: () {
              getDataController.trimsDetailsFetch();
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
                      'Trims of ${getDataController.selectedmodel.value}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      child: DropdownMenu<String>(
                        width: 100,
                        menuHeight: 150,
                        trailingIcon: const Icon(
                          Icons.calendar_month_sharp,
                          color: Colors.black,
                        ),
                        selectedTrailingIcon: const Icon(
                          Icons.calendar_today_rounded,
                          color: Colors.black,
                        ),
                        inputDecorationTheme: InputDecorationTheme(
                          contentPadding: const EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.purple.shade700)),
                        ),
                        initialSelection: getDataController.yearList.first,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            getDataController.dropdownValue.value = value!;
                            fetchData();
                          });
                        },
                        dropdownMenuEntries: getDataController.yearList
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    getDataController.isDataLoadingfortrim.value

                        //check data empty in trim data or fetch only data to trimdata list from api call
                        ? const Center(child: CircularProgressIndicator())
                        : getDataController.trimData.first.data.isEmpty
                            ? const Center(
                                child: Text(
                                  "No data available",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: getDataController
                                    .trimData.first.data.length,
                                itemBuilder: (context, index) {
                                  var trimData = getDataController
                                      .trimData.first.data[index];

                                  return InkWell(
                                    onTap: () async {
                                      Get.to(() => const ModelSpecScreen());
                                      getDataController.selectedTrimId.value =
                                          trimData.name;
                                    },
                                    child: Card(
                                      elevation: 4,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
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
                                                  'Name : ${trimData.name}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Type: ${trimData.description}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Model year : ${trimData.year.toString()}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  'Price : \$ ${trimData.msrp.toString()}',
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
