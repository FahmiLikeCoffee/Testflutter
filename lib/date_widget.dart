import 'package:flutter/material.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({super.key, this.title});
  final String? title;

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Tanggal Sekarang: ${_selectedDate.toLocal().toString().split(" ")[0]}"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _selectDate(context);
              print("Selected Date: ${_selectedDate.day} ${_selectedDate.month} ${_selectedDate.year}");
            },
            child: Text("Pilih Tanggal"),
          ),
        ],
      ),
    );
  }
} 