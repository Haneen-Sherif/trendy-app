import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({Key? key, required this.product}) : super(key: key);
  final DocumentSnapshot product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool change = true;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        image: AssetImage(widget.product['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: iconStyle(),
                              child: const Icon(
                                Icons.arrow_back,
                                color: kSecondarColor,
                              )),
                          const Spacer(),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  change = !change;
                                });
                              },
                              style: iconStyle(),
                              child: Icon(
                                change ? Icons.favorite_border : Icons.favorite,
                                color: kSecondarColor,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.product['title'].toString()}  ${widget.product['price']}\$",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.product['rate'].toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87.withOpacity(0.8),
                                fontWeight: FontWeight.bold),
                          ),
                          const Icon(
                            Icons.star,
                            color: Color(0xffF8D210),
                            size: 23,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.product['category'],
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87.withOpacity(0.8),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () {
                              _showModalBottomSheet(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffDA4C2D),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_outline_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Rate',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.product['description'],
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87.withOpacity(0.8)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ); // floatingActionButton: NumberOfProducts());
  }

  void _showModalBottomSheet(BuildContext context) {
    double ratingInner = 3.0;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                //height: 500,
                padding: const EdgeInsets.all(10),
                // rating and feedback input
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ios docker bottom line
                      Container(
                        //height: 7,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      // rating bar
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          // updateOnDrag: false,
                          // tapOnlyMode: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xffF8D210),
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              ratingInner = rating;
                            });
                          },
                        ),
                      ),
                      // rate in text
                      Text(
                        '$ratingInner',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      // feedback input
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Feedback',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      // submit button that close the bottom sheet
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .5,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: const Text(
                              'Submit',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
