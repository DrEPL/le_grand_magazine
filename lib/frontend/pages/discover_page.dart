import 'package:flutter/material.dart';
import 'package:le_grand_magazine/frontend/enums/category.dart';
import 'package:le_grand_magazine/frontend/widgets/category_chip.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    const  categories = Category.values;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Découvrez", style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40)),
            Text("Des nouvelles du monde entier", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, color: Colors.black)),
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryChip(label: categories[index].displayName());
                },
                separatorBuilder: (context, _) {
                  return const SizedBox(width: 5);
                },
                itemCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
