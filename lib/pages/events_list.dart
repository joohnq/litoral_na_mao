import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litoral_na_mao/models/city.dart';
import 'package:litoral_na_mao/services/api_service.dart';
import 'package:litoral_na_mao/widgets/custom_loading.dart';
import 'package:litoral_na_mao/widgets/form_search_bar.dart';
import 'package:litoral_na_mao/widgets/header.dart';
import 'package:litoral_na_mao/widgets/tourism_point.dart';

class EventsList extends StatefulWidget {
  final nameCity = Get.parameters['nameCity'];

  EventsList({
    Key? key,
  }) : super(key: key);

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  late Future<List<Event>> events;

  @override
  void initState() {
    super.initState();
    events = fetchRequest();
  }

  Future<List<Event>> fetchRequest() async {
    List<Event> events = [];
    List resultList = await apiRequest(
        'https://api-litoral.vercel.app/api/cities/${widget.nameCity}/events/${widget.nameCity}');

    for (var i in resultList) {
      events.add(Event.fromJson(i));
    }
    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            const FormSearchBar(),
            Expanded(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: FutureBuilder(
                    future: events,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CustomLoading();
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Erro ao buscar os dados da API'),
                        );
                      } else if (snapshot.hasData) {
                        final eventsPoints = snapshot.data!;
                        return ListView.builder(
                          itemCount: eventsPoints.length,
                          itemBuilder: (context, index) {
                            return TourismPoint(
                              nameCity: widget.nameCity!,
                              namePoint: eventsPoints[index].name,
                              descPoint: eventsPoints[index].description,
                              category: "widget.nameCategory!",
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text('Nenhum dado disponível'),
                        );
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
