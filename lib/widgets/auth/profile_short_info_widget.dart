import 'package:flutter/material.dart';

class ProfileShortInfoWidget extends StatelessWidget {
  const ProfileShortInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://scontent.ffjr1-5.fna.fbcdn.net/v/t39.30808-1/p200x200/218733569_6459664180741456_49110727911368210_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=7206a8&_nc_ohc=aQ13E9JdDzMAX-g-Ez7&_nc_ht=scontent.ffjr1-5.fna&oh=00_AT8jqvDOZdvTFXqF_83TbaZZPJeqwbyZiYs9nHOWP0NtoQ&oe=62004BAD'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'Matiullah Karimi',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              child: const Text('Edit profile'),
            ),
          ],
        )
      ],
    );
  }
}
