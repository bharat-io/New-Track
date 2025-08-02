import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newstrack/logic/bloc/news_bloc.dart';
import 'package:newstrack/logic/bloc/news_event.dart';
import 'package:newstrack/logic/bloc/news_state.dart';
import 'package:newstrack/service/api_service.dart';
import 'package:newstrack/utill/app_const.dart';
import 'package:newstrack/utill/theming/app_color.dart';
import 'package:newstrack/utill/theming/app_space.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<String> imgList = [
    'https://www.shutterstock.com/shutterstock/photos/1928997539/display_1500/stock-vector-breaking-news-template-with-d-red-and-blue-badge-breaking-news-text-on-dark-blue-with-earth-and-1928997539.jpg',
    'https://s.france24.com/media/display/e6279b3c-db08-11ee-b7f5-005056bf30b7/w:1280/p:16x9/news_en_1920x1080.jpg',
    'https://cdn.pixabay.com/photo/2017/06/26/19/03/news-2444778_960_720.jpg',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];

  final List<Tab> tabList = [
    Tab(text: "All"),
    Tab(text: "Politics"),
    Tab(text: "Tech"),
    Tab(text: "Sports"),
    Tab(text: "Entertain")
  ];

  final CarouselController _carouselController = CarouselController();
  int _indecatorIndex = 0;
  late final TabController _tabController;
  ApiService apiService = ApiService();
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNewsEvent());

    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "wellcome",
                  style: TextTheme.of(context).titleSmall,
                ),
                Text(
                  "Viladmir putin",
                  style: TextTheme.of(context).titleLarge,
                )
              ],
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.notification_add),
          )
        ],
      ),
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 248, 247, 247),
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: "Let see what happen today",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
            AppSpacing.gap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Breaking News",
                    style: TextTheme.of(context).headlineSmall),
                Text(
                  "see all",
                  style: TextTheme.of(context)
                      .labelLarge!
                      .copyWith(color: AppColor.primaryColor),
                )
              ],
            ),
            AppSpacing.gap12,
            BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
              if (state is LodingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FailedState) {
                print("${state.errorMessage}");
                return Center(
                  child: Text(state.errorMessage.toString()),
                );
              } else if (state is LoadedState) {
                final newsList = state.newsModel.articles;
                return CarouselSlider(
                  items: newsList!.take(5).map((item) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(21),
                        child: Stack(
                          children: [
                            // ✅ Image fills entire space
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  item.urlToImage ??
                                      "https://via.placeholder.com/300",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // ✅ Title container at bottom
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          colors: [
                                        Colors.white,
                                        Colors.black.withOpacity(0.7),
                                      ])),
                                  child: Text(
                                    item.title ?? "No title",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(color: Colors.white),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _indecatorIndex = index;
                      });
                    },
                  ),
                );
              }
              return Container();
            }),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((item) {
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(3),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _indecatorIndex == item.key
                            ? AppColor.secondaryColor
                            : AppColor.primaryColor,
                      ),
                    ),
                  );
                }).toList()),
            AppSpacing.gap16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trending Right Now",
                  style: TextTheme.of(context).headlineSmall,
                ),
                Text("See all"),
              ],
            ),
            DefaultTabController(
              length: 5,
              child: TabBar(
                dividerHeight: 0,
                isScrollable: true,
                controller: _tabController,
                tabs: tabList,
              ),
            ),
            BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
              if (state is LodingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is FailedState) {
                return Center(
                  child: Text(state.errorMessage.toString()),
                );
              } else if (state is LoadedState) {
                final categoryNewsList = state.newsModel.articles;
                return Expanded(
                    child: ListView.builder(
                        itemCount: categoryNewsList!.length,
                        itemBuilder: (context, index) {
                          final category = categoryNewsList[index];

                          return _buildNewsCard(
                              newsTitle: category.title.toString(),
                              newsCategory: category.author.toString(),
                              imageUrl: category.urlToImage.toString());
                        }));
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(
      {required String newsTitle,
      required String newsCategory,
      required String imageUrl}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(fit: BoxFit.fill, imageUrl),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newsCategory),
                Text(
                  maxLines: 2,
                  newsTitle,
                  style: TextTheme.of(context).titleLarge,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
