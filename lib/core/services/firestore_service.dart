import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirestoreService<T> {
  final FirebaseFirestore _firestore;
  final String collection;
  final T Function(Map<String, dynamic> json) fromJson;
  final Map<String, dynamic> Function(T model) toJson;

  FirestoreService({
    required this.collection,
    required this.fromJson,
    required this.toJson,
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<String> create(T data) async {
    final docRef = await _firestore.collection(collection).add(toJson(data));
    return docRef.id;
  }

  Future<T?> get(String id) async {
    final docSnapshot = await _firestore.collection(collection).doc(id).get();
    if (!docSnapshot.exists) {
      return null;
    }
    return fromJson({...docSnapshot.data()!, 'id': docSnapshot.id});
  }

  Future<List<T>> getAll() async {
    final querySnapshot = await _firestore.collection(collection).get();
    log('Raw Firestore data: ${querySnapshot.docs.map((doc) => doc.data()).toList()}');
    
    final documents = querySnapshot.docs.map((doc) {
      final data = {...doc.data(), 'id': doc.id};
      log('Processing document: $data');
      return fromJson(data);
    }).toList();
    
    log('Processed documents: $documents');
    return documents;
  }

  Future<void> update(String id, T data) async {
    await _firestore.collection(collection).doc(id).update(toJson(data));
  }

  Future<void> delete(String id) async {
    await _firestore.collection(collection).doc(id).delete();
  }
}
