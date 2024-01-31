import 'dart:developer';

import 'package:car_api_rapid/model/brand_model.dart';
import 'package:car_api_rapid/model/brand_types_model.dart';
import 'package:car_api_rapid/model/model_spec_model.dart';
import 'package:car_api_rapid/model/trims_detail_model.dart';
import 'package:car_api_rapid/service/service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GetDataController extends GetxController {
  var isDataLoading = false.obs;
  var isDataLoadingforBrand = false.obs;
  var isDataLoadingforspec = false.obs;
  var isDataLoadingfortrim = false.obs;

  List<String> yearList =
      <String>['2020', '2019', '2018', '2017', '2016', '2015'].obs;

  var dropdownValue = ''.obs;

  RxList<Datum> saveData = <Datum>[].obs;

  RxList<WelcomeSuccess2> carBrandList = <WelcomeSuccess2>[].obs;

  RxList<WelcomeSuccess3> modelSpec = <WelcomeSuccess3>[].obs;

  RxList<WelcomeSuccess4> trimData = <WelcomeSuccess4>[].obs;
  Map<String, List<Datum2>> sortedList = {};
  var selectedBrand = ''.obs;
  var selectedmodel = ''.obs;
  var selectedmodelId = ''.obs;
  var selectedBrandId = ''.obs;
  var selectedTrimId = ''.obs;
  var searchItemController = TextEditingController().obs;
//to get first letter from data
  String getInitials({required String string, required int limitTo}) {
    var buffer = StringBuffer();
    var split = string.split(' ');
    for (var i = 0; i < (limitTo); i++) {
      buffer.write(split[i][0]);
    }

    return buffer.toString();
  }

//a to z
  // List<String> alphabetList = List.generate(
  //     26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));

  List<String> alphabetList = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

//sort data

  // sortTheList() {
  //   var sortedData = getDataController.carBrandList.first.data
  //       .sort((a, b) => a.toString().compareTo(b.toString()));

  //   return sortedData;
  // }

  Future<bool> getBrandModelData() async {
    isDataLoading(true);
    try {
      saveData.clear();
      debugPrint('api called');
      var welcomeSuccessList = await DataService().serviceBrandModelData();
      debugPrint('welcomeSuccessList fetched...');

      saveData.addAll(welcomeSuccessList.data);

      debugPrint('save data list $saveData');
      if (saveData.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Failed to get data in controller $e');
    } finally {
      isDataLoading(false);
    }
  }

///////////////////// fetch brand details ///////////////////////
  Future<bool> fetchBrandDetails() async {
    isDataLoadingforBrand(true);
    try {
      carBrandList.clear();
      debugPrint('api called');
      WelcomeSuccess2 welcomeSuccessList =
          await DataServiceBrands().serviceBrandsData();
      debugPrint('welcomeSuccessList fetched...');

      carBrandList.addAll([welcomeSuccessList]);

      welcomeSuccessList.data.map((each) {
        sortedList[each.name[0]] == null ? sortedList[each.name[0]] = [] : null;
        sortedList[each.name[0]]!.add(each);
      });
      inspect(sortedList);
      debugPrint('save data list $carBrandList');
      if (carBrandList.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Failed to get data in controller $e');
    } finally {
      isDataLoadingforBrand(false);
    }
  }

  /////////////// model specifications////////////////////////
  Future<bool> modelSpecifications() async {
    isDataLoadingforspec(true);
    try {
      modelSpec.clear();
      debugPrint('api called');
      var welcomeSuccessList = await DataModelSpecs().modelSpecData();
      debugPrint('welcomeSuccessList fetched...');

      modelSpec.addAll([welcomeSuccessList]);
      debugPrint('save data list $modelSpec');
      if (modelSpec.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Failed to get data in controller $e');
    } finally {
      isDataLoadingforspec(false);
    }
  }

  /////////////////model trims/////////////////////////////////
  Future<bool> trimsDetailsFetch() async {
    isDataLoadingfortrim(true);
    try {
      trimData.clear();
      debugPrint('api called');
      var welcomeSuccessList = await DataModelTrims().trimsData();
      debugPrint('welcomeSuccessList fetched...');

      trimData.addAll([welcomeSuccessList]);
      debugPrint('trim data list $trimData');
      if (trimData.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Failed to get data in controller $e');
    } finally {
      isDataLoadingfortrim(false);
    }
  }
}
