import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';

class HorizontalListview extends StatelessWidget {
  const HorizontalListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            color: Tcolors.primary,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              width: 170,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Tasks',
                    style: Theme.of(context).textTheme.displaySmall,  
                  ),
                  const Expanded(child: SizedBox(height: 1)),
                   
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
