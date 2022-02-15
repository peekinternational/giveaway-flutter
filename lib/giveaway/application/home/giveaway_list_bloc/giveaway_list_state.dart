part of 'giveaway_list_bloc.dart';

@immutable
abstract class GiveawayListState {}

class GiveawayListInitial extends GiveawayListState {}


class GiveawayListLoadedState extends GiveawayListState{
  final List<GiveawayModel> giveaways;

  GiveawayListLoadedState({required this.giveaways});
}

class GiveawayListErrorState extends GiveawayListState{
}
class GiveawaysLoadingState extends GiveawayListState{}