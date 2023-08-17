import 'package:flutter/material.dart';
import 'package:gmail_clone/responsive/general_page.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  bool _isSidebarExpanded = false;

  void _toggleSidebar() {
    setState(() {
      _isSidebarExpanded = !_isSidebarExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 8,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          title: const Row(
            children: [
              Image(
                image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Gmail_icon_%282020%29.svg/2560px-Gmail_icon_%282020%29.svg.png',
                ),
                width: 30,
              ),
              Text(
                'Gmail',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          actions: [
            Container(
                padding: const EdgeInsets.all(5),
                width: size.width * 0.5,
                child: const SearchBar(
                  // padding: MaterialStatePropertyAll(EdgeInsets.all(5)),
                  hintStyle:
                      MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                  hintText: 'Search Mail',
                  leading: Icon(Icons.search),
                  trailing: [Icon(Icons.tune)],
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.question_mark_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.square)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          ],
          leading: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.menu),
            onPressed: _toggleSidebar,
          ),
        ),
        body: Row(
          children: [
            if (_isSidebarExpanded) const Sidebar(), // Sidebar with icons
            Expanded(
              child: Row(
                children: [
                  if (!_isSidebarExpanded)
                    const SizedBox(
                      width: 50,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  const Expanded(child: GeneralSettingsSection()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.mail),
            onPressed: () {
              // Handle mail icon click
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              // Handle calendar icon click
            },
          ),
          // Add more sidebar icons here
        ],
      ),
    );
  }
}

class GeneralSettingsSection extends StatefulWidget {
  const GeneralSettingsSection({super.key});

  @override
  State<GeneralSettingsSection> createState() => _GeneralSettingsSectionState();
}

class _GeneralSettingsSectionState extends State<GeneralSettingsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: Color.fromARGB(255, 57, 55, 55)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Settings',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16), // Add some spacing
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width ,
                  child: AppBar(
                    bottom: const TabBar(tabs: [
                      Tab(text: 'General'),
                      Tab(text: 'Label'),
                      Tab(text: 'Inbox'),
                      Tab(text: 'Accounts and Imports'),
                      Tab(text: 'General'),
                      Tab(text: 'General'),
                      Tab(text: 'General'),
                      Tab(text: 'General'),
                      
                     
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: TabBarView(
              children: [
                const GenralPage(),
                Container(
                  color: Colors.pink,
                  child: const Center(child: Text('Tab 2')),
                ),
                Container(
                  color: Colors.blue,
                  child: const Center(child: Text('Tab 3')),
                ),
                Container(
                  color: Colors.blue,
                  child: const Center(child: Text('Tab 3')),
                ),Container(
                  color: Colors.blue,
                  child: const Center(child: Text('Tab 3')),
                ),Container(
                  color: Colors.blue,
                  child: const Center(child: Text('Tab 3')),
                ),Container(
                  color: Colors.blue,
                  child: const Center(child: Text('Tab 3')),
                ),Container(
                  color: Colors.blue,
                  child: const Center(child: Text('Tab 3')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
