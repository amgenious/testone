import 'package:community_app/utils/colors.dart';
import 'package:flutter/material.dart';
import '../models/memberprofile_model.dart';

class MemebersDetailsPage extends StatefulWidget {
  const MemebersDetailsPage({super.key,required this.data,});
  final MemberProfileModel data;

  @override
  State<MemebersDetailsPage> createState() => _MemebersDetailsPageState();
}

class _MemebersDetailsPageState extends State<MemebersDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    MemberProfileModel current = widget.data;
    return Scaffold(
 backgroundColor: Colors.black,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor:  Colors.amber,
          title: const Text("Member Details",),
        ),
        body: Container(
          color: Colors.white,
          width: size.width,
          height: size.height,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
                child: Stack(
                  children: [
                    Hero(
                      tag: current.id,
                      child: Container(
                        width: size.width,
                        height: size.height * 0.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(current.imagebgUrl),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: size.width,
                        height: size.height * 0.10,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: gradient),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(current.fullname,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 179, 64),
                                  fontSize: 25)),
                          RichText(
                            text: TextSpan(
                              text: "",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              children: [
                                TextSpan(
                                  text: current.position,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      const Text(
                        "Description",
                        style:
                            TextStyle(color: Colors.grey),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 5)),
                       Text(
                       current.bio,
                        style: const TextStyle(color: Colors.grey),
                        maxLines:
                            const int.fromEnvironment("defaultPort", defaultValue: 4),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 20)),
                      SizedBox(
                        width: size.width,
                        height: 50,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Colors.amber)),
                            onPressed: () {},
                            child: const Text(
                              "Connect",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
          ],
          ),),
    );
  }
}