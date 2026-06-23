class SongModel {
  final String song;
 final String difficulty;
  final int duration;
  final String image;
  final String audio;

  SongModel({
    required this.song,
    required this.difficulty,
    required this.duration,
    required this.image,
    required this.audio

  });
}

final List<SongModel> songList = [
  SongModel(song: "Twinkle Twinkle", difficulty: "Beginner", duration: 26,image: "assets/images/twinkle.png.jpeg",audio: "audios/twinkle_twinkle.mpeg"),
  SongModel(song: "Jingle Bells", difficulty: "Beginner", duration: 38,image: "assets/images/jingle_bells.png.jpeg",audio: "audios/jingle_bills.mpeg"),
  SongModel(song: "ألف ليلة وليلة", difficulty: "Intermediate", duration: 81,image: "assets/images/alf_lela.png.jpeg",audio: "audios/alf_lela_w_lela.mpeg"),
  SongModel(song: "Bella Ciao", difficulty: "Intermediate", duration: 18,image: "assets/images/bella_ciao.png.jpeg",audio: "audios/bella_ciao.mpeg"),
  SongModel(song: "Für Elise", difficulty: "Professional", duration: 64,image: "assets/images/fur_elise.png.jpeg",audio: "audios/FürElise.mpeg"),
  SongModel(song: "Rush E", difficulty: "Professional", duration: 97,image: "assets/images/rush_e.png.jpeg",audio: "audios/rush_e.mpeg"),
];
