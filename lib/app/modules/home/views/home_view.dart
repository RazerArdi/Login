import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codelabmodul3/app/modules/home/controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

// Halaman utama untuk menampilkan dan mengelola daftar tugas
class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController()); // Menginisialisasi HomeController

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'), // Judul halaman
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.getTasks(), // Mendapatkan stream data tugas
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Loading indicator
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching tasks: ${snapshot.error}')); // Menampilkan error
          }

          final tasks = snapshot.data?.docs ?? []; // Mendapatkan data tugas
          if (tasks.isEmpty) {
            return const Center(child: Text('No tasks available.')); // Pesan jika tidak ada tugas
          }

          return ListView.builder(
            itemCount: tasks.length, // Jumlah tugas
            itemBuilder: (context, index) {
              final task = tasks[index]; // Mengambil tugas
              final id = task.id; // ID tugas
              final nama = task['nama']; // Nama tugas
              final deskripsi = task['deskripsi']; // Deskripsi tugas
              final tanggal = (task['tanggal'] as Timestamp).toDate(); // Tanggal tugas

              return ListTile(
                title: Text(nama), // Menampilkan nama tugas
                subtitle: Text(
                  '${deskripsi}\n${DateFormat.yMMMd().format(tanggal)}', // Menampilkan deskripsi dan tanggal
                ),
                isThreeLine: true,
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      showTaskDialog(
                        context,
                        isEdit: true,
                        id: id,
                        nama: nama,
                        deskripsi: deskripsi,
                        tanggal: tanggal,
                      ); // Menampilkan dialog edit
                    } else if (value == 'delete') {
                      controller.deleteTask(id); // Menghapus tugas
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'), // Opsi edit
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'), // Opsi hapus
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTaskDialog(context), // Menampilkan dialog untuk menambah tugas
        child: const Icon(Icons.add),
      ),
    );
  }

  // Dialog untuk menambah atau mengedit tugas
  void showTaskDialog(BuildContext context, {bool isEdit = false, String? id, String? nama, String? deskripsi, DateTime? tanggal}) {
    final namaController = TextEditingController(text: nama ?? '');
    final deskripsiController = TextEditingController(text: deskripsi ?? '');
    final tanggalController = TextEditingController(
      text: tanggal != null ? DateFormat.yMMMd().format(tanggal) : '',
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEdit ? 'Edit Task' : 'Add Task'), // Judul dialog
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama'), // Input untuk nama tugas
              ),
              TextField(
                controller: deskripsiController,
                decoration: const InputDecoration(labelText: 'Deskripsi'), // Input untuk deskripsi tugas
              ),
              TextField(
                controller: tanggalController,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Tanggal'), // Input untuk tanggal
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    tanggalController.text =
                        DateFormat.yMMMd().format(pickedDate); // Menetapkan tanggal yang dipilih
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Menutup dialog
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final nama = namaController.text;
                final deskripsi = deskripsiController.text;
                final tanggal = DateFormat.yMMMd().parse(tanggalController.text);

                if (isEdit) {
                  controller.updateTask(id!, nama, deskripsi, tanggal); // Memperbarui tugas
                } else {
                  controller.addTask(nama, deskripsi, tanggal); // Menambahkan tugas baru
                }

                Navigator.pop(context); // Menutup dialog
              },
              child: Text(isEdit ? 'Update' : 'Add'), // Tombol untuk menambah atau memperbarui
            ),
          ],
        );
      },
    );
  }
}
