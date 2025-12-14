import 'package:dalel_app/core/function/navigation.dart';
import 'package:flutter/material.dart';

class ShowMoreSouvenirCard extends StatelessWidget {
  const ShowMoreSouvenirCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: GestureDetector(
        onTap: () {
          // TODO: navigation to all souvenirs screen
          CustomNavigation(context, '/bazar');
          //Navigator.pushNamed(context, '/bazar');
        },
        child: Container(
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              colors: [Colors.brown.shade400, Colors.brown.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 26,
              ),
              SizedBox(height: 8),
              Text(
                "Show\nMore",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
