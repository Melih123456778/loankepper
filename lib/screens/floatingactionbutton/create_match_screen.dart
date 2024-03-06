import 'package:flutter/material.dart';
import 'package:loan_keeper/utils/image_path.dart';

class CreateMatchScreen extends StatefulWidget {
  const CreateMatchScreen({super.key});

  @override
  State<CreateMatchScreen> createState() => _CreateMatchScreenState();
}

class _CreateMatchScreenState extends State<CreateMatchScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final List<Card> matchTiles = [];
  final CreateMatchController _matchController = CreateMatchController();

  void _createMatch() {
    setState(() {
      String team1 = _matchController.team1Controller.text;
      String team2 = _matchController.team2Controller.text;
      String location = _matchController.locationController.text;

      Card matchCard = Card(
        child: Column(
          children: [
            ListTile(
              title: Text('$team1 vs $team2'),
              subtitle: Row(
                children: [
                  Text('Konum: $location'),
                  const Spacer(),
                  Text('Saat: ${selectedTime.hour}:${selectedTime.minute}'),
                ],
              ),
            ),
          ],
        ),
      );
      matchTiles.add(matchCard);
      Navigator.pop(context, matchCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maç Oluştur'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ClipRRect(borderRadius: BorderRadius.circular(20), child: ImagePath().team),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                    child: TextField(
                      autocorrect: true,
                      controller: _matchController.team1Controller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Takım 1",
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
                      controller: _matchController.team2Controller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Takım 2",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: TextField(
                autocorrect: true,
                controller: _matchController.locationController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: "Konum",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.lime),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Maç Saati: ${selectedTime.hour}:${selectedTime.minute}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final TimeOfDay? timeOfDay = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                            hourLabelText: "Saat",
                            minuteLabelText: 'Dakika',
                            helpText: 'Maç Saati',
                            confirmText: 'Tamam',
                            cancelText: 'İptal',
                            initialEntryMode: TimePickerEntryMode.input,
                          );
                          if (timeOfDay != null) {
                            setState(() {
                              selectedTime = timeOfDay;
                            });
                          }
                        },
                        icon: const Icon(Icons.timelapse_rounded),
                      ),
                    ],
                  ),
                ),
              ),
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
                  onPressed: _createMatch,
                  child: const Text(
                    'Maçı Oluştur',
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

class CreateMatchController {
  TextEditingController team1Controller = TextEditingController();
  TextEditingController team2Controller = TextEditingController();
  TextEditingController locationController = TextEditingController();
}
