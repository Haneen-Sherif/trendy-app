class ProductModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final double? rate;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rate});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: int.parse(json["id"]),
      title: json['title'],
      price: double.parse(json['price']),
      description: json['birthDay'],
      category: json['category'],
      image: json['image'],
      rate: double.parse(json['rate']));

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rate': rate,
      };

//   CollectionReference productList =
//       FirebaseFirestore.instance.collection('products');
//
//   Future getProductList() async {
//     List productList = [];
//
//     try{
// await productList..then(querySnapshot){
//   querySnapshot.
// }
//     }catch (e){
//       print(e.toString());
//       return null;
//     }
//     QuerySnapshot querySnapshot = await _collectionRef.get();
//
//     // Get data from docs and convert map to List
//     final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//
//     return allData;
//   }
}

// List<ProductModel> products = [
//   ProductModel(
//       id: 1,
//       title: "Foldsack Backpack",
//       price: 109.95,
//       description:
//           "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday.",
//       category: "men's clothing",
//       image: "assets/images/product_image/1.jpg",
//       rate: 3.9),
//   ProductModel(
//       id: 2,
//       title: "Mens Casual T-Shirts",
//       price: 22.3,
//       description:
//           "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
//       category: "men's clothing",
//       image: "assets/images/product_image/2.jpg",
//       rate: 4.1),
//   ProductModel(
//       id: 3,
//       title: "Mens Cotton Jacket",
//       price: 55.99,
//       description:
//           "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",
//       category: "men's clothing",
//       image: "assets/images/product_image/3.jpg",
//       rate: 4.7),
//   ProductModel(
//       id: 4,
//       title: "Mens Casual Slim Fit",
//       price: 15.99,
//       description:
//           "The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.",
//       category: "men's clothing",
//       image: "assets/images/product_image/4.jpg",
//       rate: 2.1),
//   ProductModel(
//       id: 5,
//       title: "Women's Chain Bracelet",
//       price: 695,
//       description:
//           "From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.",
//       category: "jewelery",
//       image: "assets/images/product_image/5.jpg",
//       rate: 4.6),
//   ProductModel(
//       id: 6,
//       title: "Solid Gold Petite",
//       price: 168,
//       description:
//           "Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.",
//       category: "jewelery",
//       image: "assets/images/product_image/6.jpg",
//       rate: 3.9),
//   ProductModel(
//       id: 7,
//       title: "White Gold Plated",
//       price: 9.99,
//       description:
//           "Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...",
//       category: "jewelery",
//       image: "assets/images/product_image/7.jpg",
//       rate: 3),
//   ProductModel(
//       id: 8,
//       title: "Rose Gold Plated Stainless Steel Double",
//       price: 10.99,
//       description:
//           "Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel",
//       category: "jewelery",
//       image: "assets/images/product_image/8.jpg",
//       rate: 1.9),
//   ProductModel(
//       id: 9,
//       title: "Portable External Hard Drive",
//       price: 64,
//       description:
//           "USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system",
//       category: "electronics",
//       image: "assets/images/product_image/9.jpg",
//       rate: 3.3),
//   ProductModel(
//       id: 10,
//       title: "SanDisk SSD PLUS",
//       price: 109,
//       description:
//           "Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)",
//       category: "electronics",
//       image: "assets/images/product_image/10.jpg",
//       rate: 2.9),
//   ProductModel(
//       id: 11,
//       title: "Silicon Power",
//       price: 109,
//       description:
//           "3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.",
//       category: "electronics",
//       image: "assets/images/product_image/11.jpg",
//       rate: 4.8),
//   ProductModel(
//       id: 12,
//       title: "Gaming Drive",
//       price: 114,
//       description:
//           "Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer's limited warranty",
//       category: "electronics",
//       image: "assets/images/product_image/12.jpg",
//       rate: 4.8),
//   ProductModel(
//       id: 13,
//       title: "Acer SB220Q bi",
//       price: 599,
//       description:
//           "21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz",
//       category: "electronics",
//       image: "assets/images/product_image/13.jpg",
//       rate: 2.9),
//   ProductModel(
//       id: 14,
//       title: "Curved Gaming Monitor",
//       price: 999.99,
//       description:
//           "49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag",
//       category: "electronics",
//       image: "assets/images/product_image/14.jpg",
//       rate: 2.2),
//   ProductModel(
//       id: 15,
//       title: "Snowboard Jacket",
//       price: 56.99,
//       description:
//           "Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates",
//       category: "women's clothing",
//       image: "assets/images/product_image/15.jpg",
//       rate: 2.6),
//   ProductModel(
//       id: 16,
//       title: "Leather Biker Jacket",
//       price: 29.95,
//       description:
//           "100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON",
//       category: "women's clothing",
//       image: "assets/images/product_image/16.jpg",
//       rate: 2.9),
//   ProductModel(
//       id: 17,
//       title: "Rain Jacket",
//       price: 39.99,
//       description:
//           "Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn't overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.",
//       category: "women's clothing",
//       image: "assets/images/product_image/17.jpg",
//       rate: 3.8),
//   ProductModel(
//       id: 18,
//       title: "Short Sleeve Boat Neck V",
//       price: 9.85,
//       description:
//           "95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem",
//       category: "women's clothing",
//       image: "assets/images/product_image/18.jpg",
//       rate: 4.7),
//   ProductModel(
//       id: 19,
//       title: "Women's Short Sleeve",
//       price: 7.95,
//       description:
//           "100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort",
//       category: "women's clothing",
//       image: "assets/images/product_image/19.jpg",
//       rate: 4.5),
//   ProductModel(
//       id: 20,
//       title: "T-Shirt Casual Cotton Short",
//       price: 12.99,
//       description:
//           "95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.",
//       category: "women's clothing",
//       image: "assets/images/product_image/20.jpg",
//       rate: 3.6),
// ];
//
// List<ProductModel> electronicsProducts = [
//   ProductModel(
//       id: 9,
//       title: "Portable External Hard Drive",
//       price: 64,
//       description:
//           "USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system",
//       category: "electronics",
//       image: "assets/images/product_image/9.jpg",
//       rate: 3.3),
//   ProductModel(
//       id: 10,
//       title: "SanDisk SSD PLUS",
//       price: 109,
//       description:
//           "Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)",
//       category: "electronics",
//       image: "assets/images/product_image/10.jpg",
//       rate: 2.9),
//   ProductModel(
//       id: 11,
//       title: "Silicon Power",
//       price: 109,
//       description:
//           "3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.",
//       category: "electronics",
//       image: "assets/images/product_image/11.jpg",
//       rate: 4.8),
//   ProductModel(
//       id: 12,
//       title: "Gaming Drive",
//       price: 114,
//       description:
//           "Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer's limited warranty",
//       category: "electronics",
//       image: "assets/images/product_image/12.jpg",
//       rate: 4.8),
//   ProductModel(
//       id: 13,
//       title: "Acer SB220Q bi",
//       price: 599,
//       description:
//           "21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz",
//       category: "electronics",
//       image: "assets/images/product_image/13.jpg",
//       rate: 2.9),
//   ProductModel(
//       id: 14,
//       title: "Curved Gaming Monitor",
//       price: 999.99,
//       description:
//           "49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag",
//       category: "electronics",
//       image: "assets/images/product_image/14.jpg",
//       rate: 2.2),
// ];
// List<ProductModel> jeweleryProducts = [
//   ProductModel(
//       id: 5,
//       title: "Women's Chain Bracelet",
//       price: 695,
//       description:
//           "From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.",
//       category: "jewelery",
//       image: "assets/images/product_image/5.jpg",
//       rate: 4.6),
//   ProductModel(
//       id: 6,
//       title: "Solid Gold Petite",
//       price: 168,
//       description:
//           "Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.",
//       category: "jewelery",
//       image: "assets/images/product_image/6.jpg",
//       rate: 3.9),
//   ProductModel(
//       id: 7,
//       title: "White Gold Plated",
//       price: 9.99,
//       description:
//           "Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...",
//       category: "jewelery",
//       image: "assets/images/product_image/7.jpg",
//       rate: 3),
//   ProductModel(
//       id: 8,
//       title: "Rose Gold Plated Stainless Steel Double",
//       price: 10.99,
//       description:
//           "Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel",
//       category: "jewelery",
//       image: "assets/images/product_image/8.jpg",
//       rate: 1.9),
// ];
// List<ProductModel> menClothingProducts = [
//   ProductModel(
//       id: 1,
//       title: "Foldsack Backpack",
//       price: 109.95,
//       description:
//           "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday.",
//       category: "men's clothing",
//       image: "assets/images/product_image/1.jpg",
//       rate: 3.9),
//   ProductModel(
//       id: 2,
//       title: "Mens Casual T-Shirts",
//       price: 22.3,
//       description:
//           "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
//       category: "men's clothing",
//       image: "assets/images/product_image/2.jpg",
//       rate: 4.1),
//   ProductModel(
//       id: 3,
//       title: "Mens Cotton Jacket",
//       price: 55.99,
//       description:
//           "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",
//       category: "men's clothing",
//       image: "assets/images/product_image/3.jpg",
//       rate: 4.7),
//   ProductModel(
//       id: 4,
//       title: "Mens Casual Slim Fit",
//       price: 15.99,
//       description:
//           "The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.",
//       category: "men's clothing",
//       image: "assets/images/product_image/4.jpg",
//       rate: 2.1),
// ];
// List<ProductModel> womenClothingProducts = [
//   ProductModel(
//       id: 15,
//       title: "Snowboard Jacket",
//       price: 56.99,
//       description:
//           "Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates",
//       category: "women's clothing",
//       image: "assets/images/product_image/15.jpg",
//       rate: 2.6),
//   ProductModel(
//       id: 16,
//       title: "Leather Biker Jacket",
//       price: 29.95,
//       description:
//           "100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON",
//       category: "women's clothing",
//       image: "assets/images/product_image/16.jpg",
//       rate: 2.9),
//   ProductModel(
//       id: 17,
//       title: "Rain Jacket",
//       price: 39.99,
//       description:
//           "Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn't overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.",
//       category: "women's clothing",
//       image: "assets/images/product_image/17.jpg",
//       rate: 3.8),
//   ProductModel(
//       id: 18,
//       title: "Short Sleeve Boat Neck V",
//       price: 9.85,
//       description:
//           "95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem",
//       category: "women's clothing",
//       image: "assets/images/product_image/18.jpg",
//       rate: 4.7),
//   ProductModel(
//       id: 19,
//       title: "Women's Short Sleeve",
//       price: 7.95,
//       description:
//           "100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort",
//       category: "women's clothing",
//       image: "assets/images/product_image/19.jpg",
//       rate: 4.5),
//   ProductModel(
//       id: 20,
//       title: "T-Shirt Casual Cotton Short",
//       price: 12.99,
//       description:
//           "95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.",
//       category: "women's clothing",
//       image: "assets/images/product_image/20.jpg",
//       rate: 3.6),
// ];
