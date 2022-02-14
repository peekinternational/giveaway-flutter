import 'package:dartz/dartz.dart';
import 'package:flutter_giveaway/giveaway/domain/entities/giveaway_model.dart';
import 'package:flutter_giveaway/giveaway/domain/i_giveaway_facade.dart';

import 'data_sources/api_data_source.dart';

class GiveawayRepository implements IGiveawayFacade {
  final ApiDataSource apiDataSource;

  GiveawayRepository({required this.apiDataSource});

  @override
  Future<Either<String, List<GiveawayModel>>> getGiveaways() {
  return apiDataSource.getGiveaways();
  }

}
