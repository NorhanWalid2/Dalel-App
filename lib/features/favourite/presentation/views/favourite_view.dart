import 'package:dalel_app/features/home/presentation/views/widgets/custom_home_app_bar_widget.dart';
import 'package:dalel_app/main.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatefulWidget {
  FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomAppBarWidget(),
            ),
            favourites.isEmpty
                ? const Center(child: Text("No favourites yet"))
                : ListView.builder(
                  itemCount: favourites.length,
                  itemBuilder: (context, index) {
                    final item = favourites[index];
                    return ListTile(
                      leading: Image.network(
                        item.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item.name),
                      subtitle: Text(item.price),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          favourites.remove(item);
                          setState(() {}); // refresh screen
                        },
                      ),
                    );
                  },
                ),
          ],
        ),
      ),
    );
  }
}
