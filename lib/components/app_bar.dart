import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

  void _confirmLogout(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (_) => AlertDialog(
              title: const Text("Logout"),
              content: const Text("Are you sure ?"),
              actions: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        Navigator.pop(ctx);
                      },
                      child: const Text("Yes"),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text("NO"))
                  ],
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepOrange.shade100,
      actions: [
        IconButton(
          onPressed: () {
            _confirmLogout(context);
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
