import 'package:flutter/material.dart';
import 'package:task_products/core/extension/context.dart';
import 'package:task_products/core/resources_manager/color.dart';
import 'package:task_products/core/widgets/font.dart';

//ignore: must_be_immutable
class ExploreViewApartmentView extends StatelessWidget {
  ExploreViewApartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.7,
          mainAxisExtent: 250,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ExploreApartmentCardView();
        },
      ),
    );
  }
}

//ignore: must_be_immutable
class ExploreApartmentCardView extends StatelessWidget {
  ExploreApartmentCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: context.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with badge and favorite icon
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
                        height: 190,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite_border, color: Colors.red),
                      ),
                    ),
                  ],
                ),

                // Title and Price
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Berliner alle",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "€ 450.00 ",
                          children: [
                            TextSpan(
                              text: "/Month",
                              style: TextStyle(
                                fontSize: FontSize.fontSize14,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ],
                          style: TextStyle(
                            fontSize: FontSize.fontSize16,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
