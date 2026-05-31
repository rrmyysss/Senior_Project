import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' hide PlayerState;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/organisms/custom_bottom_nav_bar.dart';
import '../../core/theme/app_colors.dart';
import 'global_mini_player.dart';
import '../state/player_state.dart';
import '../../../domain/music/entities/music_track.dart';
import '../../../application/music/bloc/music_bloc.dart';
import '../../../application/music/bloc/music_event.dart';
import '../../music/widgets/full_player_overlay.dart';
import '../../../domain/music/repositories/i_music_repository.dart';
import '../../../injection.dart';

class MainScaffold extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  YoutubePlayerController? _ytController;

  @override
  void initState() {
    super.initState();
    PlayerState.currentTrack.addListener(_onTrackChanged);
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final repo = getIt<IMusicRepository>();
    await Future.wait([
      repo.getFavoriteSongs(),
      repo.getFavoritePlaylists(),
      repo.getMyPlaylists(),
      repo.getRecentlyPlayedTracks(),
    ]);
  }

  @override
  void dispose() {
    PlayerState.currentTrack.removeListener(_onTrackChanged);
    _ytController?.removeListener(_onYtStateChanged);
    _ytController?.dispose();
    super.dispose();
  }

  void _onTrackChanged() {
    final track = PlayerState.currentTrack.value;
    if (track == null) return;

    if (_ytController == null) {
      _ytController = YoutubePlayerController(
        initialVideoId: track.youtubeVideoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          enableCaption: false,
        ),
      );
      _ytController!.addListener(_onYtStateChanged);
      PlayerState.setController(_ytController!);
      setState(() {});
    } else {
      _ytController!.load(track.youtubeVideoId);
    }
    PlayerState.isPlaying.value = true;
    
    // Log the play event
    context.read<MusicBloc>().add(MusicEvent.trackPlayed(track));
  }

  void _onYtStateChanged() {
    if (_ytController == null) return;
    final playing = _ytController!.value.isPlaying;
    if (PlayerState.isPlaying.value != playing) {
      PlayerState.isPlaying.value = playing;
    }
  }

  void _onTap(int index) {
    PlayerState.isFullPlayerVisible.value = false;
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: Stack(
        children: [
          // Ana navigasyon içeriği
          widget.navigationShell,
          
          // Global MiniPlayer at the bottom of the body
          const GlobalMiniPlayer(),

          // Full Player Overlay (animasyonlu olarak yukarıdan iner veya alttan çıkar)
          FullPlayerOverlay(ytController: _ytController),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
