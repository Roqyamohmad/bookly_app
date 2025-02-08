import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/Rebo/home_repo.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit_state.dart';

class FeaturedBooksCubitCubit extends Cubit<FeaturedBooksCubitState> {
  FeaturedBooksCubitCubit(this.homeRepo) : super(FeaturedBooksCubitInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeatureBooks() async {
    emit(FeaturedBooksCubitLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksCubitFailur(failure.errorMassege));
    }, (books) {
      emit(FeaturedBooksCubitSuccess(books));
    });
  }
}
