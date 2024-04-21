import 'package:bldapp/Colors.dart';
import 'package:bldapp/Provider/ProvidetUser.dart';
import 'package:bldapp/Provider/languge_state.dart';
import 'package:bldapp/Provider/notification_provider.dart';
import 'package:bldapp/services/shared_prefrance.dart';
import 'package:bldapp/view/DonationView.dart';
import 'package:bldapp/view/LoginView.dart';
import 'package:bldapp/view/PagesView.dart';
import 'package:bldapp/view/RegisterView.dart';
import 'package:bldapp/view/SearchView.dart';
import 'package:bldapp/view/ServiceView.dart';
import 'package:bldapp/view/Splash_Screen.dart';
import 'package:bldapp/view/updatessss/hospital.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Provider/theme_provider.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) {
        return FormProvider();
      },
    ),
    ChangeNotifierProvider(create: (context) {
      return ThemeProvider();
    }),
    ChangeNotifierProvider(create: (context) {
      return UserLogin();
      
    }),
  ChangeNotifierProvider(create: (context) {
      return LanguageProvider();
      
    }),
    
  ], child: const BloodDonationLocator()));
}

class BloodDonationLocator extends StatefulWidget {
  const BloodDonationLocator({Key? key}) : super(key: key);
  @override
  State<BloodDonationLocator> createState() => _BloodDonationLocatorState();
}

class _BloodDonationLocatorState extends State<BloodDonationLocator> {
  @override
  getdata() async {
    await getStringLogin();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var _theme = Provider.of<ThemeProvider>(context);
      var _languge = Provider.of<LanguageProvider>(context);
 
    return MaterialApp(
      locale:_languge.isArabic ? Locale('ar') : Locale('en'),
       localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        scaffoldBackgroundColor: _theme.isDarkMode ? background : Colors.white,
        brightness: _theme.isDarkMode ? Brightness.dark : Brightness.light,
      ),
      title: 'Blood Locator Donate',
      debugShowCheckedModeBanner: false,
      routes: {
        SplashView.id: (context) => SplashView(),
        PagesView.id: (context) => const PagesView(),
        LoginView.id: (context) => LoginView(),
        RegisterView.id: (context) => RegisterView(),
        ServiceView.id: (context) => const ServiceView(),
        SearchView.id: (context) => const SearchView(),
      },
      home: FutureBuilder<bool>(
        future: checkUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.data == true) {
            return HospitalDashboard();
          } else if (Provider.of<UserLogin>(context).isLogin == true) {
            return ServiceView();
          } else {
            return SplashView();
          }
        },
      ),
    );
  }

  Future<bool> checkUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('isLongging') ?? false;
  }
}
