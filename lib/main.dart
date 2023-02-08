import 'package:chopper/chopper.dart';
import 'package:chopper_meme_example/json_serializable_convertor.dart';
import 'package:chopper_meme_example/models/meme_response.dart';
import 'package:chopper_meme_example/services/meme_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Chopper Meme Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ChopperClient _chopper;
  late MemeService _memeService;

  @override
  void initState() {
    super.initState();
    _chopper = ChopperClient(
      baseUrl: Uri.tryParse('https://api.imgflip.com'),
      services: [
        MemeService.create(),
      ],
      converter: const JsonSerializableConverter({
        MemeResponse: MemeResponse.fromJson,
      }),
    );

    _memeService = _chopper.getService<MemeService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<Response<MemeResponse>>(
        future: _memeService.getPopularMemes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            if (snapshot.data!.body != null) {
              final memes = snapshot.data!.body!.data.memes;

              return ListView.builder(
                itemCount: memes.length,
                itemBuilder: (context, index) {
                  final meme = memes[index];
                  return Card(
                    elevation: 4.0,
                    child: Row(
                      children: [
                        Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            image: DecorationImage(
                              image: NetworkImage(meme.url),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: Text(
                            meme.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                ),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
