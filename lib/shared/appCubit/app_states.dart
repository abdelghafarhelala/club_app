abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeLanguageState extends AppStates {}

class ChangeNavButtomNavState extends AppStates {}

class AppChangeThemState extends AppStates {}

//get user data states
class AppGetUserDataSuccessState extends AppStates {}

class AppGetUserDataErrorState extends AppStates {}

class AppGetUserDataLoadingState extends AppStates {}

//get club details data states
class AppGetClubDetailsDataSuccessState extends AppStates {}

class AppGetClubDetailsDataErrorState extends AppStates {}

class AppGetClubDetailsDataLoadingState extends AppStates {}
