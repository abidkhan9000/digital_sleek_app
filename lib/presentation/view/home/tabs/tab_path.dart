import 'dart:developer';

import 'package:digital_sleek/presentation/common/button_widget.dart';
import 'package:digital_sleek/presentation/common/card_widget.dart';
import 'package:digital_sleek/presentation/common/category_widget.dart';
import 'package:digital_sleek/presentation/common/gridview_widget.dart';
import 'package:digital_sleek/presentation/common/notfound_widget.dart';
import 'package:digital_sleek/presentation/common/switch_button.dart';
import 'package:digital_sleek/presentation/common/search_widget.dart';
import 'package:digital_sleek/presentation/common/TTtextfield_widget.dart';
import 'package:digital_sleek/presentation/common/topnews_widget.dart';
import 'package:digital_sleek/presentation/resources/colors.dart';
import 'package:digital_sleek/presentation/resources/fonts.dart';
import 'package:digital_sleek/presentation/resources/screen_size.dart';
import 'package:digital_sleek/presentation/resources/text.dart';
import 'package:digital_sleek/presentation/resources/text.dart';
import 'package:digital_sleek/presentation/view/auth/select_signin/select_sign.dart';
import 'package:digital_sleek/presentation/view/home/cubit/home_cubit.dart';
import 'package:digital_sleek/presentation/view/home/model.dart';
import 'package:digital_sleek/presentation/view/home/path.dart';
import 'package:digital_sleek/presentation/view/privacy_policy/privacy_policy.dart';
import 'package:digital_sleek/presentation/view/splash/splash_screen.dart';
import 'package:digital_sleek/presentation/view/splash/starter_screen.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:digital_sleek/data/services/home_service.dart';

part 'home_tab.dart';
part 'save_tab.dart';
part 'serach_tab.dart';
part 'setting_tab.dart';