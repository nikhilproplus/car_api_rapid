import 'package:car_api_rapid/controller/controller.dart';
import 'package:car_api_rapid/view/brand_models_sceen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class BrandNamesScreen extends StatefulWidget {
  const BrandNamesScreen({super.key});

  @override
  State<BrandNamesScreen> createState() => _BrandNamesScreenState();
}

class _BrandNamesScreenState extends State<BrandNamesScreen> {
  final GetDataController getDataController = Get.put(GetDataController());
  final RefreshController refreshControllerbrand =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getDataController.fetchBrandDetails();
  }

  void fetchData() {
    Future.delayed(Duration.zero, () async {
      await getDataController.fetchBrandDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Premium used cars",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          elevation: 3,
          shadowColor: Colors.grey,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     await getDataController.fetchBrandDetails();
        //   },
        //   backgroundColor: Colors.deepPurple,
        //   child: const Icon(Icons.refresh),
        // ),
        backgroundColor: Colors.deepPurple.shade100,
        body: Center(
          child: SmartRefresher(
            enablePullDown: true,
            // enablePullUp: true,
            onRefresh: () {
              getDataController.fetchBrandDetails();
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
                    const Text(
                      'Select a Car brand',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    getDataController.isDataLoadingforBrand.value
                        ? const Center(child: CircularProgressIndicator())
                        : getDataController.carBrandList.isEmpty
                            ? const Center(
                                child: Text(
                                  "No data available, please try again",
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            : Column(
                                children: [
                                  // const Text(
                                  //   'A',
                                  //   style: TextStyle(
                                  //     color: Colors.black,
                                  //     fontSize: 32,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  Column(
                                    children: getDataController.sortedList
                                        .map((key, value) => MapEntry(
                                            key,
                                            Column(
                                              children: [
                                                Text(key),
                                                Column(
                                                  children: value.map((each) {
                                                    return InkWell(
                                                      onTap: () async {
                                                        Get.to(() =>
                                                            const BrandModelsScreen());
                                                        getDataController
                                                            .selectedBrand
                                                            .value = each.name;
                                                        getDataController
                                                                .selectedBrandId
                                                                .value =
                                                            each.id.toString();
                                                      },
                                                      child: Card(
                                                        elevation: 4,
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            vertical: 8),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      16.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        '${each.id}',
                                                                        style:
                                                                            const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Colors.deepPurple,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          width:
                                                                              8),
                                                                      Text(
                                                                        each.name,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              18,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          8),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                )
                                              ],
                                            )))
                                        .values
                                        .toList(),
                                  ),
                                  // ListView.builder(
                                  //     shrinkWrap: true,
                                  //     physics: const ScrollPhysics(),
                                  //     itemCount: getDataController
                                  //         .carBrandList.first.data.length,
                                  //     itemBuilder: (context, index) {
                                  //       var carBrand = getDataController
                                  //           .carBrandList.first.data[index];

                                  //       //sort
                                  //       getDataController
                                  //           .carBrandList.first.data
                                  //           .sort((a, b) => a
                                  //               .toString()
                                  //               .compareTo(b.toString()));
                                  //       //get first letter
                                  //       var alphabet = getDataController
                                  //           .carBrandList.first.data[0];

                                  //       if (alphabet == carBrand.name[0]) {
                                  //         return InkWell(
                                  //           onTap: () async {
                                  //             Get.to(() =>
                                  //                 const BrandModelsScreen());
                                  //             getDataController.selectedBrand
                                  //                 .value = carBrand.name;
                                  //             getDataController
                                  //                     .selectedBrandId.value =
                                  //                 carBrand.id.toString();
                                  //           },
                                  //           child: Card(
                                  //             elevation: 4,
                                  //             margin:
                                  //                 const EdgeInsets.symmetric(
                                  //                     vertical: 8),
                                  //             shape: RoundedRectangleBorder(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(15),
                                  //             ),
                                  //             child: Column(
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.start,
                                  //               children: [
                                  //                 Padding(
                                  //                   padding:
                                  //                       const EdgeInsets.all(
                                  //                           16.0),
                                  //                   child: Column(
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       Row(
                                  //                         children: [
                                  //                           Text(
                                  //                             '${carBrand.id}',
                                  //                             style:
                                  //                                 const TextStyle(
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .bold,
                                  //                               color: Colors
                                  //                                   .deepPurple,
                                  //                             ),
                                  //                           ),
                                  //                           const SizedBox(
                                  //                               width: 8),
                                  //                           Text(
                                  //                             carBrand.name,
                                  //                             style:
                                  //                                 const TextStyle(
                                  //                               fontWeight:
                                  //                                   FontWeight
                                  //                                       .bold,
                                  //                               fontSize: 18,
                                  //                             ),
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                       const SizedBox(
                                  //                           height: 8),
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         );
                                  //       } else {
                                  //         return SizedBox();
                                  //       }
                                  //     }),
                                ],
                              ),
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
