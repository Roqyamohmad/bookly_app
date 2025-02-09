import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/Rebo/home_repo.dart';
import 'package:bookly_app/features/home/data/model/book_modles/book_model.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errorMassege));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
