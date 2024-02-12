import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for your favourite anime'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Find anime',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              context.read<SearchBloc>().add(
                    SearchAnimeEvent(query: value),
                  );
            },
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchLoaded) {
                final title = state.title;
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(title[index].toString()),
                      );
                    },
                    itemCount: title.length,
                  ),
                );
              }
              if (state is SearchLoading) {
                return const CircularProgressIndicator();
              }
              if (state is SearchNotFound) {
                return Text('Ничего не найдено');
              }

              return const Text('Введите значение');
            },
          ),
        ],
      ),
    );
  }
}
