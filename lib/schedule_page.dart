import 'package:flutter/material.dart';
import 'history_page.dart';

class SchedulePage extends StatelessWidget {
  final List<Map<String, dynamic>> customers;

  const SchedulePage({Key? key, required this.customers}) : super(key: key);

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
                  builder: (context) => HistoryPage(customers: customers),
                ),
              );
            },
            icon: Icon(Icons.history),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Schedule Today',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              // Display customer info containers
              for (var customer in customers)
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
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              customer['name'],
                              style: TextStyle(),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Haircut Type',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(customer['haircutType']),
                            SizedBox(height: 8),
                            Text(
                              'Time',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(customer['time']),
                            SizedBox(height: 8),
                            Text(
                              'Price',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('\RM${customer['price']}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
