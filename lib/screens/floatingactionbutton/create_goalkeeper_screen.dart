import 'package:flutter/material.dart';
import 'package:loan_keeper/utils/image_path.dart';
import 'package:loan_keeper/widgets/custom_lime_button.dart';

class CreateGoalkeeperScreen extends StatefulWidget {
  const CreateGoalkeeperScreen({super.key});

  @override
  State<CreateGoalkeeperScreen> createState() => _CreateGoalkeeperScreenState();
}

class _CreateGoalkeeperScreenState extends State<CreateGoalkeeperScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final List<Card> goalkeeperTiles = [];
  final CreateGoalkeeperController _goalkeeperController = CreateGoalkeeperController();

  void _createGoalKeeper() {
    setState(() {
      String name = _goalkeeperController.nameController.text;
      String surname = _goalkeeperController.surnameController.text;
      String age = _goalkeeperController.ageController.text;
      String height = _goalkeeperController.heightController.text;
      String weight = _goalkeeperController.weightController.text;

      Card goalkeeperCard = Card(
        child: Column(
          children: [
            ListTile(
              title: Text('$name $surname'),
              subtitle: Row(
                children: [
                  Text('Yaş: $age'),
                  Text('Boy: $height'),
                  Text('Kilo: $weight'),
                ],
              ),
            ),
          ],
        ),
      );
      goalkeeperTiles.add(goalkeeperCard);
      Navigator.pop(context, goalkeeperCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kaleci Oluştur'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(borderRadius: BorderRadius.circular(20), child: ImagePath().createGoalkeeper),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                    child: TextField(
                      autocorrect: true,
                      controller: _goalkeeperController.nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Ad",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(color: Colors.lime),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.lime.shade700),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                    child: TextField(
                      autocorrect: true,
                      controller: _goalkeeperController.surnameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Soyad",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(color: Colors.lime),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.lime.shade700),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                      child: TextField(
                        autocorrect: true,
                        controller: _goalkeeperController.ageController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Yaş',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(color: Colors.lime),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(color: Colors.lime.shade700),
                          ),
                        ),
                      )),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                      child: TextField(
                        autocorrect: true,
                        controller: _goalkeeperController.heightController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Boy',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(color: Colors.lime),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(color: Colors.lime.shade700),
                          ),
                        ),
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                    child: TextField(
                      autocorrect: true,
                      controller: _goalkeeperController.weightController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Kilo',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(color: Colors.lime),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.lime.shade700),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _createGoalKeeper,
                  child: const Text(
                    'Kaleci Oluştur',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateGoalkeeperController {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
}
