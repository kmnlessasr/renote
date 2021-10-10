import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../size_config.dart';

class BookCard extends StatelessWidget {
  const BookCard({
      Key key,
      this.book_name,
      this.doctor_name,
      this.book_case,
      this.notes = "",
      this.page_number,
      this.rasoor,
  });
  final String book_name, doctor_name, book_case, notes;
  final int page_number;
  final bool rasoor;
  @override
  Widget build(BuildContext context) {
    return null;
  }
}