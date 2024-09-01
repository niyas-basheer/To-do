import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/application/add_item_bloc/add_item_bloc.dart';
import 'package:to_do/application/add_item_bloc/add_item_event.dart';
import 'package:to_do/application/add_item_bloc/add_item_state.dart';
import 'package:to_do/utils/constants/colors.dart';

class HorizontalCalander extends StatelessWidget {
  const HorizontalCalander({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: BlocBuilder<AddItemBloc, AddItemState>(
        builder: (context, state) {
          DateTime initialDate = DateTime.now();
          if (state is AddItemInitial) {
            initialDate = state.initialDate;
          } else if (state is DateChangedState) {
            initialDate = state.selectedDate;
          }

          return DatePicker(
            DateTime.now(),
            height: 110,
            width: 90,
            initialSelectedDate: initialDate,
            selectionColor: Tcolors.primary,
            selectedTextColor: Tcolors.white,
            dateTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 24.0, fontWeight: FontWeight.w600, color: Tcolors.grey),
            ),
            monthTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 14.0, fontWeight: FontWeight.w600, color: Tcolors.grey),
            ),
            dayTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 16.0, fontWeight: FontWeight.w600, color: Tcolors.grey),
            ),
            onDateChange: (selectedDate) {
             
              context.read<AddItemBloc>().add(DateChangedEvent(selectedDate));
            },
          );
        },
      ),
    );
  }
}
