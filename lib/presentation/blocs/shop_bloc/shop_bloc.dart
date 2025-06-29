import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_shops_usecase.dart';
import './shop_event.dart';
import './shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final GetShopsUseCase getShopsUseCase;
  ShopBloc(this.getShopsUseCase) : super(ShopInitial()) {
    on<FetchShops>((event, emit) async {
      emit(ShopLoading());
      try {
        final shops = await getShopsUseCase(
          categoryId: event.categoryId,
          min: event.min,
          max: event.max,
          filter: event.filter,
        );
        emit(ShopLoaded(shops));
      } catch (e) {
        emit(ShopError(e.toString()));
      }
    });
  }
}

