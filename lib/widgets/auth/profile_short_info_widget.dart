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
                  'https://media-exp1.licdn.com/dms/image/C4D03AQEaVSXKv-S1dQ/profile-displayphoto-shrink_400_400/0/1595934849886?e=1649894400&v=beta&t=i_8H5ma62biJU-TclOS8WwMyK6DXhUjo46lDZ1KQCog'),
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
