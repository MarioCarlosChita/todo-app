import 'package:flutter/material.dart';
import 'package:solid_principles/main_app.dart';

import 'src/core/models/flavour.dart';

void main() {
  Flavour.flavour = FlavourEnvirement.PROD;
  mainApp();
}
