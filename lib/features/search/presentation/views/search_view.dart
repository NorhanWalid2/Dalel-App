import 'dart:async';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_home_app_bar_widget.dart';
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

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        setState(() => _results = []);
        return;
      }

      List<Map<String, dynamic>> searchResults = [];

      // البحث في historical_periods
      final periodsSnapshot =
          await FirebaseFirestore.instance
              .collection('historical_periods')
              .get();

      for (var doc in periodsSnapshot.docs) {
        final data = doc.data();

        // البحث في الاسم
        if (data['name'].toString().toLowerCase().contains(
          query.toLowerCase(),
        )) {
          searchResults.add({
            'type': 'period',
            'name': data['name'],
            'description': data['description'],
            'image': data['image'],
          });
        }

        // البحث في الحروب
        final warsData = data['wars'];
        if (warsData != null) {
          if (warsData is List) {
            for (var war in warsData) {
              if (war['title'].toString().toLowerCase().contains(
                query.toLowerCase(),
              )) {
                searchResults.add({
                  'type': 'war',
                  'name': war['title'],
                  'description': war['description'] ?? '',
                  'image': war['image'] ?? '',
                  'periodName': data['name'],
                });
              }
            }
          } else if (warsData is Map) {
            final war = warsData;
            if (war['title'].toString().toLowerCase().contains(
              query.toLowerCase(),
            )) {
              searchResults.add({
                'type': 'war',
                'name': war['title'],
                'description': war['description'] ?? '',
                'image': war['image'] ?? '',
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
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(title: const Text("Search")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBarWidget(),
              const SizedBox(height: 18),
              // TextField
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "Search for a period or a war",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: _onSearchChanged,
                  onSubmitted: _addToHistory,
                ),
              ),

              // عرض history افقي
              // عرض history افقي
              if (_searchHistory.isNotEmpty)
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _searchHistory.length, // بدل _results.length
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

              // عرض النتائج
              Expanded(
                child:
                    _results.isEmpty
                        ? const Center(child: Text("there is no results "))
                        : ListView.builder(
                          itemCount: _results.length,
                          itemBuilder: (context, index) {
                            final item = _results[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 12,
                              ),
                              child: ListTile(
                                leading:
                                    item['image'] != null && item['image'] != ''
                                        ? Image.network(
                                          item['image'],
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        )
                                        : const Icon(Icons.image),
                                title: Text(item['name'] ?? ''),
                                subtitle: Text(
                                  item['type'] == 'period' ? "Period" : "War",
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => DetailsPage(item: item),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> item;
  const DetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final wars = item['wars'] as List<dynamic>? ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(item['name'] ?? '')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة رئيسية
            if (item['image'] != null && item['image'] != '')
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item['image'],
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),

            // الوصف
            if (item['description'] != null)
              Text(item['description'], style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),

            // الحروب
            if (wars.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Wars:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  for (var war in wars)
                    Card(
                      child: ListTile(
                        leading:
                            war['image'] != null && war['image'] != ''
                                ? Image.network(
                                  war['image'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )
                                : const Icon(Icons.image),
                        title: Text(war['title'] ?? ''),
                        subtitle: Text(war['description'] ?? ''),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
