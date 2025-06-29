import 'package:equatable/equatable.dart';

import '../../../domain/entities/shop/shop_entity.dart';

abstract class ShopState extends Equatable {
  const ShopState();
  @override
  List<Object?> get props => [];
}

class ShopInitial extends ShopState {}
class ShopLoading extends ShopState {}
class ShopLoaded extends ShopState {
  final List<ShopEntity> shops;
  const ShopLoaded(this.shops);
  @override
  List<Object?> get props => [shops];
}
class ShopError extends ShopState {
  final String message;
  const ShopError(this.message);
  @override
  List<Object?> get props => [message];
}

