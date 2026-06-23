import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:piano_app/piano_hive/progress_model.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, size: 25),
        ),
        centerTitle: true,
        title: const Text(
          "Melora",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF8F8F6), Color(0xFFE4F2FD), Color(0xFFB9B4E8)],
          ),
        ),
        child: Builder(
          builder: (context) {
            final box = Hive.box<ProgressModel>("progressBox");
            final items = box.values.toList();
            if (items.isEmpty) {
              return Center(
                child: Text(
                  "No Progress Yet! \nStart Practice Now🎹",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              );
            }
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Card(
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                    title: Text(
                      item.songName,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${item.difficulty}\n${item.performanceLevel}\nScore: ${item.score}%",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: () {
                            item.delete();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
