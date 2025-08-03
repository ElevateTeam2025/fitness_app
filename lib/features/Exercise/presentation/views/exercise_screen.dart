import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/exercise_content.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/exercise_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'exercise_tab_bar.dart';

import '../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

import '../cubit/sign_in_cubit/exercise_state.dart';
import '../cubit/sign_in_cubit/exercise_view_model.dart';
import 'package:fitness_app/features/Exercise/domain/entity/difficulty_level_entity.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';

class ExercisesScreen extends StatefulWidget {
  final String muscleId;
  final String? imageUrl;
  final String muscleName;

  const ExercisesScreen({
    super.key,
    required this.muscleId,
    required this.imageUrl,
    required this.muscleName,
  });

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<DifficultyLevelEntity> levels = [];
  List<Exercises> exercises = [];

  bool isCollapsed = false;
  final ScrollController _scrollController = ScrollController();
  final double expandedHeight = 300.heightResponsive;

  @override
  void initState() {
    super.initState();
    context.read<ExerciseViewModel>().doIntent(LoadLevelsIntent());

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollController.offset > (expandedHeight - kToolbarHeight - MediaQuery.of(context).padding.top)) {
          if (!isCollapsed) setState(() => isCollapsed = true);
        } else {
          if (isCollapsed) setState(() => isCollapsed = false);
        }
      }
    });
  }

  void _loadExercises(String difficultyId) {
    context.read<ExerciseViewModel>().doIntent(
      LoadExercisesIntent(widget.muscleId, difficultyId),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<ExerciseViewModel, ExerciseState>(
        listener: (context, state) {
          if (state is SuccessExerciseState) {
            EasyLoading.dismiss();
            setState(() {
              exercises = state.data.exercises ?? [];
            });
          } else if (state is ErrorExerciseState) {
            EasyLoading.dismiss();
            EasyLoading.showError(state.message);
          }
        },
        builder: (context, state) {
          if (state is LoadingLevelsState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorLevelsState) {
            return Center(child: Text(state.message));
          } else if (state is SuccessLevelsState) {
            levels = state.levels;
            if (_tabController == null) {
              _tabController = TabController(length: levels.length, vsync: this);

              _tabController!.addListener(() {
                if (_tabController!.indexIsChanging) {
                  _loadExercises(levels[_tabController!.index].id);
                }
              });

              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (levels.isNotEmpty) _loadExercises(levels[0].id);
              });
            }
            return _buildUI(state is LoadingExerciseState);
          }
          return _buildUI(state is LoadingExerciseState);
        },
      ),
    );
  }

  Widget _buildUI(bool isLoading) {
    final tr = S.of(context);
    if (_tabController == null) return const Center(child: CircularProgressIndicator());

    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            ExerciseHeader(
              title: widget.muscleName,
              imageUrl: _resolveImage(widget.imageUrl),
              isCollapsed: isCollapsed,
            ),
            ExerciseTabBar(
              tabController: _tabController!,
              levels: levels,
              isCollapsed: isCollapsed,
            ),
            SliverToBoxAdapter(child: SizedBox(height: responsiveHeight(8))),
            ExerciseContent(
              exercises: exercises,
              isLoading: isLoading,
              noExercisesText: tr.noExercisesAvailable,
            ),
          ],
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + responsiveHeight(18),
          left: responsiveWidth(16),
          child: CircleAvatar(
            radius: responsiveWidth(18),
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              icon: Image.asset(IconAssets.backIcon),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }

  String _resolveImage(String? url) {
    if (url == null || url.trim().isEmpty || url == 'null') {
      return ImageAssets.onboardingBg;
    }
    return url;
  }
}