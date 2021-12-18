// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:league_game/ui/widgets/card.dart';

class OfferCard extends StatelessWidget {
  final String title, thumbnail, shortDescription, genre, platform, publisher;

  final VoidCallback onApply;

  // OfferCard constructor
  const OfferCard(
      {Key? key,
      required this.title,
      required this.thumbnail,
      required this.platform,
      required this.shortDescription,
      required this.genre,
      required this.publisher,
      required this.onApply})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AppCard(
      key: const Key("offerCard"),
      title: title,
      content: Image(
        image: NetworkImage(
          thumbnail,
        ),
      ),

      // topRightWidget widget as an IconButton
      // topRightWidget: IconButton(
      //   icon: Icon(
      //     Icons.copy_outlined,
      //     color: primaryColor,
      //   ),
      //   onPressed: () {
      //     Clipboard.setData(ClipboardData(text: content));
      //     Get.showSnackbar(
      //       GetBar(
      //         message: "Se ha copiado la oferta al portapapeles.",
      //         duration: const Duration(seconds: 2),
      //       ),
      //     );
      //   },
      // ),    Image(image: NetworkImage(thumbnail)),
      // extraContent widget as a column that contains more details about the offer
      // and an extra action (onApply)
      extraContent: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            shortDescription,
            style: Theme.of(context).textTheme.caption,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.architecture,
                  color: primaryColor,
                ),
              ),
              Text(
                platform,
                style: Theme.of(context).textTheme.caption,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.gamepad_outlined,
                  color: primaryColor,
                ),
              ),
              Text(
                genre,
                style: Theme.of(context).textTheme.caption,
              ),
              const Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.developer_mode_outlined,
              color: primaryColor,
            ),
          ),
          Text(
            publisher,
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
