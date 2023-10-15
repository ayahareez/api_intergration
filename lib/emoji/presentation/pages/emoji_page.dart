import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

import '../../../dog_image/presentation/pages/dog_page.dart';
import '../../data/models/emoji_random_model.dart';
import '../../data/remote_ds/emoji_remote_ds.dart';
import '../bloc/emoji_bloc.dart';

class EmojiScreen extends StatefulWidget {
  const EmojiScreen({super.key});

  @override
  _EmojiScreenState createState() => _EmojiScreenState();
}

class _EmojiScreenState extends State<EmojiScreen> {
  EmojiRandomModel? emojiData;

  // MemeModel? memeModel;
  bool loading = false;
  EmojiParser parser = EmojiParser();

  @override
  void initState() {
    super.initState();
    fetchEmoji();
  }

  Future<void> fetchEmoji() async {
    try {
      final data = await EmojiRemoteDsImpl().getRandomEmoji();
      setState(() {
        emojiData = data;
      });
    } catch (e) {
      print(e);
    }
  }

  unicodeTry(String unicodeCodePoint) {
    String hexPart = unicodeCodePoint.substring(2);
    int code = int.parse(hexPart, radix: 16);
    String emoji = String.fromCharCode(code);
    return emoji;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Emoji'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DogScreen()));
            },
            child: Row(
              children: [
                Text(
                  'get a dog image',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.white),
          )
        ],
      ),
      body: BlocBuilder<EmojiBloc, EmojiState>(
        builder: (context, state) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is EmojiInitial)
                    Text(
                      'get lovely emoji',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  if (state is EmojiLoadingState)
                    const CircularProgressIndicator(),
                  if (state is EmojiLoadedState)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.emojiRandomModel.name,
                          style:
                              TextStyle(fontSize: 32, color: Colors.red[900]),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Category: ${state.emojiRandomModel.category}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Group: ${state.emojiRandomModel.group}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${unicodeTry(state.emojiRandomModel.unicode[0])}',
                          style: const TextStyle(fontSize: 64),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<EmojiBloc>().add(GetRandomEmoji());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}