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
  // GiveawayListBloc({required this.repository}) : super(GiveawayListInitial());

/*  GiveawayListBloc({required this.repository}) : super(GiveawayListInitial())  {
    eventAHandler(event) async {
      var result =  await repository.getGiveaways();


      if (event is GetGiveawaysEvent)
      {
        // emit(GiveawaysLoadingState());
        print("sss");
      emit(result.fold((l) => GiveawayListErrorState(),
      (r) => GiveawayListLoadedState(giveaways: r)));
      }
    }

    myEventHandler(event, emit) {
      event.map(
          eventA: (event, emit) => eventAHandler(event) // whoops, we didn't pass in `emit`
      );
    }

    on<GiveawayListEvent>(myEventHandler);

    // on((event, emit) => eventAHandler(GiveawayListEvent));

  }*/

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
      // if (result.isLeft()) {
      //   yield GiveawayListErrorState();
      // } else {
      //   yield GiveawayListLoadedState(giveaways: result.foldRight(, (r, previous) => r));
      // }
    }
  }
}

