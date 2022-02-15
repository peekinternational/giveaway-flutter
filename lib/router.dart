import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_giveaway/giveaway/presentation/home/giveaway_details_page/giveaway_details_page.dart';
import 'package:flutter_giveaway/giveaway/presentation/home/home_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: GiveawayDetailsPage),
  ],
)
class AppRouter extends _$AppRouter{
}