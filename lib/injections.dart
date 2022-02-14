
import 'package:get_it/get_it.dart';

import 'giveaway/application/home/giveaway_list_bloc/giveaway_list_bloc.dart';
import 'giveaway/infrastucture/data_sources/api_data_source.dart';
import 'giveaway/infrastucture/giveaway_repository.dart';




final serviceLocator = GetIt.instance;

Future<void> init() async {
  giveawayDependencies();
}

Future<void> giveawayDependencies() async {

  serviceLocator.registerFactory(
    () => GiveawayListBloc(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GiveawayRepository(
      apiDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => ApiDataSource(),
  );
}
