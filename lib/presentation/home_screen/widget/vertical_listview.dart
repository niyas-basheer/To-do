import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
  constraints: const BoxConstraints(
    minHeight: 200,
    maxHeight:480 , 
  ),
  child: ListView.separated(
    itemCount: 4,
    separatorBuilder: (context, index) => const Divider(
      color: Colors.transparent,
      thickness: 10,
    ),
    itemBuilder: (context, index) {
      return Container(
        height: 120,
        width: 60,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Tcolors.primary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'No Task',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
      );
    },
  ),
)
;
  }
}
