import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_giveaway/giveaway/application/home/giveaway_list_bloc/giveaway_list_bloc.dart';
import 'package:flutter_giveaway/giveaway/domain/entities/giveaway_model.dart';
import 'package:flutter_giveaway/giveaway/presentation/core/utils/ga_util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MakeCard extends StatelessWidget {
  // final GiveawayModel giveaway;
  List<GiveawayModel> giveaway;
  int index;


  MakeCard(this.giveaway,
      this.index); // const MakeCard(this.giveaway, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.greenAccent,
        clipBehavior: Clip.antiAlias,
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(58, 63, 68, 1.0)),
          child: _buildCardBody(context),
        ));
  }

  _buildCardBody(context) {
    return Center(
        child: VStack(
      [
        giveaway[index].image != null
            ? CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                height: !kIsWeb ? 130 : context.screenSize.height / 2 + 100,
                imageUrl: giveaway[index].image.toString(),
              )
            : Image.asset(
                "assets/images/ic_placeholder.png",
                width: MediaQuery.of(context).size.width,
                height: !kIsWeb ? 130 : context.screenSize.height / 2 + 100,
                fit: BoxFit.cover,
              ),
        Text(
          giveaway[index].title.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        ).p8(),
        HStack(
          [
            giveaway[index].worth.toString().endsWith("N/A")
                ? "Free".text.bold.size(15).color(GAColors.lightYellow).make()
                : giveaway[index].worth
                    .toString()
                    .text
                    .color(GAColors.lightYellow)
                    .make(),
            Chip(
              label: giveaway[index].type.toString().text.make(),
              backgroundColor: Vx.randomColor,
            ),
          ],
          alignment: MainAxisAlignment.spaceBetween,
          axisSize: MainAxisSize.max,
        ).px(12),
        giveaway[index].description
            .toString()
            .text
            .maxLines(2)
            .ellipsis
            .color(GAColors.lightWhite)
            .make()
            .px8(),
        TextButton(
                child: Text("Open URL".toUpperCase(),
                    style: const TextStyle(fontSize: 14)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(12)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.greenAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(color: Colors.yellow)))),
                onPressed: () => _launchURL(context))
            .w(MediaQuery.of(context).size.width)
            .px4(),
        Text.rich(
          TextSpan(
            children: [
              const WidgetSpan(
                  child: FaIcon(
                FontAwesomeIcons.users,
                size: 18,
                color: Colors.white,
              )),
              TextSpan(
                  style: const TextStyle(color: Colors.white),
                  text: "  " + giveaway[index].users.toString() + "+"),
            ],
          ),
        ).px8()
      ],
      alignment: MainAxisAlignment.spaceBetween,
      axisSize: MainAxisSize.max,
    ));
  }

  _launchURL(context) async {
    String url = giveaway[index].open_giveaway.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch '+giveaway[index].open_giveaway.toString();
    }
  }
}
