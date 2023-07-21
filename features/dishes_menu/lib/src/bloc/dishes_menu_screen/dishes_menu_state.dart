part of 'dishes_menu_bloc.dart';

class MenuState {
  final List<DishTypeModel> items;
  final bool isLoading;
  final String errorMessage;
  final int currentTab;
  final bool showSnackBar;

  MenuState({
    required this.items,
    this.isLoading = false,
    this.errorMessage = '',
    this.currentTab = 0,
    this.showSnackBar = false,
  });

  MenuState copyWith({
    List<DishTypeModel>? items,
    bool? isLoading,
    String? errorMessage,
    int? currentTab,
    bool? showSnackBar,
  }) {
    return MenuState(
      items: items ?? this.items,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      currentTab: currentTab ?? this.currentTab,
      showSnackBar: showSnackBar ?? this.showSnackBar,
    );
  }
}
