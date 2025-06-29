import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_shops_usecase.dart';
import '../../../data/repositories/shop_repository_impl.dart';
import '../../blocs/shop_bloc/shop_bloc.dart';
import '../../blocs/shop_bloc/shop_event.dart';
import '../../blocs/shop_bloc/shop_state.dart';

class ShopListScreen extends StatelessWidget {
  final String categoryId;
  const ShopListScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShopBloc(GetShopsUseCase(ShopRepositoryImpl()))
        ..add(FetchShops(categoryId: categoryId)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Shops')),
        body: BlocBuilder<ShopBloc, ShopState>(
          builder: (context, state) {
            if (state is ShopLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ShopLoaded) {
              if (state.shops.isEmpty) {
                return const Center(child: Text('No shops found.'));
              }
              return ListView.builder(
                itemCount: state.shops.length,
                itemBuilder: (context, index) {
                  final shop = state.shops[index];
                  return Card(
                    elevation: 6,
                    child: ListTile(
                      title: Text(shop.name),
                      subtitle: Text(shop.address ?? ''),
                      leading: shop.image != null
                          ? Image.network(shop.image!, width: 50, height: 50, fit: BoxFit.cover)
                          : const Icon(Icons.store),
                    ),
                  );
                },
              );
            } else if (state is ShopError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

