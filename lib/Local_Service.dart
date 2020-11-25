import 'package:get_it/get_it.dart';
import 'package:nestorai_app/apiservices/ApiServicesss.dart';
import 'package:nestorai_app/scopedmodels/Scopde_Model_property.dart';
GetIt Locator = GetIt();
void SetUpLocator()
{
  Locator.registerFactory<Propertyscopdemodel>(()=>Propertyscopdemodel());
  Locator.registerLazySingleton<ApiService>(()=>ApiService());
}