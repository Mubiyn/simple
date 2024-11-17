import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_app/shared/utils/string_setups/date_extensions.dart';
import 'package:simple_app/shared/utils/theme_configs/size_utils.dart';
import 'package:simple_app/shared/widgets/scaffold.dart';

class DetailsPage extends StatelessWidget {
  final CalendarEventData event;

  const DetailsPage({
    super.key,
    required this.event,
  });
  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: smallHorizontalPadding),
          child: Text(event.title),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Text(
            "Date: ${DateFormat("dd/MM/yyyy").format(event.date)}",
          ),
          const SizedBox(
            height: 15.0,
          ),
          if (event.startTime != null && event.endTime != null) ...[
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("From"),
                      Text(
                        event.startTime
                                ?.getTimeInFormat(TimeStampFormat.parse_12) ??
                            "",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("To"),
                      Text(
                        event.endTime
                                ?.getTimeInFormat(TimeStampFormat.parse_12) ??
                            "",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
          if (event.description?.isNotEmpty ?? false) ...[
            const Divider(),
            const Text("Description"),
            const SizedBox(
              height: 10.0,
            ),
            Text(event.description!),
          ],
        ],
      ),
    );
  }
}
