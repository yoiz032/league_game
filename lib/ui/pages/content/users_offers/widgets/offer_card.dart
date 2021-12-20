import 'package:flutter/material.dart';
import 'package:league_game/ui/widgets/card.dart';

class PostCard extends StatelessWidget {
  final String title, content;
  final VoidCallback onChat, onTap;

  // PostCard constructor
  const PostCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.onChat,
      required this.onTap})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return AppCard(
      key: const Key("socialCard"),
      title: title,
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      // topLeftWidget widget as an Avatar
      topLeftWidget: const SizedBox(
        height: 48.0,
        width: 48.0,
        child: Center(
          child: CircleAvatar(
            minRadius: 14.0,
            maxRadius: 14.0,
            backgroundImage:
                NetworkImage("https://ui-avatars.com/api/?length=1"),
          ),
        ),
      ),
      // topRightWidget widget as an IconButton
      topRightWidget: IconButton(
        icon: Icon(
          Icons.chat_outlined,
          color: primaryColor,
        ),
        onPressed: onTap,
      ),
    );
  }
}
