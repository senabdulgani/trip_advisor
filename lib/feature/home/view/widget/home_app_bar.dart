part of '../home_view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        LocaleKeys.home_title,
        style: Theme.of(context).textTheme.titleLarge,
      ).tr(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
