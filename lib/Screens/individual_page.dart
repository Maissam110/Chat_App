import 'package:chat_app/Model/chat_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualPage extends StatefulWidget {
  final ChatModel? chatModel;
  const IndividualPage({super.key, this.chatModel});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back, size: 24, color: Colors.white),
              SizedBox(width: 3),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  widget.chatModel?.isGroup == true
                      ? 'assets/groups.svg'
                      : 'assets/person.svg',
                  color: Colors.white,
                  width: 36,
                  height: 36,
                ),
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel?.name ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "last seen today at 12:05",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call, color: Colors.white),
          ),
          PopupMenuButton<String>(
            iconColor: Colors.white,
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "View Contact",
                  child: Text("View Contact"),
                ),
                PopupMenuItem(
                  value: "Media, links, and docs",
                  child: Text("Media, links, and docs"),
                ),
                PopupMenuItem(
                  value: "WhatsApp Web",
                  child: Text("WhatsApp Web"),
                ),
                PopupMenuItem(value: "Search", child: Text("Search")),
                PopupMenuItem(
                  value: "Mute Notifications",
                  child: Text("Mute Notifications"),
                ),
                PopupMenuItem(value: "Wallpaper", child: Text("Wallpaper")),
              ];
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin: EdgeInsets.only(
                              left: 2,
                              right: 2,
                              bottom: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 5,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a Message",
                                contentPadding: EdgeInsets.all(5),
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                    setState(() {
                                      show = !show;
                                    });
                                  },
                                  icon: Icon(Icons.emoji_emotions),
                                ),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) => bottomSheet(),
                                        );
                                      },
                                      icon: Icon(Icons.attach_file),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.camera_alt),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                            right: 5,
                            left: 2,
                          ),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.mic, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    show ? emojiSelect() : Container(),
                  ],
                ),
              ),
            ],
          ),
          onPopInvokedWithResult: (bool show, Object? value) {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }

  //
  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                    Icons.insert_drive_file,
                    Colors.indigo,
                    'Document',
                  ),
                  SizedBox(width: 40),
                  iconCreation(Icons.camera_alt, Colors.pink, 'Camera'),
                  SizedBox(width: 40),
                  iconCreation(Icons.insert_photo, Colors.purple, 'Gallery'),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, 'Audio'),
                  SizedBox(width: 40),
                  iconCreation(Icons.location_pin, Colors.teal, 'Location'),
                  SizedBox(width: 40),
                  iconCreation(Icons.person, Colors.blue, 'Contact'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: IconButton(
              onPressed: () {},
              icon: Icon(icon, size: 29, color: Colors.white),
            ),
          ),
          SizedBox(height: 5),
          Text(text, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  //
  Widget emojiSelect() {
    return EmojiPicker(
      config: Config(emojiViewConfig: EmojiViewConfig(columns: 7)),

      onEmojiSelected: (category, emoji) {
        print(emoji.emoji);
        setState(() {
          _controller.text = _controller.text + emoji.emoji;
        });
        // hello
      },
    );
  }
}
