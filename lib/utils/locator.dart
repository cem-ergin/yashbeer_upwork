import 'package:get_it/get_it.dart';
import 'package:yashbeer/utils/size_helper.dart';

GetIt locator = GetIt.I;

class MyLocator {
  static void setupLocator() {
    locator.registerLazySingleton(() => SizeHelper());
  }
}
