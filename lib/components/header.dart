import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (MediaQuery.of(context).size.width > 600) {
                  return Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                  );
                } else {
                  return Image.asset(
                    'assets/images/logo.png',
                    height: 60,
                  );
                }
              },
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 600) {
                  return InkWell(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: const Icon(Icons.menu_rounded, size: 50),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: const Icon(Icons.menu_rounded, size: 50),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
