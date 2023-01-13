// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_book_ui/widgets/booklistcard.dart';
import 'package:flutter_book_ui/widgets/coverimagewidget.dart';
import 'package:flutter_book_ui/widgets/tablabelswidget.dart';

class BookHomeScreen extends StatefulWidget {
  const BookHomeScreen({super.key});

  @override
  State<BookHomeScreen> createState() => _BookHomeScreenState();
}

class _BookHomeScreenState extends State<BookHomeScreen>
    with SingleTickerProviderStateMixin {
  List? books;
  List? bookcovers;
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;

  loadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/jsons/books.json")
        .then((value) => setState(() {
              books = json.decode(value);
            }));
    await DefaultAssetBundle.of(context)
        .loadString("assets/jsons/bookcover.json")
        .then((value) => setState(() {
              bookcovers = json.decode(value);
            }));
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              height: 60.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.dashboard),
                    iconSize: 30.0,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: Colors.blue,
                        iconSize: 30.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications),
                        color: Colors.yellow,
                        iconSize: 30.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // pageview builder

            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: SizedBox(
                height: 180.0,
                child: PageView.builder(
                    controller: PageController(viewportFraction: 0.8),
                    itemCount: bookcovers == null ? 0 : bookcovers!.length,
                    itemBuilder: (_, i) {
                      var bookcoverimage = bookcovers![i];
                      return BookCoverimageWidget(
                        bookcoverimage: bookcoverimage["coverimage"],
                        bookcovername: bookcoverimage["covername"],
                      );
                    }),
              ),
            ),

            //nested scrollview

            Expanded(
              child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (context, isScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      backgroundColor: Colors.white,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(5.0),
                        child: TabBar(
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.white,
                            controller: _tabController,
                            isScrollable: true,
                            tabs: const [
                              TabColorLabel(
                                label: "New",
                                color: Colors.yellow,
                              ),
                              TabColorLabel(
                                label: "Popular",
                                color: Colors.red,
                              ),
                              TabColorLabel(
                                label: "Trending",
                                color: Colors.blue,
                              ),
                            ]),
                      ),
                    ),
                  ];
                },
                body: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                      itemCount: books == null ? 0 : books!.length,
                      itemBuilder: (_, i) {
                        var book = books![i];
                        return BookListCard(
                          bookAuthor: book["author"],
                          bookCountry: book["country"],
                          bookTitle: book["title"],
                          bookimage: book["imageLink"],
                          bookPages: book["pages"],
                        );
                      }),
                  ListView.builder(
                      itemCount: books == null ? 0 : books!.length,
                      itemBuilder: (_, i) {
                        var book = books![i];
                        return BookListCard(
                          bookAuthor: book["author"],
                          bookCountry: book["country"],
                          bookTitle: book["title"],
                          bookimage: book["imageLink"],
                          bookPages: book["pages"],
                        );
                      }),
                  ListView.builder(
                      itemCount: books == null ? 0 : books!.length,
                      itemBuilder: (_, i) {
                        var book = books![i];
                        return BookListCard(
                          bookAuthor: book["author"],
                          bookCountry: book["country"],
                          bookTitle: book["title"],
                          bookimage: book["imageLink"],
                          bookPages: book["pages"],
                        );
                      }),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
