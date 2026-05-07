import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Screens
import '../../auth/pages/welcome_page.dart';
import '../../auth/pages/login_page.dart';
import '../../auth/pages/register_page.dart';
import '../../home/pages/home_page.dart';
import '../../mood/pages/mood_detection_page.dart';
import '../../mood/pages/scan_result_page.dart';
import '../../mood/pages/choose_mood_page.dart';
import '../../playlist/pages/choose_playlist_page.dart';
import '../../music/pages/play_music_page.dart';
import '../../music/pages/next_musics_page.dart';
import '../../playlist/pages/last_playlist_page.dart';
import '../../playlist/pages/my_playlists_page.dart';
import '../../playlist/pages/new_playlist_page.dart';
import '../../profile/pages/profile_page.dart';
import '../../profile/pages/edit_profile_page.dart';
import '../../profile/pages/change_password_page.dart';

// Components
import '../organisms/main_scaffold.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final GlobalKey<NavigatorState> _discoverNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'discover');
final GlobalKey<NavigatorState> _playlistNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'playlist');
final GlobalKey<NavigatorState> _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

class AppRouter {
  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/welcome', // Uygulama başlangıç noktası
    
    // Auth guard
    redirect: (context, state) {
      final bool loggedIn = FirebaseAuth.instance.currentUser != null;
      final bool loggingIn = state.uri.path == '/login' || state.uri.path == '/register' || state.uri.path == '/welcome';

      // Eğer giriş yapılmamışsa ve auth sayfalarında değilse welcome'a at
      if (!loggedIn && !loggingIn) {
        return '/welcome';
      }

      // Eğer giriş yapılmışsa ve auth sayfalarındaysa (örneğin welcome'a tekrar girmeye çalışıyorsa) home'a at
      if (loggedIn && loggingIn) {
        return '/home';
      }

      return null;
    },

    routes: [
      // Auth Routes
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),

      // Main App Shell Route (with Bottom Navigation Bar)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Home
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          // Branch 1: Discover (Choose Mood)
          StatefulShellBranch(
            navigatorKey: _discoverNavigatorKey,
            routes: [
              GoRoute(
                path: '/choose-mood',
                builder: (context, state) => const ChooseMoodPage(),
              ),
            ],
          ),
          // Branch 2: Playlists
          StatefulShellBranch(
            navigatorKey: _playlistNavigatorKey,
            routes: [
              GoRoute(
                path: '/my-playlists',
                builder: (context, state) => const MyPlaylistsPage(),
              ),
            ],
          ),
          // Branch 3: Profile
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),

      // Full-screen / Sub-routes (Outside of Bottom Nav Bar)
      
      // Mood / Scan Routes
      GoRoute(
        path: '/mood-detection',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const MoodDetectionPage(),
      ),
      GoRoute(
        path: '/scan-result',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ScanResultPage(),
      ),

      // Playlist Sub-routes
      GoRoute(
        path: '/choose-playlist',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ChoosePlaylistPage(),
      ),
      GoRoute(
        path: '/last-playlist',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const LastPlaylistPage(),
      ),
      GoRoute(
        path: '/new-playlist',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const NewPlaylistPage(),
      ),

      // Music Routes
      GoRoute(
        path: '/play-music',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PlayMusicPage(),
      ),
      GoRoute(
        path: '/next-musics',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const NextMusicsPage(),
      ),

      // Profile Sub-routes
      GoRoute(
        path: '/edit-profile',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: '/change-password',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ChangePasswordPage(),
      ),
    ],
  );
}
