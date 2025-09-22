import 'package:book_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_source/home_local_data_source.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../api/api_service.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>( ApiService(
    Dio(),
  ));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      HomeRemoteDataSourceImpl(
       getIt.get<ApiService>()
      ),
      HomeLocalDataSourceImpl()));
}