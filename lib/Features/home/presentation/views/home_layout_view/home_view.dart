import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Features/home/presentation/views/product_details_view.dart';
import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_card.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 90),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("products").snapshots(),
          builder: (context, snapshot) {
            try {
              return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  clipBehavior: Clip.none,
                  gridDelegate: gridViewStyle(),
                  itemBuilder: (context, index) {
                    DocumentSnapshot product = snapshot.data!.docs[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsView(
                                product: product,
                              ),
                            ),
                          );
                        },
                        child: CustomCard(product: product));
                  });
            } catch (e) {
              return const CustomLoadingIndicator();
            }
          }),
    );
  }
}
