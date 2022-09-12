import 'package:flutter_food_delivery/app/data/model/data_model.dart';

import '/app/core/base/base_remote_source.dart';
import '/app/data/remote/catalogue_remote_data_source.dart';

class CatalogueRemoteDataSourceImpl extends BaseRemoteSource
    implements CatalogueRemoteDataSource {

  @override
  Future<Data> getDetails() {
    return Future(() => Data("sample"));
  }

}
