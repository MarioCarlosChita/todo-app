import 'package:flutter/material.dart';
import 'package:solid_principles/main_app.dart';
import 'package:solid_principles/src/core/models/flavour.dart';

void main() {
  Flavour.flavour = FlavourEnvirement.HML;
  mainApp();
}
