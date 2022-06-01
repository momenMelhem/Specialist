import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

final userReference = _firestore.collection('Users');
final reportReference = _firestore.collection('Reports');
final appointmentReference = _firestore.collection('Appointments');
