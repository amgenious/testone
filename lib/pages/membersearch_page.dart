import 'package:community_app/pages/membersdetail_page.dart';
import 'package:flutter/material.dart';
import '../models/memberprofile_model.dart';
import '../utils/contant.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<MemberProfileModel> filteredProfiles = [];
  String searchQuery = "";
  @override
    void initState() {
    super.initState();
    filteredProfiles = memberprofile; 
  }

  void updateSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredProfiles = memberprofile
          .where((current) =>
               current.fullname.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.amber,
        title: const Text("Members Directory"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: updateSearch,
              decoration: InputDecoration(
                hintText: "Search by name...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProfiles.length,
              itemBuilder: (context, index) {
                MemberProfileModel current = filteredProfiles[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(current.imagesmUrl),
                  ),
                  title: Text(current.fullname,style: const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(current.position),
                  onTap:  (()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                FocusManager.instance.primaryFocus?.unfocus();
                return MemebersDetailsPage(data: current);
              })
            )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}