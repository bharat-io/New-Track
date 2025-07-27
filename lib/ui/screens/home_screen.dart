import 'package:flutter/material.dart';
import 'package:newstrack/utill/theming/app_color.dart';
import 'package:newstrack/utill/theming/app_space.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "wellcome",
                  style: TextTheme.of(context).titleSmall,
                ),
                Text(
                  "Viladmir putin",
                  style: TextTheme.of(context).titleLarge,
                )
              ],
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.notification_add),
          )
        ],
      ),
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 248, 247, 247),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: "Let see what happen today",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
            AppSpacing.gap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Breaking News",
                    style: TextTheme.of(context).headlineSmall),
                Text(
                  "see all",
                  style: TextTheme.of(context)
                      .labelLarge!
                      .copyWith(color: AppColor.primaryColor),
                )
              ],
            ),
            AppSpacing.gap12,
          ],
        ),
      ),
    );
  }
}
