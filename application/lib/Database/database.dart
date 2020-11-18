import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

Future<int> getTemp() async {
  DataSnapshot dataSnapshot =
      await databaseReference.child('temperature/').once();
  int temp = 0;

  if (dataSnapshot.value != null) {
    int value = dataSnapshot.value;
    temp = value;
  }
  return temp;
}

Future<int> getHum() async {
  DataSnapshot dataSnapshot = await databaseReference.child('humidity/').once();
  int hum = 0;

  if (dataSnapshot.value != null) {
    int value = dataSnapshot.value;
    hum = value;
  }
  return hum;
}

Future<int> getMax() async {
  DataSnapshot dataSnapshot = await databaseReference.child('max_temp/').once();
  int max = 0;

  if (dataSnapshot.value != null) {
    int value = dataSnapshot.value;
    max = value;
  }
  return max;
}

void pushMax(newValue) {
  databaseReference.update({'max_temp': newValue});
}
