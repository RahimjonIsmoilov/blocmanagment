import 'package:blocmanagment/home_screen/bloc/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeLoadingDate());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: 360,
            height: 40,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: 'Qidiruv',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeSucces) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: state.productList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 85,
                      width: 50,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image:
                                  NetworkImage(state.productList[index].image!),
                              width: 50,
                            ),
                            Text(
                              state.productList[index].title!,
                              style: const TextStyle(fontWeight: FontWeight.w600
                              ),
                            ),
                            Text(state.productList[index].category!),
                            Text(state.productList[index].price.toString()),
                            Text(state.productList[index].rating.toString()),
                          ]),
                    );  
                  });
            }
            if (state is HomeError) {
              return const Center(
                child: Icon(
                  Icons.error,
                  size: 120,
                ),
              );
            }
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return const Card();
                });
          },
        ));
  }
}
