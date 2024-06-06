class UnbordingContent {
  String? image;
  String? title;
  String? discription;

  UnbordingContent({this.image, this.title, this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Selamat Datang di Simalungun!',
    image: 'assets/banner/onboard1.png',
    discription: "Selamat datang di Simalungun! Temukan keindahan alam Simalungun dan nikmati pengalaman liburan yang tak terlupakan!",
  ),
  UnbordingContent(
    title: 'Exlore Simalungun',
    image: 'assets/banner/onboard2.png',
    discription: "Jelajahi keindahan alam Simalungun dan temukan tempat-tempat wisata yang menarik di Simalungun"
  ),
  UnbordingContent(
    title: 'Nikmati liburan anda!',
    image: 'assets/banner/onboard3.png',
    discription: "Nikmati liburan anda di Simalungun dengan berbagai pilihan tempat wisata yang menarik! Selamat berlibur!"
  ),
];