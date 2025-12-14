
import 'package:dalel_app/features/bazar/data/souvenirs_model.dart';
import 'package:flutter/material.dart';

class HistoricalSouvenirImage extends StatelessWidget {
  const HistoricalSouvenirImage({
    super.key,
    required this.souvenir,
  });

  final SouvenirsModel souvenir;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}
