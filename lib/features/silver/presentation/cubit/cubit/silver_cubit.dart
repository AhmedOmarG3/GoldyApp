import 'package:bloc/bloc.dart';
import 'package:goldy/features/silver/data/models/silver_model.dart';
import 'package:goldy/features/silver/data/repo/silver_repo.dart';
import 'package:meta/meta.dart';

part 'silver_state.dart';


 class SilverCubit extends Cubit<SilverState> {
  final SilverRepo silverRepo;

  SilverCubit(this.silverRepo) : super(SilverInitial());

  Future<void> getSilver() async {
    emit(SilverLoading());

    final result = await silverRepo.getSilver();

    result.fold(
      (failure) => emit(SilverFailure(message: failure.message)),
      (model) => emit(SilverSuccess(silverModel: model)),
    );
  }
}