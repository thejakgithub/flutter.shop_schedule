import 'package:go_router/go_router.dart';
import 'package:shop_schedule/view/home_screen.dart';
import 'package:shop_schedule/view/shop_schedule_edit_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/shop_schedule_edit',
      builder: (context, state) => const ShopScheduleEditScreen(),
    ),
  ],
);
