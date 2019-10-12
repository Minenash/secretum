import 'package:flutter/material.dart';
import '../Memory.dart';

class eText extends Text{

  eText(String text, {Color color, FontWeight weight, double size, TextAlign align, bool italic}) : super(text,
    textAlign: align,
    style: TextStyle(
      color: color ?? Memory.theme.primary,
      fontWeight: weight,
      fontSize: size,
      fontStyle: italic != null && italic? FontStyle.italic : FontStyle.normal,
    ),
  );
}