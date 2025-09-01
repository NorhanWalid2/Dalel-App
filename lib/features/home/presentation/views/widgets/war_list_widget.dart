// import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
// import 'package:flutter/material.dart';

// class HistoricalDetailsScreen extends StatelessWidget {
//   final HistoricalPeriodsModel period;

//   const HistoricalDetailsScreen({super.key, required this.period});

//   @override
//   Widget build(BuildContext context) {
//     // wars جايه Map فلازم احولها لـ List من الـ values
//     final warsList = period.wars.values.toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(period.name),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(period.image),
//             const SizedBox(height: 12),
//             Text(
//               period.description,
//               style: const TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 20),

//             /// عنوان الحروب
//             const Text(
//               "الحروب:",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),

//             /// عرض كل حرب
//             ListView.builder(
//               shrinkWrap: true, // مهم علشان يشتغل جوه SingleChildScrollView
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: warsList.length,
//               itemBuilder: (context, index) {
//                 final war = warsList[index];
//                 return Card(
//                   margin: const EdgeInsets.symmetric(vertical: 8),
//                   child: ListTile(
//                     leading: war["image"] != null
//                         ? Image.network(war["image"], width: 50, height: 50, fit: BoxFit.cover)
//                         : const Icon(Icons.error),
//                     title: Text(war["name"] ?? "بدون اسم"),
//                     subtitle: Text(war["description"] ?? "لا يوجد وصف"),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
