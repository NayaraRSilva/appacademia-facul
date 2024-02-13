import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Widget buildCampoEdicao(String rotulo, String valorAtual) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(rotulo, style: TextStyle(fontSize: 16)),
      TextFormField(
        initialValue: valorAtual,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        // Adicione controladores e validações conforme necessário
      ),
      SizedBox(height: 10),
    ],
  );
}

class TreinoPage extends StatefulWidget {
  @override
  _TreinoPageState createState() => _TreinoPageState();
}

class _TreinoPageState extends State<TreinoPage> {
  late VideoPlayerController _controller1;
  late Future<void> _initializeVideoPlayerFuture1;
  late VideoPlayerController _controller2;
  late Future<void> _initializeVideoPlayerFuture2;

  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.asset('assets/videotreino.mp4');
    _initializeVideoPlayerFuture1 = _controller1.initialize();
    _controller1.setLooping(true);

    _controller2 = VideoPlayerController.asset('assets/videotreino1.mp4');
    _initializeVideoPlayerFuture2 = _controller2.initialize();
    _controller2.setLooping(true);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treino'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCampoEdicao("Tipo de Treino", "Musculação"),
            buildCampoEdicao("Frequência", "3 vezes por semana"),
            SizedBox(height: 16),
            AspectRatio(
              aspectRatio: _controller1.value.aspectRatio,
              child: VideoPlayer(_controller1),
            ),
            FutureBuilder(
              future: _initializeVideoPlayerFuture1,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return IconButton(
                    icon: Icon(
                      _controller1.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_controller1.value.isPlaying) {
                          _controller1.pause();
                        } else {
                          _controller1.play();
                        }
                      });
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            SizedBox(height: 16),
            // Adicione mais campos abaixo do primeiro vídeo
            buildCampoEdicao("Tipo de Treino", "Muay Thai"),
            buildCampoEdicao("Frequência", "2 vezes por semana"),
            SizedBox(height: 16),
            AspectRatio(
              aspectRatio: _controller2.value.aspectRatio,
              child: VideoPlayer(_controller2),
            ),
            FutureBuilder(
              future: _initializeVideoPlayerFuture2,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return IconButton(
                    icon: Icon(
                      _controller2.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_controller2.value.isPlaying) {
                          _controller2.pause();
                        } else {
                          _controller2.play();
                        }
                      });
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            // Adicione mais campos conforme necessário
          ],
        ),
      ),
    );
  }
}
