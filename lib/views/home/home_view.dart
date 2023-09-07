import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:unsplash_api/controller/simple_ui_&_api_controller.dart';
import 'package:unsplash_api/views/details/details_view.dart';
import 'package:unsplash_api/views/home/components/my_app_bar.dart';
import 'package:unsplash_api/views/home/components/tab_bar.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  SimpleUIController homeController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              MyAppBar(size: size),
              Expanded(
                flex: 7,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      flex: 1,
                      child: TabbBar(),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      flex: 13,
                      child: Obx(
                        () {
                          return homeController.isLoading.value
                              ? Center(
                                  child: LoadingAnimationWidget.flickr(
                                    leftDotColor: const Color(0xfffd0079),
                                    rightDotColor: Colors.black,
                                    size: 30,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: GridView.custom(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    gridDelegate: SliverQuiltedGridDelegate(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                      repeatPattern:
                                          QuiltedGridRepeatPattern.inverted,
                                      pattern: const [
                                        QuiltedGridTile(2, 2),
                                        QuiltedGridTile(1, 1),
                                        QuiltedGridTile(1, 1),
                                        QuiltedGridTile(1, 2),
                                      ],
                                    ),
                                    childrenDelegate:
                                        SliverChildBuilderDelegate(
                                      childCount: homeController.photos.length,
                                      (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(
                                              DetailView(index: index),
                                            );
                                          },
                                          child: Hero(
                                            tag: homeController
                                                .photos[index].id!,
                                            child: Container(
                                              margin: const EdgeInsets.all(2),
                                              child: CachedNetworkImage(
                                                imageUrl: homeController
                                                    .photos[index]
                                                    .urls!['small']!,
                                                imageBuilder:
                                                    (context, imageProvider) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                placeholder: (context, url) {
                                                  return Center(
                                                    child:
                                                        LoadingAnimationWidget
                                                            .flickr(
                                                      leftDotColor: const Color(
                                                          0xfffd0079),
                                                      rightDotColor:
                                                          Colors.black,
                                                      size: 25,
                                                    ),
                                                  );
                                                },
                                                errorWidget:
                                                    (context, url, error) {
                                                  return const Icon(
                                                    Icons
                                                        .image_not_supported_rounded,
                                                    color: Colors.grey,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
