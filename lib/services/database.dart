import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference calcHistory =
      FirebaseFirestore.instance.collection('calculations');

  Future updateUserData(String calculations, String final_value) async {
    return await calcHistory
        .doc("uid")
        .collection("history")
        .doc(calculations)
        .set({
      'calculations': calculations,
      'final_value': final_value,
    });
  }

  addData(String calculations, String final_value) async {
    if (calculations == "" && final_value == "")
      print("enter Required fields");
    else {
      FirebaseFirestore.instance
          .collection("calculations")
          .doc("uid")
          .collection("history")
          .doc(calculations)
          .set({
        "Calculations": calculations,
        "Result": final_value,
      }).then((value1) {
        print("data inserted");
      });
    }
  }

  Stream<QuerySnapshot> get calc {
    return calcHistory.snapshots();
  }
}
