part of 'newst_books_cubit_cubit.dart';

abstract class NewstBooksCubitState extends Equatable {
  const NewstBooksCubitState();

  @override
  List<Object> get props => [];
}

class NewstBooksCubitInitial extends NewstBooksCubitState {}

class NewstBooksCubitLoading extends NewstBooksCubitState {}

class NewstBooksCubitFailur extends NewstBooksCubitState {
  final String errorMassege;
  const NewstBooksCubitFailur(this.errorMassege);
}

class NewstBooksCubitSuccess extends NewstBooksCubitState {
  final List<BookModel> books;

  const NewstBooksCubitSuccess(this.books);
}
