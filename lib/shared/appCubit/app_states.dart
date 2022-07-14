import 'package:club_app/models/userModel/userModel.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeLanguageState extends AppStates {}

class ChangeNavButtomNavState extends AppStates {}

class AppChangeThemState extends AppStates {}

//get user data states
class AppGetUserDataSuccessState extends AppStates {}

class PasswordShownState extends AppStates {}

class PasswordShownStatee extends AppStates {}

class AppGetUserDataErrorState extends AppStates {}

class AppGetUserDataLoadingState extends AppStates {}

//get club details data states
class AppGetClubDetailsDataSuccessState extends AppStates {}

class AppGetClubDetailsDataErrorState extends AppStates {}

class AppGetClubDetailsDataLoadingState extends AppStates {}

class AppGetClubsSuccessState extends AppStates {}

class AppGetClubsErrorState extends AppStates {}

class AppGetClubsLoadingState extends AppStates {}

class AppGetgovernoratesSuccessState extends AppStates {}

class AppGetgovernoratesErrorState extends AppStates {}

class AppGetgovernoratesLoadingState extends AppStates {}

class AppGetProjectSuccessState extends AppStates {}

class AppGetProjectErrorState extends AppStates {}

class AppGetProjectLoadingState extends AppStates {}

//update user data states
class AppUpdateUserDataSuccessState extends AppStates {
  final UserModel? model;

  AppUpdateUserDataSuccessState(this.model);
}

class AppUpdateUserDataErrorState extends AppStates {}

class AppUpdateUserDataLoadingState extends AppStates {}
