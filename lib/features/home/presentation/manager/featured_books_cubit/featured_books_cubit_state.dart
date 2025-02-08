import 'package:bookly_app/features/home/data/model/book_modles/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBooksCubitState extends Equatable {
  const FeaturedBooksCubitState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksCubitInitial extends FeaturedBooksCubitState {}

class FeaturedBooksCubitLoading extends FeaturedBooksCubitState {}

class FeaturedBooksCubitFailur extends FeaturedBooksCubitState {
  final String errorMassege;
  const FeaturedBooksCubitFailur(this.errorMassege);
}

class FeaturedBooksCubitSuccess extends FeaturedBooksCubitState {
  final List<BookModel> books;

  const FeaturedBooksCubitSuccess(this.books);
}
