import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ensala_mais/utils/project_colors.dart';
import 'package:ensala_mais/widgets/navbar_link.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<DateTime, List> _events = {};
  DateTime _focusedDay = DateTime.now();

  // Instead of initializing in initState, just add the "late" modifier.
  late DateTime _selectedDay = _focusedDay;

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  void initState() {
    // This is where your problem is. The event loader is passed DateTimes with
    // the time component set to zero (midnight). d is set to noon. Just delete
    // the argument of "12" for hours.
    DateTime d = DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day + 1,
    );
    // Just add "Event A" to the list on this line
    _events[d] = ["Event A"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       NavbarLink(text: 'Professores'),
      //       NavbarLink(text: 'Salas'),
      //       NavbarLink(text: 'Turmas'),
      //     ],
      //   ),
      //   backgroundColor: ProjectColors().mainGreen,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            color: ProjectColors().mainGreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NavbarLink(text: 'Professores'),
                NavbarLink(text: 'Salas'),
                NavbarLink(text: 'Turmas'),
              ],
            ),
          ),
          TableCalendar(
            availableGestures: AvailableGestures.all,
            calendarFormat: CalendarFormat.week,
            firstDay: DateTime(1970),
            lastDay: DateTime(2040),
            focusedDay: _focusedDay,
            eventLoader: (day) {
              // Use a null aware operator "??" to make this line simpler. If
              // _events[day] is null, return the empty list instead.
              return _events[day] ?? [];
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                print('passei aqui');
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
          ),
          Divider(),
          Text('Ensalamento'),
          SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '${index + 1}º horário ${index == 0 ? "19:00" : "20:55"}'),
                        Column(
                          children: [
                            Text('Turma'),
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Select Item',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: items
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  height: 40,
                                  width: 140,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text('Sala'),
                        Text('Professor'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
