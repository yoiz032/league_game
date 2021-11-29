import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_game/data/services/videogames_pool.dart';
import 'package:league_game/domain/models/game_model.dart';
import 'package:league_game/domain/use_cases/controllers/connectivity.dart';

import 'widgets/offer_card.dart';

class PublicOffersScreen extends StatefulWidget {
  // PublicOffersScreen empty constructor
  const PublicOffersScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<PublicOffersScreen> {
  late VideogamesPoolService service;
  late Future<List<GameModel>> futuregames;
  late ConnectivityController connectivityController;

  @override
  void initState() {
    super.initState();
    service = VideogamesPoolService();
    futuregames = service.fecthData();
    connectivityController = Get.find<ConnectivityController>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GameModel>>(
      future: futuregames,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              GameModel game = items[index];
              return OfferCard(
                title: game.title,
                thumbnail: game.thumbnail,
                platform: game.platform,
                shortDescription: game.shortDescription,
                genre: game.genre,
                publisher: game.publisher,
                //releaseDate: game.releaseDate,
                onApply: () => {
                  Get.showSnackbar(
                    GetBar(
                      message: "Has seleccionado este juego.",
                      duration: const Duration(seconds: 2),
                    ),
                  )
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
