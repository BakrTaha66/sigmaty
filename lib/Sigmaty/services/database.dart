

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  final fireStore = FirebaseFirestore.instance;

  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: username)
        .get();
  }

  getUserByUserEmail(String userEmail) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: userEmail)
        .get();
  }


  Future<void> student(String userId, userMap) async {
    try {

      // Create a new document in the "users" collection with the given user ID
      await fireStore.collection('student').doc(userId).set(userMap);

      print('User document created successfully');
    } catch (e) {
      print('Error creating user document: $e');
    }
  }


  Future<void> teacher(String userId, userMap) async {
    try {

      // Create a new document in the "users" collection with the given user ID
      await fireStore.collection('teacher').doc(userId).set(userMap);

      print('User document created successfully');
    } catch (e) {
      print('Error creating user document: $e');
    }
  }

  // Future<void> teacherChapter(String userId, chapterMap) async {
  //   try {
  //
  //     // Create a new document in the "users" collection with the given user ID
  //     await fireStore.collection('teacher').doc(userId).collection('chapters').add(chapterMap);
  //
  //     print('User document created successfully');
  //   } catch (e) {
  //     print('Error creating user document: $e');
  //   }
  // }
  // Function to create a contact document in a user's subcollection
  // Future<void> createContact(String userId, String contactId, dynamic contactMap) async {
  //   try {
  //
  //     // Create a new document in the "contacts" subcollection of the user's document
  //     await fireStore.collection('users').doc(userId).collection('contacts').doc(contactId).set(contactMap);
  //
  //     print('Contact document created successfully');
  //   } catch (e) {
  //     print('Error creating contact document: $e');
  //   }
  // }


  // Future<String?> addPhone(String userId, String phoneNumber) async {
  //   try {
  //
  //     // Create a new document in the "mobiles" collection
  //     await fireStore.collection('mobiles').doc(phoneNumber).set({
  //       'userId' : userId
  //     });
  //
  //     print('Mobile document created successfully');
  //   } catch (e) {
  //     print('Error creating mobile document: $e');
  //   }
  // }




  createChatRoom(String chatRoomId, chatRoomMap) {
    FirebaseFirestore.instance
        .collection('ChatRoom')
        .doc(chatRoomId)
        .set(chatRoomMap)
        .catchError((e) {
          print(e.toString());
    });
  }

}