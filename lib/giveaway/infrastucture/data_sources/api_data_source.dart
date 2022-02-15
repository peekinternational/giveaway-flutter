
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_giveaway/giveaway/domain/entities/giveaway_model.dart';
import 'package:flutter_giveaway/giveaway/domain/i_giveaway_facade.dart';

class ApiDataSource implements IGiveawayFacade {


  @override
  Future<Either<String, List<GiveawayModel>>> getGiveaways() async {
    try {
      Response response;
      response = await Dio().get("https://www.gamerpower.com/api/giveaways");

      Iterable  jsonGiveaway = response.data;
      List<GiveawayModel> mm = jsonGiveaway.map((user) => GiveawayModel.fromJson(user)).toList();
      print(mm[0]);
      return right(
          jsonGiveaway.map((user) => GiveawayModel.fromJson(user)).toList()
          );
    } catch (e) {
      return left(e.toString());
    }
  }

}
