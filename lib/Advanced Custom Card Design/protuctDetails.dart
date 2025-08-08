import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/CustomWidgetFunction/CustomFunctions.dart';
//✅ Step 6.24: Flutter GridView - Advanced Custom Card Design
//Practice Task 6.24 সাবমিট করলাম
class productDetailsGrid extends StatelessWidget {
   productDetailsGrid({super.key});

   List<productDetails> productList = [
     productDetails(
       name: "Mountain Bike",
       description: "Durable and perfect for off-road trails.",
       price: "499.99",
       image: "https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?auto=format&fit=crop&w=800&q=60",  
     ),
     productDetails(
       name: "Smart Watch",
       description: "Monitor your health and stay connected.",
       price: "199.99",
       image: "https://luxurywatchbd.com/wp-content/uploads/2021/12/lmaiwescgjgvsdga.jpg",
     ),
     productDetails(
       name: "Backpack",
       description: "A spacious bag ideal for travel and school.",
       price: "69.99",
       image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCp_Jurg24L6sUGwZciGHmC812nuX02djHJQ&s",  
     ),
     productDetails(
       name: "Camera",
       description: "Capture high-quality images anywhere.",
       price: "899.99",
       image: "https://images.unsplash.com/photo-1510127034890-ba27508e9f1c?auto=format&fit=crop&w=800&q=60",  
     ),
     productDetails(
       name: "Running Shoes",
       description: "Comfortable for jogging and workouts.",
       price: "129.99",
       image: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=800&q=60",  
     ),
     productDetails(
       name: "Laptop",
       description: "High-performance laptop for all tasks.",
       price: "1099.99",
       image: "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=800&q=60",  
     ),
     productDetails(
       name: "Headphones",
       description: "Noise-cancelling over-ear headphones.",
       price: "149.99",
       image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=800&q=60",  
     ),
     productDetails(
       name: "Coffee Mug",
       description: "Minimalist design ceramic coffee mug.",
       price: "15.99",
       image: "https://www.webstaurantstore.com/images/products/large/60022/2523216.jpg",  
     ),
     productDetails(
       name: "Smartphone",
       description: "Latest model with advanced features.",
       price: "999.99",
       image: "https://images.unsplash.com/photo-1580910051074-3eb694886505?auto=format&fit=crop&w=800&q=60",  
     ),
     productDetails(
       name: "Wrist Watch",
       description: "Luxury leather wrist watch.",
       price: "349.99",
       image: "https://images.unsplash.com/photo-1524805444758-089113d48a6d?auto=format&fit=crop&w=800&q=60",  
     ),
   ];




   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details Shop",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        backgroundColor: Colors.purple,
      ),

      body: Padding(

        padding: EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
            ),
            itemBuilder: (context,index){
              final productAll = productList[index];
              return GestureDetector(
                onTap: ()=> cusSnk.customSnkbar(context, "${productAll.name}"),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.network(productAll.image,height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,

                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${productAll.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                              SizedBox(height: 5),
                              Text("\$${productAll.price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.red),),
                              SizedBox(height: 5),
                              Text("${productAll.description}",style: TextStyle(fontSize: 12),overflow: TextOverflow.ellipsis,maxLines: 2,),
                              SizedBox(height: 5),
                              ElevatedButton(
                                  onPressed: (){},
                                  child: Text("Add to Cart"),
                                  style:ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    foregroundColor: Colors.white,
                                    minimumSize: Size(double.infinity,25),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  ) ,
                        
                                ),
                        
                        
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ),


              );
              



            }
            ),

      ),

    );
  }
}



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class productDetails{
  String name;
  String description;
  String price;
  String image;
  productDetails({required this.name,required this.description,required this.price,required this.image});

}
