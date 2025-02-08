import 'package:bookly_app/core/widget/custom_error_widget.dart';
import 'package:bookly_app/core/widget/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/newst_books_cubit/newst_books_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widget/best_seller_listView_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewstBooksCubitCubit, NewstBooksCubitState>(
      builder: (context, state) {
        if (state is NewstBooksCubitSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewstBooksCubitFailur) {
          return CustomErrorWidget(errMessage: state.errorMassege);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
