import 'package:clean_architecture_with_bloc/core/routes/route_names.dart';
import 'package:clean_architecture_with_bloc/core/utils/snack_bar.dart';
import 'package:clean_architecture_with_bloc/presentation/login/bloc/login_bloc.dart';
import 'package:clean_architecture_with_bloc/presentation/login/bloc/login_event.dart';
import 'package:clean_architecture_with_bloc/presentation/products/bloc/products_bloc.dart';
import 'package:clean_architecture_with_bloc/presentation/products/screens/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    context.read<ProductsBloc>().add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("All Poducts"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
        ),
        body: BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {
            print("loading.........");
            if (state is ProductsLoading) {
              showSnackBar(context, "Prodcuts is Loading...");
            } else if (state is ProductLoadingError) {
              showSnackBar(context, "Error in loading the products");
            }
          },
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductsLoadSuccess) {
              final products = state.products;

              return GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.68, // controls card height
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductGridCard(product: product);
                },
              );
            } else {
              return Center(child: Text("Failed to load products"));
            }
          },
        ),
      ),
    );
  }
}
