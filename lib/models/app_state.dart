class AppState {
  bool isLoading;

  AppState({
    this.isLoading = false,
  });

  factory AppState.loading() => new AppState(isLoading: true);


  /// methods that can be used in various ways to compare instances of AppState
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading;

  @override
  int get hashCode => isLoading.hashCode;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading}';
  }
}