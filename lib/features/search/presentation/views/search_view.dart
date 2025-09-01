import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  List<Map<String, dynamic>> _results = [];
  List<String> _searchHistory = [];

  // البحث الديناميكي مع debounce
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        setState(() => _results = []);
        return;
      }

      List<Map<String, dynamic>> searchResults = [];

      // البحث في periods
      final periodsSnapshot =
          await FirebaseFirestore.instance
              .collection('historical_periods')
              .where('name', isGreaterThanOrEqualTo: query)
              .where('name', isLessThan: query + '\uf8ff')
              .get();

      for (var doc in periodsSnapshot.docs) {
        final data = doc.data();
        searchResults.add({
          'type': 'period',
          'name': data['name'],
          'description': data['description'],
          'image': data['image'],
        });
      }

      // البحث في wars
      final allPeriods =
          await FirebaseFirestore.instance
              .collection('historical_periods')
              .get();
      for (var doc in allPeriods.docs) {
        final data = doc.data();
        final warsData = data['wars'];

        if (warsData != null) {
          if (warsData is List) {
            for (var war in warsData) {
              if (war['name'].toString().toLowerCase().contains(
                query.toLowerCase(),
              )) {
                searchResults.add({
                  'type': 'war',
                  'name': war['name'],
                  'description': war['description'],
                  'image': war['image'],
                  'periodName': data['name'],
                });
              }
            }
          } else if (warsData is Map) {
            final war = warsData;
            if (war['name'].toString().toLowerCase().contains(
              query.toLowerCase(),
            )) {
              searchResults.add({
                'type': 'war',
                'name': war['name'],
                'description': war['description'],
                'image': war['image'],
                'periodName': data['name'],
              });
            }
          }
        }
      }

      setState(() {
        _results = searchResults;
      });
    });
  }

  // حفظ البحث النهائي في التاريخ
  void _addToHistory(String query) {
    if (query.isEmpty) return;
    if (!_searchHistory.contains(query)) {
      setState(() {
        _searchHistory.add(query);
      });
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(
        children: [
          // TextField
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "ابحث عن فترة أو حرب...",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: _onSearchChanged,
              onSubmitted: _addToHistory,
            ),
          ),

          // عرض history افقي
          if (_searchHistory.isNotEmpty)
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _searchHistory.length,
                itemBuilder: (context, index) {
                  final query = _searchHistory[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ElevatedButton(
                      onPressed: () {
                        _controller.text = query;
                        _onSearchChanged(query);
                      },
                      child: Text(query),
                    ),
                  );
                },
              ),
            ),

          const SizedBox(height: 16),

          // عرض النتائج
          Expanded(
            child:
                _results.isEmpty
                    ? Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "لا توجد نتائج",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                    : ListView.builder(
                      itemCount: _results.length,
                      itemBuilder: (context, index) {
                        final item = _results[index];
                        return ListTile(
                          leading:
                              item['image'] != null
                                  ? Image.network(
                                    item['image'],
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (_, __, ___) => const Icon(Icons.error),
                                  )
                                  : const Icon(Icons.image),
                          title: Text(item['name'] ?? ''),
                          trailing: Text(
                            item['type'] == 'period'
                                ? "Period"
                                : "War (${item['periodName']})",
                            style: const TextStyle(fontSize: 12),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
