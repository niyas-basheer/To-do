abstract class NavigationEvent {}

class NavigateToPage extends NavigationEvent {
  final int pageIndex;
  NavigateToPage(this.pageIndex);
}