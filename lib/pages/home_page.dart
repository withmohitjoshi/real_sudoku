import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const List<Map<String, String>> _dropdownItems = [
  {"value": "easy", "label": "Easy"},
  {"value": "medium", "label": "Medium"},
  {"value": "hard", "label": "Hard"},
];

const String _prefKey = 'lastSelectedDropdownValue';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedLevel;

  Future<void> _saveSelectedValue(String? value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value != null) {
      await prefs.setString(_prefKey, value);
    } else {
      await prefs.remove(_prefKey);
    }
  }

  Future<void> _loadSelectedValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      final value = prefs.getString(_prefKey);
      if (value != null) {
        selectedLevel = value;
      }
    });
  }

  handleChangeLevel(String? value) {
    setState(() {
      selectedLevel = value;
    });
    _saveSelectedValue(value);
  }

  @override
  void initState() {
    super.initState();
    _loadSelectedValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: DropdownButton(
                    items: _dropdownItems.map((item) {
                      return DropdownMenuItem(
                        value: item['value'],
                        child: Text(item['label']!),
                      );
                    }).toList(),
                    onChanged: (changedValue) {
                      if (changedValue != null) {
                        handleChangeLevel(changedValue);
                      }
                    },
                    borderRadius: BorderRadius.circular(16),
                    padding: const EdgeInsets.all(8),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    iconSize: 24,
                    underline: const SizedBox(),
                    isExpanded: true,
                    hint: const Text("Select the difficulty level"),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    value: selectedLevel,
                    dropdownColor: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/board',
                        arguments: selectedLevel);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: Colors.lightBlue,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Start New Game",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
