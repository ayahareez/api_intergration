import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/fruit_bloc.dart';

class FruitPage extends StatelessWidget {
  FruitPage({Key? key}) : super(key: key);

  bool loading = false;

  TextEditingController fruitNameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr("fruit_title"),
          style: TextStyle(fontSize: 34),
        ),
      ),
      body: BlocBuilder<FruitBloc, FruitState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state is FruitInitial)
                      Text(
                        tr('fruit_text'),
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    if (state is FruitLoadingState)
                      const CircularProgressIndicator(),
                    if (state is FruitLoadedState)
                      Column(
                        children: [
                          Text(
                            state.fruitModel.name,
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Text(
                            'carbohydrates: ${state.fruitModel.carbohydrates}',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'calories: ${state.fruitModel.calories}',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'fat: ${state.fruitModel.fat}',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'protein: ${state.fruitModel.protein}',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                        ],
                      ),
                    TextFormField(
                      controller: fruitNameC,
                      decoration: InputDecoration(
                          labelText: tr('fruit_form_field'),
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.purple),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          context
                              .read<FruitBloc>()
                              .add(GetFruitByName(fruitName: fruitNameC.text));
                        },
                        child: Text(tr('fruit_button')))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}