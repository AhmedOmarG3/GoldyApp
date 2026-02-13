import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:goldy/core/errors/failure.dart';
import 'package:goldy/core/networking/dio_constants.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/features/gold/data/models/gold_model.dart';
import 'package:goldy/features/silver/data/models/silver_model.dart';

class SilverRepo {
  Future<Either<Failure, SilverModel>> getSilver() async {
    
try {
      final response = await DioHelper.get(
        endPoint: DioConstants.silverEndpoint,
      );
      return Right(SilverModel.fromJson(response.data));
    } on DioException catch (e) {
  return Left(ServerFailure.fromDioException(e));
} catch (e) {
  return Left(ServerFailure(message: 'Unexpected error occurred'));
}


  }
}
