import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

import 'service_selector_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String serviceSelected = '';

  Widget separator(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
    );
  }

  void showDatePicker(context) async {
    DateTime? dateTime = await showOmniDateTimePicker(
      separator: const Divider(),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      lastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 5,
      secondsInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      selectableDayPredicate: (dateTime) {
        //remove all weekends
        return dateTime.weekday != 7;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: [
            const Text('Seleccionar servicio'),
            separator(context),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceSelectorPage(),
                  ),
                );
              },
              label: const Text(
                'Mostrar Servicios',
              ),
              icon: const Icon(
                Icons.list_alt,
              ),
            ),
            separator(context),
            const Text('Agenda tu cita'),
            separator(context),
            ElevatedButton.icon(
              onPressed: () => showDatePicker(
                context,
              ),
              label: const Text(
                'Abrir Calendario',
              ),
              icon: const Icon(
                Icons.calendar_today,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
