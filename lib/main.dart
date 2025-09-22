import 'package:book_app/constants.dart';
import 'package:book_app/core/api/api_service.dart';
import 'package:book_app/core/utils/simple_bloc_observer.dart';
import 'package:book_app/features/home/presentation/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/features/search/presentation/views/search_cubit/search_cubit.dart';
import 'package:book_app/features/splash/data/rebo/search_rebo.dart';
import 'package:book_app/features/splash/data/rebo/search_rebo_impl.dart';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/domain/entities/book_entity.dart';
import 'features/home/domain/usecases/fetchfeaturedbooks.dart';
import 'features/home/domain/usecases/fetchnewsbooks.dart';
import 'features/home/presentation/newsed_book_cubit/newsed_book_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(keyFeaturedBox);
  await Hive.openBox<BookEntity>(keyNewestBox);
  setUpServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const Bookly(), // Wrap app
    ),
  );
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeaturedBookCubit(
            FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()),
          )..fetchFeaturedBooks();
        }),
        BlocProvider(create: (context) {
          return NewsedBookCubit(
            FetchNewsBooksUseCase(getIt.get<HomeRepoImpl>()),
          )..fetchNewsedBooks();
        }),

      ],
      child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: primaryColor,
              textTheme:
                  GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme))),
    );
  }
}
