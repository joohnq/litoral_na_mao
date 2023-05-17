import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 235, 98, 48),
            width: 10,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 10.0),
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
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: const Icon(Icons.menu_rounded, size: 35),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
