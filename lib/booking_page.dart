import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'schedule_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String selectedDay = "Mon"; // Example selected day
  DateTime _selectedValue = DateTime.now();

  List<Map<String, dynamic>> customers = [
    {
      'name': 'John Doe',
      'haircutType': 'Buzz Cut',
      'time': '10:00 AM',
      'price': 20.0,
    },
    {
      'name': 'Jane Smith',
      'haircutType': 'Fade',
      'time': '11:30 AM',
      'price': 25.0,
    },
    {
      'name': 'Bob Johnson',
      'haircutType': 'Trim',
      'time': '2:00 PM',
      'price': 15.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('BarberMate'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchedulePage(customers: customers),
                ),
              );
            },
            icon: Icon(Icons.history),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Booking',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.person, size: 40),
                  SizedBox(width: 16),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Najmi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Hairstylist'),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(Icons.star,
                                color: Colors.yellow, size: 20),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Experienced barber with a passion for stylish haircuts.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Choose Your Time',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.now().subtract(Duration(days: 365)),
                  lastDay: DateTime.now().add(Duration(days: 365)),
                  calendarFormat: CalendarFormat.week,
                  onFormatChanged: (format) {},
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedValue, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedValue = selectedDay;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: customers.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.person, size: 40),
                        SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                customers[index]['name'],
                                style: TextStyle(),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Haircut Type',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(customers[index]['haircutType']),
                              SizedBox(height: 8),
                              Text(
                                'Time',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(customers[index]['time']),
                              SizedBox(height: 8),
                              Text(
                                'Price',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('\RM${customers[index]['price']}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SchedulePage(customers: customers),
                    ),
                  );
                },
                child: Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
