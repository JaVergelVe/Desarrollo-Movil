import 'package:flutter/material.dart';

class InifinityScreen extends StatelessWidget {
  const InifinityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inifinty'),
      ),
      body: const _InifinityView(),
    );
  }
}

class _InifinityView extends StatefulWidget {
  const _InifinityView();

  @override
  State<_InifinityView> createState() => _InifinityViewState();
}

class _InifinityViewState extends State<_InifinityView> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool loading = false;

  final ScrollController scroll = ScrollController();
  void addImage() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if (scroll.position.pixels + 500 >= scroll.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  Future loadNextPage() async {
    if (loading) return;

    loading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addImage();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      removeTop: true,
      child: ListView.builder(
        controller: scroll,
        itemCount: imagesIds.length,
        itemBuilder: (context, index) {
          return FadeInImage(
            fit: BoxFit.cover,
            height: 300,
            placeholder: const AssetImage('loader.jpg'),
            image: NetworkImage(
                'https://picsum.photos/id/${imagesIds[index]}/200/300'),
          );
        },
      ),
    );
  }
}
