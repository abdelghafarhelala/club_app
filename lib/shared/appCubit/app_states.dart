import 'package:club_app/models/note_category/note_category_model.dart';
import 'package:club_app/models/notes/notes_model.dart';
import 'package:club_app/models/remarker/remarker_model.dart';
import 'package:club_app/models/reset_password/reset_password.dart';
import 'package:club_app/models/send_email/send_email.dart';
import 'package:club_app/models/send_opt/send_opt.dart';
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

//get all clubs
class AppGetClubsSuccessState extends AppStates {}

class AppGetClubsErrorState extends AppStates {}

class AppGetClubsLoadingState extends AppStates {}

//get last clubs
class AppGetLastClubsSuccessState extends AppStates {}

class AppGetLastClubsErrorState extends AppStates {}

class AppGetLastClubsLoadingState extends AppStates {}

//get  clubs with filter gov
class AppGetClubsFilteredWithGovSuccessState extends AppStates {}

class AppGetClubsFilteredWithGovErrorState extends AppStates {}

class AppGetClubsFilteredWithGovLoadingState extends AppStates {}

//get all governate
class AppGetgovernoratesSuccessState extends AppStates {}

class AppGetgovernoratesErrorState extends AppStates {}

class AppGetgovernoratesLoadingState extends AppStates {}

//get projects data states
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

class AppGetChangeDropState extends AppStates {}

class AppGetChangeDrop2State extends AppStates {}

class AppGetChangeDrop4State extends AppStates {}

class AppGetChangeDrop3State extends AppStates {}

// app logout states
class AppLogOutSuccessState extends AppStates {}

class AppLogOutErrorState extends AppStates {}

//change city color state
class AppChangeCityColorState extends AppStates {}

//send Email states
class AppSendEmailSuccessState extends AppStates {
  final SendEmailModel? model;

  AppSendEmailSuccessState(this.model);
}

class AppSendEmailErrorState extends AppStates {}

class AppSendEmailLoadingState extends AppStates {}

//send OPt states
class AppSendOptSuccessState extends AppStates {
  final SendOptModel? model;

  AppSendOptSuccessState(this.model);
}

class AppSendOptErrorState extends AppStates {}

class AppSendOptLoadingState extends AppStates {}

//reset Password states
class AppRestPasswordSuccessState extends AppStates {
  final ResetPasswordModel? model;

  AppRestPasswordSuccessState(this.model);
}

class AppRestPasswordErrorState extends AppStates {}

class AppRestPasswordLoadingState extends AppStates {}

//change password states
class AppChangePasswordSuccessState extends AppStates {
  final UserModel? model;

  AppChangePasswordSuccessState(this.model);
}

class AppChangePasswordErrorState extends AppStates {}

class AppChangePasswordLoadingState extends AppStates {}

//get remarker states
class AppGetRemarkerSuccessState extends AppStates {
  final RemarkerModel? model;

  AppGetRemarkerSuccessState(this.model);
}

class AppGetRemarkerErrorState extends AppStates {}

class AppGetRemarkerLoadingState extends AppStates {}

//get remarker states
class AppGetSingleRemarkerSuccessState extends AppStates {}

class AppGetSingleRemarkerErrorState extends AppStates {}

class AppGetSingleRemarkerLoadingState extends AppStates {}

//get remarker states
class AppPostNoteSuccessState extends AppStates {
  final NotesModel? model;

  AppPostNoteSuccessState(this.model);
}

class AppPostNoteErrorState extends AppStates {}

class AppPostNoteLoadingState extends AppStates {}

//get note category states
class AppGetNoteCategorySuccessState extends AppStates {
  final NoteCategoryModel? model;

  AppGetNoteCategorySuccessState(this.model);
}

class AppGetNoteCategoryErrorState extends AppStates {}

class AppGetNoteCategoryLoadingState extends AppStates {}

//click priority state
class AppClickPriorityState extends AppStates {}

//pic image states
class AppPickImageSuccessState extends AppStates {}

class AppPickImageErrorState extends AppStates {}

//pic image states
class AppRemovePickImageState extends AppStates {}

class AppGetdepartmentsLoadingState extends AppStates {}

class AppGetdepartmentsErrorState extends AppStates {}

class AppGetdepartmentsSuccState extends AppStates {}

class AppGetcountLoadingState extends AppStates {}

class AppGetcountErrorState extends AppStates {}

class AppGetcountSuccState extends AppStates {}

class AppchangeListValState extends AppStates {}

class AppCountIndexState extends AppStates {}

class appIsFilterdState extends AppStates {}

class AppChangeEyeState extends AppStates {}
