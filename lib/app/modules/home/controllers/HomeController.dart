import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

// Kontroler untuk menangani operasi tugas menggunakan Cloud Firestore
class HomeController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Tambah Data ke Firestore
  Future<void> addTask(String nama, String deskripsi, DateTime tanggal) async {
    try {
      await firestore.collection('tasks').add({
        'nama': nama,
        'deskripsi': deskripsi,
        'tanggal': Timestamp.fromDate(tanggal),
      });
      Get.snackbar('Success', 'Task added successfully!'); // Notifikasi sukses
    } catch (e) {
      Get.snackbar('Error', 'Failed to add task: $e'); // Notifikasi error
    }
  }

  // Update Data di Firestore
  Future<void> updateTask(String id, String nama, String deskripsi, DateTime tanggal) async {
    try {
      await firestore.collection('tasks').doc(id).update({
        'nama': nama,
        'deskripsi': deskripsi,
        'tanggal': Timestamp.fromDate(tanggal),
      });
      Get.snackbar('Success', 'Task updated successfully!'); // Notifikasi sukses
    } catch (e) {
      Get.snackbar('Error', 'Failed to update task: $e'); // Notifikasi error
    }
  }

  // Hapus Data dari Firestore
  Future<void> deleteTask(String id) async {
    try {
      await firestore.collection('tasks').doc(id).delete();
      Get.snackbar('Success', 'Task deleted successfully!'); // Notifikasi sukses
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete task: $e'); // Notifikasi error
    }
  }

  // Ambil Data dari Firestore
  Stream<QuerySnapshot> getTasks() {
    return firestore.collection('tasks').snapshots(); // Mengembalikan stream data tugas
  }
}
