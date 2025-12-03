import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_home_app_bar_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/historical_period_card.dart';
import 'package:dalel_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BazarView extends StatefulWidget {
  const BazarView({super.key});

  @override
  State<BazarView> createState() => _BazarViewState();
}

class _BazarViewState extends State<BazarView> {
  @override
  void initState() {
    super.initState();
    // استدعاء البيانات مرة واحدة عند البداية
    final cubit = context.read<HomeCubit>();
    cubit.getHistoricalSouvenirs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarWidget(),
              const SizedBox(height: 18),
              // Categories horizontal list
              CustomItemCard(),
              const SizedBox(height: 16),
              const CustomHeaderText(text: "Historical Souvenirs"),
              const SizedBox(height: 8),

              // Souvenirs grid
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final cubit = context.read<HomeCubit>();

                    if (state is GetHistoricalSouvenirsLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetHistoricalSouvenirsFailureState) {
                      return Center(child: Text(state.errMessage));
                    } else {
                      final souvenirs = cubit.historicalSouvenirs;

                      if (souvenirs.isEmpty) {
                        return const Center(child: Text("No souvenirs found."));
                      }

                      return GridView.builder(
                        itemCount: souvenirs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.58,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                            ),
                        itemBuilder: (context, index) {
                          final souvenir = souvenirs[index];
                          final isFav = favourites.contains(souvenir);

                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.network(
                                    souvenir.image,
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                              height: 100,
                                              color: Colors.grey[300],
                                              child: const Icon(
                                                Icons.image_not_supported,
                                                size: 50,
                                              ),
                                            ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        souvenir.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        souvenir.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        souvenir.price,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        souvenir.availaboility,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (isFav) {
                                                favourites.remove(souvenir);
                                              } else {
                                                favourites.add(souvenir);
                                              }
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                isFav
                                                    ? Colors.green
                                                    : Colors.brown,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          ),
                                          child: Text(
                                            isFav
                                                ? "Added"
                                                : "Add to Favourite",
                                            style: AppTextstyle
                                                .heebo400wstyle16Regular
                                                .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
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
