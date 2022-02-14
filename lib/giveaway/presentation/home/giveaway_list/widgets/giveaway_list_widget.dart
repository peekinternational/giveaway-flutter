import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_giveaway/giveaway/application/home/giveaway_list_bloc/giveaway_list_bloc.dart';
import 'package:flutter_giveaway/giveaway/domain/entities/giveaway_model.dart';
import 'package:flutter_giveaway/giveaway/presentation/core/widgets/error_retry_widget.dart';

import '../../../../../injections.dart';
import 'make_card.dart';

class GiveawayListWidget extends StatelessWidget {
   const GiveawayListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GiveawayListBloc giveawayListBloc = serviceLocator<GiveawayListBloc>();
    // GiveawayListBloc(repository: serviceLocator<GiveawayListBloc>().repository)

    return BlocProvider<GiveawayListBloc>(
      create: (context) => giveawayListBloc..add(GetGiveawaysEvent()),
      child: BlocBuilder<GiveawayListBloc, GiveawayListState>(
        builder: (context, GiveawayListState state)
        {
          if (state is GiveawayListLoadedState) {
            return ListView.builder(
              itemCount: state.giveaways.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //       return GiveawayDetailPage(postId: state.giveaway[index].id);
                    //     }));
                  },
                  child: MakeCard(state.giveaways,index),
                );
              },
            );
          }
          else if (state is GiveawaysLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GiveawayListErrorState) {
            return ErrorRetryWidget("Error while fetching Giveaways",
                    () => giveawayListBloc..add(GetGiveawaysEvent()),);
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }



}
