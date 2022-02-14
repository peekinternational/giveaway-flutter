import 'package:dartz/dartz.dart';

import 'entities/giveaway_model.dart';

abstract class IGiveawayFacade{
  Future<Either<String,List<GiveawayModel>>> getGiveaways();
}