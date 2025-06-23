import 'package:fitness_app/features/Exercise/presentation/views/widgets/exercise_sliver_header.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/tab_bar_sliver_delegate.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fitness_app/features/Exercise/domain/entity/difficulty_level_entity.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/exercise_list.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../generated/l10n.dart';
import '../cubit/sign_in_cubit/exercise_state.dart';
import '../cubit/sign_in_cubit/exercise_view_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final String muscleId = '67c8499726895f87ce0aa9bc'; // temp
  List<DifficultyLevelEntity> levels = [];
  List<Exercises> exercises = [];

  bool isCollapsed = false;

  final ScrollController _scrollController = ScrollController();
  final double expandedHeight = 300;

  @override
  void initState() {
    super.initState();
    context.read<ExerciseViewModel>().doIntent(LoadLevelsIntent());

    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollController.offset > (expandedHeight - kToolbarHeight - MediaQuery.of(context).padding.top)) {
          if (!isCollapsed) {
            setState(() {
              isCollapsed = true;
            });
          }
        } else {
          if (isCollapsed) {
            setState(() {
              isCollapsed = false;
            });
          }
        }
      }
    });
  }

  void _loadExercises(String difficultyId) {
    context.read<ExerciseViewModel>().doIntent(
      LoadExercisesIntent(muscleId, difficultyId),
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
    final tr = S.of(context);
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
            // تهيئة الـ TabController مرة واحدة فقط
            if (_tabController == null) {
              _tabController = TabController(length: levels.length, vsync: this);

              _tabController!.addListener(() {
                if (_tabController!.indexIsChanging) {
                  final selectedLevel = levels[_tabController!.index];
                  _loadExercises(selectedLevel.id);
                }
              });

              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (levels.isNotEmpty) {
                  _loadExercises(levels[0].id);
                }
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

    if (_tabController == null) {
      // لا نبني الواجهة التي تعتمد على الـ TabController إذا لم يتم تهيئتها بعد
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            ExerciseSliverHeader(
              title: "Chest Exercise", // مؤقت
              imageUrl: ImageAssets.logo,
              isCollapsed: isCollapsed,
            ),

            SliverPersistentHeader(
              pinned: true,
              delegate: TabBarSliverDelegate(
                tabBar: TabBar(
                  controller: _tabController!,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
                  labelColor: AppColors.whiteColor,
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  indicatorPadding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(6),
                    vertical: responsiveHeight(8),
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),
                  tabs: levels.map(
                        (e) => Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
                        child: Text(e.name, style: AppTextStyles.BalooThambi2_600_12),
                      ),
                    ),
                  ).toList(),
                ),
                isCollapsed: isCollapsed,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: responsiveHeight(8))),

            SliverFillRemaining(
              child: exercises.isEmpty && !isLoading
                  ? Center(child: Text(tr.noExercisesAvailable))
                  : ExerciseList(exercises: exercises, isLoading: isLoading),
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
}
