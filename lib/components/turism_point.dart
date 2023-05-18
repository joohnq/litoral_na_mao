import 'package:flutter/material.dart';

class TurismPoint extends StatefulWidget {
  const TurismPoint({Key? key}) : super(key: key);

  @override
  State<TurismPoint> createState() => _TurismPointState();
}

class _TurismPointState extends State<TurismPoint> {
  bool showFirstWidget = true;

  void toggleWidget() {
    setState(() {
      showFirstWidget = !showFirstWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      constraints: const BoxConstraints(maxWidth: 400),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: showFirstWidget
            ? FirstWidget(
                key: const ValueKey(1),
                onToggle: toggleWidget,
              )
            : SecondWidget(
                key: const ValueKey(2),
                onToggle: toggleWidget,
              ),
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({Key? key, required this.onToggle}) : super(key: key);
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Row(children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.black12),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CIDADE',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Descrição',
              style: TextStyle(
                  color: Color.fromARGB(255, 235, 98, 48), fontSize: 18),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Localização',
                style: TextStyle(color: Colors.black45, fontSize: 18),
              ),
            )
          ],
        )
      ]),
    );
  }
}

class SecondWidget extends StatelessWidget {
  const SecondWidget({Key? key, required this.onToggle}) : super(key: key);

  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: 400,
        height: 200,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20)),
                      color: Colors.black12),
                ),
                const SizedBox(width: 10),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CIDADE',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Descrição',
                        style: TextStyle(
                            color: Color.fromARGB(255, 235, 98, 48),
                            fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Localização',
                          style: TextStyle(color: Colors.black45, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.extension, size: 50),
                  Icon(Icons.extension, size: 50),
                  Icon(Icons.extension, size: 50)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
