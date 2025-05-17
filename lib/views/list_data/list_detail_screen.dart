import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_231011700253/component/button.dart';
import 'package:project_231011700253/model/list_item_model.dart';

class DetailScreen extends StatefulWidget {
  final ListItem item;

  const DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String? selectedItem1;
  String? selectedItem2;

  final List<String> dataList1 = ['Data gw', 'Data lu', 'Data aja'];
  final List<String> dataList2 = ['Apel', 'Pisang', 'Jeruk', 'Nanas', 'Mangga'];

  void _showSearchPopup({
    required List<String> data,
    required String title,
    required Function(String) onItemSelected,
  }) {
    TextEditingController searchController = TextEditingController();
    List<String> filteredList = List.from(data);

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: 'Cari...',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setStateDialog(() {
                        filteredList = data
                            .where((e) => e
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    width: double.maxFinite,
                    child: ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredList[index]),
                          onTap: () {
                            onItemSelected(filteredList[index]);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: const Text('Tutup'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showPopup() {
    _showSearchPopup(
      data: dataList1,
      title: "Pilih Data",
      onItemSelected: (value) {
        setState(() {
          selectedItem1 = value;
        });
      },
    );
  }

  void _showAutocompletePopup() {
    String? selected;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Pilih Data"),
          content: StatefulBuilder(
            builder: (context, setStateDialog) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: "Cari Data",
                      border: OutlineInputBorder(),
                    ),
                    items: dataList2.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setStateDialog(() {
                        selected = val;
                      });
                    },
                    value: selected,
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              child: const Text("Batal"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                if (selected != null) {
                  setState(() {
                    selectedItem2 = selected;
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('yyyy-MM-dd HH:mm').format(widget.item.createdAt);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Detail',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFF0B55),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.item.icon, size: 40, color: Colors.black54),
            const SizedBox(height: 16),
            Text(
              widget.item.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFCF0F47),
              ),
            ),
            const SizedBox(height: 12),
            Text(widget.item.shortDesc,
                style: const TextStyle(fontSize: 18, color: Colors.black87)),
            const SizedBox(height: 16),
            Text(widget.item.desc,
                style: const TextStyle(fontSize: 16, color: Colors.black54)),
            const SizedBox(height: 20),
            Text('Created At: $formattedDate',
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 30),
            Button(
              text: 'Pilih Data',
              isFullWidth: true,
              onPressed: _showPopup,
            ),
            const SizedBox(height: 10),
            Button(
              text: 'Autocomplete Data',
              isFullWidth: true,
              onPressed: _showAutocompletePopup,
            ),
            const SizedBox(height: 20),
            if (selectedItem1 != null)
              Text("Data dipilih: $selectedItem1",
                  style: const TextStyle(fontSize: 16)),
            if (selectedItem2 != null)
              Text("Data dipilih: $selectedItem2",
                  style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
