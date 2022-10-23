import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ttumble/blocs/covid_bloc/services_bloc.dart';
import 'package:ttumble/blocs/covid_bloc/ticket_event.dart';

import 'package:ttumble/resources/api_repository.dart';

import '../../models/service_model.dart';
import '../../models/special_model.dart';



/* class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetTicketList>((event, emit) async {
      try {
        emit(TicketLoading());
        final mList = await _apiRepository.fetchCovidList();
        emit(TicketLoaded(mList));
      } on NetworkError {
        emit(TicketError("Failed to fetch data. is your device online?"));
      }
    });
  }
} */
           /* child: Column(
    children: List.generate(modell.servicee!.length, (index) {
      if (('${modell.servicee![index].tkState.toString()}') == 'Pending') {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            leading: CircleAvatar(
              child: Text('P', style: TextStyle(color: Colors.white)),
              backgroundColor: AppColor.primary,
            ),
            title:
                Text(('${modell.servicee![index].tkServcieName.toString()}')),
            subtitle: Text('In process to confirm'),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    ('${modell.servicee![index].tkDescription.toString()}'),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    ('${modell.servicee![index].tkLocation.toString()}'),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    ('${modell.servicee![index].tkId.toString()}'),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                buttonHeight: 52.0,
                buttonMinWidth: 90.0,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      cardB.currentState?.toggleExpansion();
                      idTicketUnico =
                          ("${modell.servicee![index].tkId}".toString());
                      estadoTicket(idTicketUnico);
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.turned_in_not,
                          color: AppColor.primary,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Text(
                          'Confirm Service Completed',
                          style: TextStyle(color: AppColor.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ExpansionTileCard(
            leading: CircleAvatar(
              child: Text(
                'SC',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green[800],
            ),
            title:
                Text(('${modell.servicee![index].tkServcieName.toString()}')),
            subtitle: Text('Service Completed!'),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    ('${modell.servicee![index].tkDescription.toString()}'),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    ('${modell.servicee![index].tkLocation.toString()}'),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    ('${modell.servicee![index].tkId.toString()}'),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }),
  ) */