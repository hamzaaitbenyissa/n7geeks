import 'package:agora_uikit/agora_uikit.dart';
import 'package:chatnow/allConstants/all_constants.dart';
import 'package:flutter/material.dart';

class VideoCallPage extends StatefulWidget {
  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "331b0fa963a54bcc925f43bf4961f3f2",
      channelName: "test",
      username: "user",
    ),
    enabledPermission: [Permission.camera, Permission.microphone],
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('N7geeks Talk'),
        centerTitle: true,
        backgroundColor: AppColors.primarycolor,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
                client: client,
                layoutType: Layout.grid,
                enableHostControls: true,
                showNumberOfUsers: true,
                disabledVideoWidget: Container(
                    color: AppColors.primarycolor,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(" N7 Geeks ... 🤍",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: Sizes.dimen_24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Text("WE BELIEVE IN YOU !! ✌",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: Sizes.dimen_24,
                                fontWeight: FontWeight.bold)),
                      ],
                    )))), // Add this to enable host controls
            AgoraVideoButtons(
              client: client,
            ),
          ],
        ),
      ),
    );
  }
}
