class AppState {
  int count;

  AppState({this.count});

  factory AppState.fromJson(Map<String, dynamic> json) => new AppState(
    count: json["count"].toInt(),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
  };

  AppState makeCopy() {
    return AppState.fromJson(this.toJson());
  }
}