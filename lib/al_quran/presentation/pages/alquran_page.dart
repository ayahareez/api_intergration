import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../fruit/data/remote_ds/fruit_remote_ds.dart';
import '../../data/models/alquran_model.dart';
import '../bloc/al_quran_bloc.dart';

class AlQuranScreen extends StatelessWidget {
  AlQuranScreen({super.key});

  TextEditingController surahNumC = TextEditingController();

  TextEditingController surahEditionC = TextEditingController();

  GlobalKey<FormState> fromKey = GlobalKey();

  @override

  // Future getSurahNumEdition(int surahNum,String edition) async {
  //   await AlQuranRemoteDsImpl().getSurahByNumEdition(surahNum, edition);
  //   alQuranModel =await AlQuranRemoteDsImpl().getDataOfSurah(surahNum);
  //   ayahNums=await AlQuranRemoteDsImpl().getAyahByNum(surahNum);
  //   setState(() {
  //   });
  //   return ayahs;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff006d77),
          foregroundColor: Colors.grey[200],
          title: Text('QURAN')),
      body: BlocBuilder<AlQuranBloc, AlQuranState>(
        builder: (context, state) {
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: fromKey,
              child: Column(
                children: [
                  if (state is AlQuranLoadingState)
                    const CircularProgressIndicator(),
                  if (state is AlQuranLoadedState)
                    Column(
                      children: [
                        Text(
                          state.alQuranModel.ayahs[0],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(state.alQuranModel.ayahs.sublist(1).join(' '),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textDirection: TextDirection.rtl),
                      ],
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: surahNumC,
                    decoration: InputDecoration(
                      labelText: 'enter the number of the surah',
                      labelStyle: const TextStyle(
                          color: Color(0xff006d77), fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Surah Num Must Be Entered';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AlQuranBloc>().add(GetSurahByNumber(
                          surahNum: int.parse(surahNumC.text)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff006d77),
                    ),
                    child: const Text(
                      'get surah',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}