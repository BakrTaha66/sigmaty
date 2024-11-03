import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sigmaty/Sigmaty/services/database.dart';
import 'package:video_player/video_player.dart';

class MediaUploadService {
  DatabaseMethods databaseMethods = DatabaseMethods();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // final ImagePicker _picker = ImagePicker();
  List<Map<String, dynamic>> savedItems = [];

  // List<File> savedVideos = []; // List to store saved video files
  // List<File> savedImages = []; // List to store saved video files
  // final List<VideoPlayerController> videoControllers = [];
  File? pickedVideoFile; // Temporary variable to hold the picked video
  File? pickedImageFile; // Single image file
  File? pickedImageFileChapter; // Single image file
  // late VideoPlayerController controller;

  // Function to pick a video (but not save it yet)
  Future<void> pickVideo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedVideoFile = File(pickedFile.path); // Store picked video temporarily
      print('Picked video: ${pickedVideoFile!.path}');
    } else {
      print('No video selected');
    }
  }

  // Function to pick an image and save it locally
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImageFile = File(pickedFile.path); // Save image to memory
      print('Image saved locally!');
    } else {
      print('No image selected');
    }
  }

  // Function to pick an image and save it locally
  Future<void> pickImageChapter() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImageFileChapter = File(pickedFile.path); // Save image to memory
      print('Image saved locally!');
    } else {
      print('No image selected');
    }
  }

  // Function to save the picked video into the list
  // Future<void> saveVideo() async {
  //   if (pickedVideoFile != null) {
  //     savedVideos
  //         .add(pickedVideoFile!); // Add picked video to saved videos list
  //
  //     // Create a VideoPlayerController for the saved video
  //     VideoPlayerController controller =
  //         VideoPlayerController.file(pickedVideoFile!);
  //
  //     // Ensure the controller initializes fully before adding it to the list
  //     await controller.initialize().then((_) {
  //       controller.setLooping(true);
  //       videoControllers.add(controller);
  //       pickedVideoFile = null; // Reset the picked video after saving
  //     });
  //   } else {
  //     print('No video to save');
  //   }
  // }

  // Save Text, Image, and Video
  Future<void> saveTextImageVideo({required String sessionName}) async {
    if (sessionName.isNotEmpty ||
        pickedImageFile != null ||
        pickedVideoFile != null) {
      savedItems.add({
        'sessionName': sessionName,
        'image': pickedImageFile,
        'video': pickedVideoFile,
      });

      // Create a VideoPlayerController for the saved video
      //     VideoPlayerController controller =
      //         VideoPlayerController.file(pickedVideoFile!);
      //
      //     // Ensure the controller initializes fully before adding it to the list
      //     await controller.initialize().then((_) {
      //       controller.setLooping(true);
      //       pickedVideoFile = null; // Reset the picked video after saving
      //     });
    }
  }

  Future<void> uploadToFirestore(String teacherName, String chapterName) async {
    List<Map<String, dynamic>> uploadedItems = [];
    String? imageUrlChapter;

    for (var item in savedItems) {
      String sessionName = item['sessionName'];
      String? imageUrl;
      String? videoUrl;

      try {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageRef = _storage.ref().child('images/$fileName');
        UploadTask uploadTask = storageRef.putFile(pickedImageFile!);

        // Get the download URL after upload
        TaskSnapshot snapshot = await uploadTask;
        imageUrl = await snapshot.ref.getDownloadURL();

        print('Image uploaded!');
      } catch (e) {
        print('Error uploading image: $e');
      }

      try {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageRef = _storage.ref().child('videos/$fileName');
        UploadTask uploadTask = storageRef.putFile(pickedVideoFile!);

        // Get the download URL after each upload
        TaskSnapshot snapshot = await uploadTask;
        videoUrl = await snapshot.ref.getDownloadURL();

        print('Video uploaded!');
      } catch (e) {
        print('Error uploading video: $e');
      }

      uploadedItems.add({
        'sessionName': sessionName,
        'image': imageUrl ?? '',
        'video': videoUrl ?? '',
      });
    }

    // Upload the image if one is selected
    if (pickedImageFileChapter != null) {
      try {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageRef = _storage.ref().child('imageChapter/$fileName');
        UploadTask uploadTask = storageRef.putFile(pickedImageFileChapter!);

        // Get the download URL after upload
        TaskSnapshot snapshot = await uploadTask;
        imageUrlChapter = await snapshot.ref.getDownloadURL();
        print('Image uploaded!');
      } catch (e) {
        print('Error uploading image: $e');
      }
    }

    // Upload the list of items to Firestore
    await databaseMethods.fireStore
        .collection('teacher')
        .doc(teacherName)
        .collection('chapters')
        .doc(chapterName)
        .set({
      'chapterName': chapterName,
      'imageChapter' : imageUrlChapter,
      'items': uploadedItems,
    });

    // Clear saved items after upload
    savedItems.clear();
  }

  // Future<void> saveImage() async {
  //   if (pickedImageFile != null) {
  //     savedImages
  //         .add(pickedImageFile!); // Add picked video to saved videos list
  //     pickedImageFile = null;
  //     // Create a VideoPlayerController for the saved video
  //
  //   } else {
  //     print('No video to save');
  //   }
  // }

  // void disposeControllers() {
  //   // Dispose of all the video controllers when they are no longer needed
  //   for (var controller in videoControllers) {
  //     controller.dispose();
  //   }
  // }
  // Function to upload both the image and saved videos
  // Future<void> uploadMedia(
  //     String teacherName, String chapterName, String sessionName) async {
  //   List<String> imageUrls = [];
  //   List<String> videoUrls = [];
  //
  //   // Upload the image if one is selected
  //   if (savedImages.isNotEmpty) {
  //     for(File imageFile in savedImages){
  //       try {
  //         String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //         Reference storageRef = _storage.ref().child('images/$fileName');
  //         UploadTask uploadTask = storageRef.putFile(imageFile);
  //
  //         // Get the download URL after upload
  //         TaskSnapshot snapshot = await uploadTask;
  //         String imageUrl = await snapshot.ref.getDownloadURL();
  //         imageUrls.add(imageUrl);
  //
  //         print('Image uploaded!');
  //       } catch (e) {
  //         print('Error uploading image: $e');
  //       }
  //     }
  //   }
  //
  //   // Upload all saved videos if any
  //   if (savedVideos.isNotEmpty) {
  //     for (File videoFile in savedVideos) {
  //       try {
  //         String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //         Reference storageRef = _storage.ref().child('videos/$fileName');
  //         UploadTask uploadTask = storageRef.putFile(videoFile);
  //
  //         // Get the download URL after each upload
  //         TaskSnapshot snapshot = await uploadTask;
  //         String videoUrl = await snapshot.ref.getDownloadURL();
  //         videoUrls.add(videoUrl);
  //         print('Video uploaded!');
  //       } catch (e) {
  //         print('Error uploading video: $e');
  //       }
  //     }
  //   }
  //
  //   // Save both image URL and video URLs to Firestore
  //   if (imageUrls.isNotEmpty || videoUrls.isNotEmpty) {
  //     Map<String, dynamic> updateData = {
  //       'chapterName': chapterName,
  //       'sessionName': sessionName,
  //     };
  //
  //     if (imageUrls.isNotEmpty) {
  //       updateData['image'] = FieldValue.arrayUnion(imageUrls); // Add image URL
  //     }
  //     if (videoUrls.isNotEmpty) {
  //       updateData['videos'] =
  //           FieldValue.arrayUnion(videoUrls); // Add video URLs
  //     }
  //
  //     await databaseMethods.fireStore
  //         .collection('teacher')
  //         .doc(teacherName)
  //         .collection('chapters')
  //         .doc(chapterName)
  //         .set(updateData);
  //     print('All media uploaded and URLs saved to Firestore!');
  //
  //     // Clear the saved data
  //     pickedImageFile = null;
  //     savedVideos.clear();
  //     videoControllers.clear();
  //   } else {
  //     print('No media to upload');
  //   }
  // }
}
