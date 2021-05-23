class ResponseObj {
  MsgStage msgStage;
  ErrorState errorState;
  dynamic data;

  ResponseObj({this.data, this.errorState, this.msgStage});
}

enum MsgStage {
  loading,
  data,
  error,
  other,
}

enum ErrorState {
  serverErr,
  notfoundErr,
  unknownErr,
}
