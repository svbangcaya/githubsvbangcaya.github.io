import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MusicItemWidget extends StatelessWidget {
  final String name;
  final String assetPath;

  MusicItemWidget({required this.name, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Music",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          MusicItemStatefulWidget(
            name: "Cry Baby by The NBHD",
            link: "assets/crybaby_nbhd.mp3",
          ),
          MusicItemStatefulWidget(
            name: "Scary Love by The NBHD",
            link: "assets/scarylove_nbhd.mp3",
          ),
        ],
      ),
    );
  }

  void _playMusic(BuildContext context, String assetPath) async {
    AudioCache cache = AudioCache();
    cache.play(assetPath);
  }
}

class MusicItemStatefulWidget extends StatefulWidget {
  final String name;
  final String link;

  MusicItemStatefulWidget({required this.name, required this.link});

  @override
  _MusicItemWidgetState createState() => _MusicItemWidgetState();
}

class _MusicItemWidgetState extends State<MusicItemStatefulWidget> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(widget.link, isLocal: true);
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.name),
          IconButton(
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: _playPause, // Call the play/pause function
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "samibears",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 150,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture and Full Name
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("assets/BANGCAYA.jpg"),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Samantha Bangcaya",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          )),
                      Text(
                        "21. she/her. 5707. july 09. infp.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Sections
            SectionWidget(
                icon: Icons.email,
                label: "Email",
                data: "samantha.bangcaya09@gmail.com"),
            SectionWidget(
                icon: Icons.format_quote,
                label: "Quote",
                data:
                    "I know what it is. It's just myself talking to myself about myself.",
                dataStyle: TextStyle(fontStyle: FontStyle.italic)),

            SectionWidget(
                icon: Icons.location_on, label: "Address", data: "Antique"),

            // Biography Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.green,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "A Journey of Resilience: From Artistic Dreams to Technological Pursuits",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                          "In the calm coastal town of Antique, where the mountains meet the sea, I, a product of serenity, was born on a rainy day in July 2002. I had dreams of being an architect because I loved art, but I had to change my plans due to not having enough money. Now, I'm 21 years old, and I'm in my third year of college, studying Computer Science with a focus on Artificial Intelligence at West Visayas State University in Iloilo City. I'm deeply connected to the beautiful landscapes of Antique, and I'm proud of my family – my mom, Josephine, and my dad, Romeo, who works as a fisherman. My younger brother, Jason, is in 12th grade. We also have some pets, like dogs Nani, Tintin, and Hotdog, as well as four cats and four pigs. I enjoy listening to music and being by myself because it makes me feel free and peaceful. I use my endless creativity to make my dreams come true. In the music of life, my story is a song of hope, change, and my strong passion.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.green,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Me List',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MeListPage()),
            );
          }
        },
      ),
    );
  }
}

class MeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Me List"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageListWidget(
                label: "Books",
                items: [
                  MeListItem(name: "Sands of Time", image: "sands_of_time.jpg"),
                  MeListItem(name: "Heartless", image: "heartless.jpg"),
                ],
              ),
              ImageListWidget(
                label: "Artists",
                items: [
                  MeListItem(name: "The NBHD", image: "nbhd.jpg"),
                  MeListItem(name: "Newjeans", image: "newjeans.jpg"),
                ],
              ),
              ImageListWidget(
                label: "Food",
                items: [
                  MeListItem(name: "Carbonara", image: "carbonara.jpg"),
                  MeListItem(name: "Pancake", image: "pancake.jpg"),
                ],
              ),
              ColorWidget(),
              MusicItemWidget(
                name: "Cry Baby by The NBHD",
                assetPath: "assets/crybaby_nbhd.mp3",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeListItem {
  final String name;
  final String image;

  MeListItem({required this.name, required this.image});
}

class ImageListWidget extends StatelessWidget {
  final String label;
  final List<MeListItem> items;

  ImageListWidget({required this.label, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              for (var item in items)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/${item.image}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(item.name),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Color",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.green, // Replace with the desired color
              ),
              SizedBox(width: 10),
              Container(
                width: 100,
                height: 100,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MusicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Music",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          MusicItemWidget(
            name: "Cry Baby by The Neighbourhood",
            assetPath: "assets/crybaby_nbhd.mp3",
          ),
          // Remove the duplicate entry for "Scary Love" in the Music Widget
        ],
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String data;
  final TextStyle? dataStyle;

  SectionWidget(
      {required this.icon,
      required this.label,
      required this.data,
      this.dataStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(icon, size: 30),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                data,
                style: dataStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
