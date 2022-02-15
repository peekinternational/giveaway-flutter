import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_giveaway/giveaway/domain/entities/giveaway_model.dart';
import 'package:flutter_giveaway/giveaway/infrastucture/giveaway_repository.dart';
import 'package:meta/meta.dart';

part 'giveaway_list_event.dart';

part 'giveaway_list_state.dart';

class GiveawayListBloc extends Bloc<GiveawayListEvent, GiveawayListState> {
  final GiveawayRepository repository;

  GiveawayListBloc({required this.repository});

  @override
  GiveawayListState get initialState => GiveawayListInitial();


  Stream<GiveawayListState> mapEventToState(
    GiveawayListEvent event,
  ) async* {
    if (event is GetGiveawaysEvent) {
      yield GiveawaysLoadingState();
      var result = await repository.getGiveaways();

      yield result.fold((l) => GiveawayListErrorState(),
          (r) => GiveawayListLoadedState(giveaways: r));
    }
  }
}

