import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:specialist/constants/Constants.dart';
import 'package:specialist/services/AuthServices.dart';

class AddAppointmentServices {
  static Future<bool> addAppointment(
    String patientId,
    String illness,
  ) async {
    try {
      await appointmentReference.doc(patientId + "-" + illness).set({
        'status': 'pending',
        'specialistName': '',
        'patientId': patientId,
        'illness': illness,
        'date': '',
        'time': '',
      });
      await userReference
          .doc(AuthServices.signedInUser.ID)
          .update({'appointmentId': (patientId + "-" + illness)});
      Set<String> specialistIds = await userReference
          .where('major', isEqualTo: illness)
          .get()
          .then((value) => {value.docs.first.id});
      await userReference.doc(specialistIds.first).update({
        'appointmentsIds': FieldValue.arrayUnion([patientId + "-" + illness])
      });
      AuthServices.signedInUser.appointmentId = (patientId + "-" + illness);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
