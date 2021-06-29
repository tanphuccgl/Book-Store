import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/sign_up/data/data_sources/register_remote_data_source.dart';
import 'package:book_store/feature/sign_up/data/models/register_data.dart';
import 'package:book_store/feature/sign_up/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final NetworkInfo networkInfo;

  final RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepositoryImpl({this.networkInfo, this.registerRemoteDataSource});


  @override
  Future<Either<Failure, RegisterData>> postRegister(String name,String email, String pass) {
    return _register(registerRemoteDataSource.register(name, email, pass));
  }



  Future<Either<Failure, RegisterData>> _register(Future<RegisterData> registerInfo) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await registerInfo;
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }


}
