import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fitness_app/features/Exercise/domain/entity/difficulty_level_entity.dart';
import 'package:fitness_app/features/Exercise/domain/entity/exercise_response_entity.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/exercise_header.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/exercise_tab_bar.dart';
import 'package:fitness_app/features/Exercise/presentation/views/widgets/exercise_list.dart';
import '../../../../generated/l10n.dart';
import '../cubit/sign_in_cubit/exercise_state.dart';
import '../cubit/sign_in_cubit/exercise_view_model.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final String muscleId = '67c8499726895f87ce0aa9bc';//temporally,, will change when det data from Workout screen
  // final String lang = 'en';
  List<DifficultyLevelEntity> levels = [];
  List<Exercises> exercises = [];

  @override
  void initState() {
    super.initState();
    context.read<ExerciseViewModel>().doIntent(LoadLevelsIntent());
  }

  void _loadExercises(String difficultyId) {
    context.read<ExerciseViewModel>().doIntent(
      LoadExercisesIntent(muscleId, difficultyId,),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
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

            return _buildUI(state is LoadingExerciseState);
          }

          return _buildUI(state is LoadingExerciseState);
        },
      ),
    );
  }

  Widget _buildUI(bool isLoading) {
    final tr = S.of(context);
    return Column(
      children: [
        const ExerciseHeader(),
        if (levels.isNotEmpty)
          ExerciseTabBar(controller: _tabController!, levels: levels),
        SizedBox(height: responsiveHeight(8)),
        Expanded(
          child: exercises.isEmpty && !isLoading
              ? Center(child: Text(tr.noExercisesAvailable))
              : ExerciseList(exercises: exercises, isLoading: isLoading),
        ),
      ],
    );
  }
}
