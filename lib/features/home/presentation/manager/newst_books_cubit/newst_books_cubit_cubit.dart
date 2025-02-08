import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/Rebo/home_repo.dart';
import 'package:bookly_app/features/home/data/model/book_modles/book_model.dart';
import 'package:equatable/equatable.dart';

part 'newst_books_cubit_state.dart';

class NewstBooksCubitCubit extends Cubit<NewstBooksCubitState> {
  NewstBooksCubitCubit(this.homeRepo) : super(NewstBooksCubitInitial());
  final HomeRepo homeRepo;
  Future<void> fetcgNewstBooks() async {
    emit(NewstBooksCubitLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewstBooksCubitFailur(failure.errorMassege));
    }, (books) {
      emit(NewstBooksCubitSuccess(books));
    });
  }
}
