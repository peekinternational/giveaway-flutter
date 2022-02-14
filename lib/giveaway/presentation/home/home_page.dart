import 'package:flutter/material.dart';
import 'package:flutter_giveaway/giveaway/presentation/core/utils/ga_util.dart';

import 'giveaway_list/widgets/giveaway_list_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: GAColors.primaryColor1,
        title: const Text('Giveaway'),
      ),
      body:   const GiveawayListWidget(),
      backgroundColor:GAColors.primaryColor1,
    );
  }
}
