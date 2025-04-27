enum AppAuthenticationLevel {
  initial,
  unAuthenticated,
  authenticated,
  blocked,
  visitor
}

enum ForgetPasswordLevel {
  enterPhone,
  enterCode,
  enterNewPassword,
}

enum UserType {
  client,
  provider,
}

//sort by
enum SortByEnum {
  suggetionsCars,
  lastAdded,
  lowPrice,
  highPrice,
  lowKm,
  highKm,
  lowYear,
  highYear,
}

enum StateItem {
  darft,
  deleted,
  loadingDelete,
  saved,
  loadingSaved,
}

enum ResetPasswordStateLevel {
  darft,
  enterCode,
  enterNewPassword,
  loading,
  success,
  error,
  successSendCode,
  successEnterdCode,
  successCreateNewPassword,
}

enum FlowStateApp {
  loadingDwonload,
  errorDownload,
  successDownload,
  draft,
  loading,
  userBlocked,
  loadingMore,
  errorLoadingMore,
  successLoadingMore,
  loadingUpdate,
  loadingDelete,
  loadingInsert,
  normal,
  error,
  success,
  successLoggedIn,
  successLoggedInProvider,
  successLoggedOutClient,
  successLoggedOutProvider,
  successRegistedPersional,
  successRegister,
  successInserting,
  successDeleting,
  successUpdate,
  hint,
  missingData,
  unAuthenticated,
  updateApp,
  noConnection,
  weakConnection,
  connectionRestored,
  connectionError,
  connectionTimeOut,
  connectionCanceled,
  connectionUnknownError,
  connectionBadContent,
  newNotification,
  offerCreated,
  notInserted,
  notDeleted,
  notUpdated,
  emailSendSuccfully,
  showNotification,
  emailConfirmedSuccessfully,
  successSendCode,
  successEnterdCode,
  loadingDetails,
  errorShowDetails,
  showDetailsSuccess,
  authChangedSuccessFully,
  langChangedSuccessFlully,
  sendMessageLoading,
  sendMessageError,
  sendMessageSuccess,
  sendMessageUpdatedSuccess,
  sendMessageUpdateError,
  sendMessageUpdateLoading,
  orderCreated,
  orderAccepted,
  orderUpdated,
  orderDeleted,
  orderCanceled,
  orderRejected,
  orderCompleted,

  logoutLoading,
  logoutSuccess,
  logoutError,
  successCode,
  successVerifyCode,
  successChangePassword,
  codeNotVaild,
  successSellCar,
  loadingUser,
  successLoadedUser,
  errorLoadedUser,
  completeChangePassword,
  loadingAddOrRemoveFromWishlish,
  sucessAddOrRemoveFromWishlish,
  errorAddOrRemoveFromWishlish,

  getcategoriesLoading,
  getcategoriesError,
  getcategoriesSuccess,
  getCitiesLoading,
  getCitiesError,
  getCitiesSuccess,
  SwitchingPageSuccess,
  successWithdraw,
  errorWithdraw,
  loadingWithdraw,
  closeSuccessPage,

  paymentLoading,
  paymentSuccess,
  paymentError,
  paymentCanceled,
  loadingCanclOrder,
  successCanclOrder,
  errorCanclOrder,
  // reored
  loadingReorder,
  successReorder,
  errorReorder,
}

enum DataSourceValidationInput {
  empty,
  usernameStyle,
  shortPassword,
  notIdenticalPassword,
  weakPassword,
  veryLong,
  length,
  maxInputCount,
  notPhoneStyle,
  notEmail,
  notInteger,
  notDouble,
  notBool,
  notString,
  containSpecialChar,
  unknown,
  inValidImg,
  inValidFormat,
  nameistoolong,
  descriptionVeryLong,
  descriptionVeryShort,
  promoCodeVeryShort,
  promoCodeVeryLong,
}

enum DataSourcePermission {
  checkPermissionError,
  permissionDenied,
  permissionPermanentlyDenied,
  permissionRestricted,
  unknownPermissionError,
  noImageSelected,
  imageSelected,
  locationServiceDisabled,
  allow
}

enum DataSourceNetworkError {
  noContent,
  badContent,
  forbidden,
  unAuthorized,
  notFound,
  internalServerError,
  socketError,
  formatException,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cashError,
  noInternetConnection,
  unknownError,
  loadingUser,
  successLoadedUser,
  errorLoadedUser,
}

enum DataSourceLaunchUrl {
  success,
  cantNotOpen,
  inValidUrl,
  systemError,
  unKnownLauncherError,
}

enum LanguageCode {
  ar,
  en,
}

enum DataSourceLocalNotification {
  show,
  onInitError,
  onGetSettingIosOrAndroidError,
  onCancelAllError,
  onCancelOneError,
  onShowError,
  onSelectNotificationError,
  onDidReceiveNotificationError,
  onGetDetailsNotificationError
}

enum LogLevel { debug, info, warning, error, trace, success }

enum OrderState {
  inprogress,
  completed,
  pending,
  canceled,
  rejected,
  toDayOrder
}
