import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/presentation/misc/methods.dart';

class CastCrewCard extends StatelessWidget {
  final Actor actor;
  const CastCrewCard({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Display photo of the cast or crew member
        actor.profilePath == null
            ? CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 30, color: Colors.grey[700]),
              )
            : CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${actor.profilePath}',
                ),
              ),

        // Name of the cast or crew member
        SizedBox(
          width: 50,
          // height: 30,
          child: Text(
            actor.name,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpace(5.0),
        SizedBox(
          width: 50,
          // height: 30,
          child: Text(
            actor.character,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
