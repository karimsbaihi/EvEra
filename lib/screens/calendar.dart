import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/ticket.dart';
import '../styles/colors.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calendar', style: TextStyle(color: Colors.white, fontFamily: 'Inter')),
          centerTitle: true,
          backgroundColor: mainBlack,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          color: mainBlack, 
          child: Column(
            children: [
              _buildCalendar(),
              TabBar(
                indicatorColor: mainGreen,
                labelColor: mainGreen,
                unselectedLabelColor: Colors.white70,
                tabs: const [
                  Tab(text: 'Upcoming'),
                  Tab(text: "Past event's"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    _buildEventList(),
                    _buildEmptyState(), 
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TableCalendar(
        focusedDay: _focusedDate,
        firstDay: DateTime(2000),
        lastDay: DateTime(2100),
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: mainGreen,
            shape: BoxShape.circle,
          ),
          outsideDaysVisible: false,
          weekendTextStyle: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
          defaultTextStyle: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
        ),
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
          leftChevronIcon: Icon(Icons.arrow_left, color: Colors.white),
          rightChevronIcon: Icon(Icons.arrow_right, color: Colors.white),
        ),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDate = selectedDay;
            _focusedDate = focusedDay;
          });
        },
        selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
      ),
    );
  }

  Widget _buildEventList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Ticket(image: 'assets/guitar.png',title: 'California Art Festival 2023 Dana Point 29-30',time: '10:00 PM',location: 'California, CA',),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Text(
        "No past events",
        style: TextStyle(color: Colors.white70, fontSize: 16, fontFamily: 'Inter'),
      ),
    );
  }
}
