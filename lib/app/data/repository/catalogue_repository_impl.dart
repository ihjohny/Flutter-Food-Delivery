import 'package:flutter_food_delivery/app/data/model/data_model.dart';
import 'package:get/get.dart';

import '/app/data/remote/catalogue_remote_data_source.dart';
import '/app/data/repository/catalogue_repository.dart';

class CatalogueRepositoryImpl implements CatalogueRepository {
  final CatalogueRemoteDataSource _remoteSource =
      Get.find(tag: (CatalogueRemoteDataSource).toString());

  @override
  Future<Data> getDetails() {
    return _remoteSource.getDetails();
  }

}
