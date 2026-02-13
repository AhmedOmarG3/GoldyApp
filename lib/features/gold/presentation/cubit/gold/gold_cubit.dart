import 'package:bloc/bloc.dart';
import 'package:goldy/features/gold/data/models/gold_model.dart';
import 'package:goldy/features/gold/data/repo/gold_repo.dart';
import 'package:meta/meta.dart';

part 'gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final GoldRepo goldRepo;

  GoldCubit(this.goldRepo) : super(GoldInitial());

  Future<void> getGold() async {
    emit(GoldLoading());

    final result = await goldRepo.getGold();

    result.fold(
      (failure) {
        emit(GoldFailure(message: failure.message));
      },
      (goldModel) {
        emit(GoldSuccess(goldModel: goldModel));
      },
    );
  }
}

