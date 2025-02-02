import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/model/book_modles/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewstBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
