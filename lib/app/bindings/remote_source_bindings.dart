import 'package:get/get.dart';

import '../data/catalogue/remote/catalogue_remote_data_source.dart';
import '../data/catalogue/remote/catalogue_remote_data_source_impl.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatalogueRemoteDataSource>(
      () => CatalogueRemoteDataSourceImpl(),
      tag: (CatalogueRemoteDataSource).toString(),
    );
  }
}
