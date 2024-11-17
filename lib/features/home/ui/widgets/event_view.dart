import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/features/home/ui/widgets/details.dart';

class EventViewWidget extends StatelessWidget {
  final GlobalKey<MonthViewState>? state;
  final double? width;

  const EventViewWidget({
    super.key,
    this.state,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return MonthView(
      key: state,
      width: width,
      hideDaysNotInMonth: false,
      onEventTap: (event, date) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsPage(
              event: event,
            ),
          ),
        );
      },
      onEventLongTap: (event, date) {
        SnackBar snackBar = const SnackBar(content: Text("on LongTap"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
