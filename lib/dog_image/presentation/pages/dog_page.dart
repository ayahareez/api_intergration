import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../fruit/presentation/pages/fruit_page.dart';
import '../../data/models/dog_model.dart';
import '../../data/remote_ds/dog_remote_ds.dart';
import '../bloc/dog_bloc.dart';

class DogScreen extends StatefulWidget {
  @override
  _DogScreenState createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  DogModel? dogModel;
  final DogRemoteDsImpl dogRemoteDsImpl = DogRemoteDsImpl();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetchDog();
  }

  Future<void> fetchDog() async {
    try {
      final data = await DogRemoteDsImpl().fetchRandomDogImage();
      print(data);
      setState(() {
        dogModel = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Dog API Demo'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FruitPage()));
            },
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            child: const Text(
              'Get Fruit Data',
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: BlocBuilder<DogBloc, DogState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is DogInitial)
                    Text(
                      'Lovely Dogs',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  if (state is DogLoadingState)
                    const CircularProgressIndicator(),
                  if (state is DogLoadedState)
                    Column(
                      children: [
                        Image.network(state.dogModel.url),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ElevatedButton(
                    onPressed: () async {
                      context.read<DogBloc>().add(GetRandomDogImage());
                    },
                    child: const Text('Get Random Dog Image'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}