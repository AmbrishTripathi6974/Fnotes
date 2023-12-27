import 'package:flutter/material.dart';
import 'package:fnotes/archive/archive_view.dart';
import 'package:fnotes/constants/colors.dart';
import 'package:fnotes/home.dart';
import 'package:fnotes/setting/setting.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        decoration: const BoxDecoration(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Text(
                  "Google Keep",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Divider(
                color:
                    Theme.of(context).colorScheme.background.withOpacity(0.3),
              ),
              sectionOne(),
              const SizedBox(height: 5),
              sectionTwo(),
              const SizedBox(height: 5),
              sectionSetting(),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionOne() {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.only(
        right: 5,
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
              (states) => white.withOpacity(0.1)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              const Icon(
                Icons.lightbulb_rounded,
                size: 25,
              ),
              const SizedBox(
                width: 27,
              ),
              Text(
                "Notes",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTwo() {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.only(
        right: 5,
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
              (states) => white.withOpacity(0.1)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ArchiveView()));
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              const Icon(
                Icons.archive_outlined,
                size: 25,
              ),
              const SizedBox(
                width: 26,
              ),
              Text(
                "Archive",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionSetting() {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.only(
        right: 5,
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith(
              (states) => white.withOpacity(0.1)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Settings()));
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              const Icon(
                Icons.settings_outlined,
                size: 25,
              ),
              const SizedBox(
                width: 25,
              ),
              Text(
                "Setting",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
