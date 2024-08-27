import 'package:flutter/material.dart';
import 'package:widget_1_fahmi/date_widget.dart';
import 'package:widget_1_fahmi/input_selection.dart';
import 'dialog.dart';

class ScaffoldWidget extends StatefulWidget {
  const ScaffoldWidget({super.key});

  @override
  _ScaffoldWidgetState createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(
      child: Image.network(
        'https://images-porsche.imgix.net/-/media/5D0BB7E042BD4C9DBEF84B5E70482520_73AA748306934B0C9CE20E32231DFCE2_CZ25W01IX0011911-carrera-front?w=704&q=85&auto=format',
        fit: BoxFit.cover,
      ),
    ),
    Center(
      child: Image.network(
        'https://images-porsche.imgix.net/-/media/E969499404154DB79BAD58EF5CC8CFAB_82BBE0A2462E47C4B1DB34EA0B23B853_CZ25W12IX0010-911-carrera-gts-side?w=1400&q=85&crop=faces%2Centropy%2Cedges&auto=format',
      ),
    ),
    Center(
      child: Image.network(
        'https://images-porsche.imgix.net/-/media/29200583E46C486581905B15B7F99E2A_C9D24F865FEE489D848D0D5D1A3FB656_CZ25W02IX0010-911-carrera-cabrio-side?w=1400&q=85&crop=faces%2Centropy%2Cedges&auto=format',
      ),
    ),
    Center(
      child: Image.network(
        'https://images-porsche.imgix.net/-/media/38F74B77CEAD47019163D6C73AC41C1F_4C70266A3460468EA7233C81E3381ACE_911-targa-4-gts-side?w=1400&q=85&crop=faces%2Centropy%2Cedges&auto=format',
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showShoppingCartDialog() {
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      title: Text("Shopping Cart"),
      content: Text("Stock habis kawan next time yaa."),
      actions: [okButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Porsche 911 Turbo S"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.car_repair),
          ),
        ],
        backgroundColor: Color.fromRGBO(208, 208, 208, 1), 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showShoppingCartDialog();
        },
        child: Icon(Icons.add_shopping_cart),
        backgroundColor: Color.fromRGBO(208, 208, 208, 1),
      ),
      backgroundColor: Colors.white, 


      body: Column(                                                   //Body untuk mengkoneksi script
        children: [
          _screens[_selectedIndex],
          InputSelection(),
          DateWidget(),
        ],
      ),



      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 123, 6, 26), 
        backgroundColor: Color(0xFFE1E1E1), 
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.car_crash_outlined), label: 'Front'),
          BottomNavigationBarItem(icon: Icon(Icons.car_crash), label: 'Coupe'),
          BottomNavigationBarItem(icon: Icon(Icons.car_crash_rounded), label: 'Cabriolet'),
          BottomNavigationBarItem(icon: Icon(Icons.car_crash_rounded), label: 'Targa'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MyLayout();
  }
}

class MyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            child: Text('Show Alert'),
            onPressed: () {
              showAlertDialog(context);
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('Show Another Dialog'),
            onPressed: () {
              showAnotherDialog(context);
            },
          ),
        ],
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {},
  );

  AlertDialog alert = AlertDialog(
    title: Text("My Title"),
    content: Text("This is my message."),
    actions: [okButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showAnotherDialog(BuildContext context) {
  Widget cancelButton = ElevatedButton(
    child: Text("Cancel"),
    onPressed: () {},
  );

  AlertDialog alert = AlertDialog(
    title: Text("Another Title"),
    content: Text("This is another message."),
    actions: [cancelButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Porsche 911 Turbo S"),
        ),
        body: Column(
          children: [
            DialogWidget(),
            InputSelection(), 
          ],
        ),
      ),
    );
  }
}