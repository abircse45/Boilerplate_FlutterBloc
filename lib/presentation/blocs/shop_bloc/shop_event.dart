import 'package:equatable/equatable.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();
  @override
  List<Object?> get props => [];
}

class FetchShops extends ShopEvent {
  final String categoryId;
  final String min;
  final String max;
  final String filter;

  const FetchShops({
    required this.categoryId,
    this.min = '',
    this.max = '',
    this.filter = '',
  });

  @override
  List<Object?> get props => [categoryId, min, max, filter];
}

