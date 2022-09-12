import 'package:flutter_food_delivery/app/data/model/data_model.dart';

abstract class CatalogueRemoteDataSource {

  Future<Data> getDetails();

}
