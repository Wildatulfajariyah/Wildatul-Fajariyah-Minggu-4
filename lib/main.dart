import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volume Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _sisiController = TextEditingController();
  final TextEditingController _jariJariController = TextEditingController();
  final TextEditingController _tinggiTabungController = TextEditingController();
  String _result = '';

  void _hitungVolumeBalok() {
    double panjang = double.parse(_panjangController.text);
    double lebar = double.parse(_lebarController.text);
    double tinggi = double.parse(_tinggiController.text);
    double volume = panjang * lebar * tinggi;
    setState(() {
      _result = 'Volume Balok: $volume';
    });
  }

  void _hitungVolumeKubus() {
    double sisi = double.parse(_sisiController.text);
    double volume = sisi * sisi * sisi;
    setState(() {
      _result = 'Volume Kubus: $volume';
    });
  }

  void _hitungVolumeTabung() {
    double jariJari = double.parse(_jariJariController.text);
    double tinggi = double.parse(_tinggiTabungController.text);
    double volume = 3.14 * jariJari * jariJari * tinggi;
    setState(() {
      _result = 'Volume Tabung: $volume';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volume Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Panjang Balok'),
            ),
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Lebar Balok'),
            ),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Tinggi Balok'),
            ),
            ElevatedButton(
              onPressed: _hitungVolumeBalok,
              child: const Text('Hitung Volume Balok'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _sisiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Sisi Kubus'),
            ),
            ElevatedButton(
              onPressed: _hitungVolumeKubus,
              child: const Text('Hitung Volume Kubus'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _jariJariController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Jari-Jari Tabung'),
            ),
            TextField(
              controller: _tinggiTabungController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Tinggi Tabung'),
            ),
            ElevatedButton(
              onPressed: _hitungVolumeTabung,
              child: const Text('Hitung Volume Tabung'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
