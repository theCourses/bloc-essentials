// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/anounymous-route-access/anounymous_route_access.dart';
import 'package:flutter_bloc_essentials/bloc-to-bloc-listener/bloc_to_bloc_lister.dart';
import 'package:flutter_bloc_essentials/bloc-to-bloc/bloc_to_bloc.dart';
import 'package:flutter_bloc_essentials/bloc-to-bloc/observer/color_bloc_observer.dart';
import 'package:flutter_bloc_essentials/cubit-to-cubit-listener/cubit_to_cubit_listener.dart';
import 'package:flutter_bloc_essentials/cubit-to-cubit/cubit_to_cubit.dart';
import 'package:flutter_bloc_essentials/generated-route-access/generated_route_access.dart';
import 'package:flutter_bloc_essentials/my_counter_bloc/my_counter_bloc.dart';
import 'package:flutter_bloc_essentials/my_counter_cubit/my_counter_cubit.dart';
import 'package:flutter_bloc_essentials/named-route-access/named_route_access.dart';
import 'package:flutter_bloc_essentials/payload/payload.dart';

void main() {
  Bloc.observer = ColorBlocObserver();
  runApp(const BlocToBlocApp());
}
