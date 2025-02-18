import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../viewmodel/ShopViewModel.dart';

class ShopPageView extends StatelessWidget {
  const ShopPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopViewModel(),
      child: Consumer<ShopViewModel>(
        builder: (context, viewModel, child) {
          return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Column(
                children: [
                  Flexible(
                    child: Text('Men\'s Original', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: 'AtkinsonHyperlegible',
                    )),
                  ),
                  Flexible(
                    child: Text('Smiths Shoes', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: 'AtkinsonHyperlegible',
                    )),
                  ),
                ],
              ),
              leading: Icon(CupertinoIcons.back, size: 26),
              trailing: Icon(CupertinoIcons.heart, size: 26),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      // Shoe Image
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10)],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/images/shoes.png', height: 200),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Product Description
                      const Text('Product Description', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontFamily: 'AtkinsonHyperlegible',
                      )),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'A style icon gets some love from one of today’s top trendsetters. '
                              'Pharrell Williams puts his creative spin on these shoes...A style icon gets some love from one of today’s top trendsetters. '
                              'Pharrell Williams puts his creative spin on these shoes...A style icon gets some love from one of today’s top trendsetters. '
                              'Pharrell Williams puts his creative spin on these shoes...',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'AtkinsonHyperlegible',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Color and Size Selection
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text('Color', style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontFamily: 'AtkinsonHyperlegible',
                                )),
                              ),
                              Flexible(
                                child: Text('Size', style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontFamily: 'AtkinsonHyperlegible',
                                )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Color Selection

                              // use flexible to make the row take the remaining space
                              Flexible(
                                child: Row(
                                  children: List.generate(viewModel.colors.length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        viewModel.setSelectedColor(index);
                                        Fluttertoast.showToast(
                                          msg: 'Selected Color: ${viewModel.colors[index]}',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 6),
                                        decoration: BoxDecoration(
                                          color: viewModel.colors[index],
                                          shape: BoxShape.circle,
                                          border: viewModel.selectedColorIndex == index
                                              ? Border.all(color: Colors.black, width: 2)
                                              : null,
                                        ),
                                        width: 30,
                                        height: 30,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              // Size Selection

                              // use flexible to make the dropdown button take the remaining space
                              Flexible(
                                child: Container(
                                  color: Colors.transparent,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: DropdownButton<String>(
                                      value: viewModel.sizes[viewModel.selectedSizeIndex],
                                      items: viewModel.sizes.map((String size) {
                                        return DropdownMenuItem<String>(
                                          value: size,
                                          child: Text(size),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          viewModel.setSelectedSize(viewModel.sizes.indexOf(newValue));
                                          Fluttertoast.showToast(
                                            msg: 'Selected Size: $newValue',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.black,
                                            textColor: Colors.white,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Price: \$95', style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: 'AtkinsonHyperlegible',
                          )),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[600],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),

                            child:  const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.shopping_bag, color: Colors.white),
                                SizedBox(width: 8),
                                Text('Add to Bag', style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontFamily: 'AtkinsonHyperlegible',
                                )),
                              ],
                            ),
                            onPressed: () {
                              // Handle add to bag logic here
                              Fluttertoast.showToast(
                                msg: 'Added to Bag',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}