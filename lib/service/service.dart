import 'package:car_api_rapid/controller/controller.dart';
import 'package:car_api_rapid/model/brand_model.dart';
import 'package:car_api_rapid/model/brand_types_model.dart';
import 'package:car_api_rapid/model/model_spec_model.dart';
import 'package:car_api_rapid/model/trims_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final GetDataController getDataController = Get.put(GetDataController());

///////////////////brand models api//////////////////////////////////////////
class DataService {
  String apiUrl =
      'https://car-api2.p.rapidapi.com/api/models?make=${getDataController.selectedBrand.value}&sort=id&direction=asc&year=2020&verbose=yes';

  Future<WelcomeSuccess> serviceBrandModelData() async {
    debugPrint(apiUrl);
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'X-RapidAPI-Key': '6b33c0d435msh83caf79e8b731bbp15959djsn26626e4302fa',
        'X-RapidAPI-Host': 'car-api2.p.rapidapi.com',
      });

      debugPrint(response.body);

      if (response.statusCode == 200) {
        debugPrint('200 success');
        return welcomeSuccessFromJson(response.body);
      } else {
        throw Exception('Failed to post exception');
      }
    } catch (e) {
      throw Exception('Failed to get data in service $e');
    }
  }
}

////////////////// brands api call///////////////////////////////////
class DataServiceBrands {
  String apiUrl =
      'https://car-api2.p.rapidapi.com/api/makes?direction=asc&sort=id';

  Future<WelcomeSuccess2> serviceBrandsData() async {
    debugPrint(apiUrl);
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'X-RapidAPI-Key': '6b33c0d435msh83caf79e8b731bbp15959djsn26626e4302fa',
        'X-RapidAPI-Host': 'car-api2.p.rapidapi.com',
      });

      debugPrint(response.body);

      if (response.statusCode == 200) {
        debugPrint('200 success');
        return welcomeSuccess2FromJson(response.body);
      } else {
        throw Exception('Failed to post exception');
      }
    } catch (e) {
      throw Exception('Failed to get data in service $e');
    }
  }
}

/////////////////model specification////////////////////////
class DataModelSpecs {
  String apiUrl =
      'https://car-api2.p.rapidapi.com/api/engines?make=${getDataController.selectedBrand.value}&make_model_id=${getDataController.selectedmodelId.value}&trim=${getDataController.selectedTrimId.value}&model=${getDataController.selectedmodel.value}&limit=1&verbose=yes&direction=asc&sort=id';

  Future<WelcomeSuccess3> modelSpecData() async {
    debugPrint(apiUrl);
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'X-RapidAPI-Key': '6b33c0d435msh83caf79e8b731bbp15959djsn26626e4302fa',
        'X-RapidAPI-Host': 'car-api2.p.rapidapi.com',
      });

      debugPrint(response.body);

      if (response.statusCode == 200) {
        debugPrint('200 success');
        return welcomeSuccess3FromJson(response.body);
      } else {
        throw Exception('Failed to post exception');
      }
    } catch (e) {
      throw Exception('Failed to get data in service $e');
    }
  }
}

/////////////////////Trim api call/////////////////////////
class DataModelTrims {
  String apiUrl =
      'https://car-api2.p.rapidapi.com/api/trims?direction=asc&sort=id&year=${getDataController.dropdownValue.value}&make_model_id=${getDataController.selectedmodelId}&verbose=yes&make_id=${getDataController.selectedBrandId}';

  Future<WelcomeSuccess4> trimsData() async {
    debugPrint(apiUrl);
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'X-RapidAPI-Key': '6b33c0d435msh83caf79e8b731bbp15959djsn26626e4302fa',
        'X-RapidAPI-Host': 'car-api2.p.rapidapi.com',
      });

      debugPrint(response.body);

      if (response.statusCode == 200) {
        debugPrint('200 success');
        if (response.body.isNotEmpty) {
          return welcomeSuccess4FromJson(response.body);
        } else {
          throw Exception('Empty response');
        }
      } else {
        throw Exception('Failed to post exception');
      }
    } catch (e) {
      throw Exception('Failed to get data in service $e');
    }
  }
}
