import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_game/domain/use_cases/controllers/authentication.dart';
import 'package:league_game/domain/use_cases/controllers/ui.dart';
import 'package:league_game/ui/pages/content/chats/chat_screen.dart';
import 'package:league_game/ui/pages/content/location/location_screen.dart';
import 'package:league_game/ui/pages/content/public_offers/public_offers_screen.dart';
import 'package:league_game/ui/pages/content/states/user_status_page.dart';
import 'package:league_game/ui/pages/content/users_offers/users_offers_screen.dart';
import 'package:league_game/ui/widgets/appbar.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

// View content
  Widget _getScreen(int index) {
    switch (index) {
      case 1:
        return const UsersOffersScreen();
      case 2:
        return const PublicOffersScreen();
      case 3:
        return LocationScreen();
      case 4:
        return const UserMessages();
      default:
        return const UserStatusPage();
    }
  }

  // We create a Scaffold that is used for all the content pages
  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
    // Dependency injection: State management controller
    final UIController controller = Get.find<UIController>();
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      appBar: CustomAppBar(
        controller: controller,
        picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
        tile: const Text("league game"),
        context: context,
        onSignOff: () {
          authController.manager.signOut();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Obx(() => _getScreen(controller.reactiveScreenIndex.value)),
          ),
        ),
      ),
      // Content screen navbar
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons
                      .library_books_outlined, //library_books,lightbulb_outline_rounded
                  key: Key("statesSection"),
                ),
                label: 'Estados',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.group_outlined,
                  key: Key("socialSection"),
                ),
                label: 'Social',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.public_outlined,
                  key: Key("offersSection"),
                ),
                label: 'Verificado',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.place_outlined,
                  key: Key("locationSection"),
                ),
                label: 'Ubicaci??n',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_bubble_outline,
                ),
                label: 'Mensajes',
              ),
            ],
            currentIndex: controller.screenIndex,
            onTap: (index) {
              controller.screenIndex = index;
            },
          )),
    );
  }
}
