import 'package:flutter/material.dart';

/*
//Wrap & Chip
Wrap
Scaffold
 ├── AppBar
 ├── Padding
 │    └── Wrap
 │         ├── ChoiceChip (Category 1)
 │         ├── ChoiceChip (Category 2)
 │         ├── ...
 └── BottomNavigationBar (Selected category list)

 🖼 ব্যবহারিক উদাহরণ:
Tags / Hashtags / Filter buttons
Category labels (যেমন E-commerce অ্যাপের প্রোডাক্ট ক্যাটেগরি)
Dynamic size-এর UI যেখানে row/column fix না থাকে

📌 Wrap বনাম Row
| **Row**                             | **Wrap**                                      |
| ----------------------------------- | --------------------------------------------- |
| Child গুলো এক লাইনে রাখতে বাধ্য করে |      Child গুলো এক লাইনে না হলে পরের লাইনে চলে যায় |
| Overflow হলে error দেয়              | Overflow হলে auto wrap হয়                     |
| Flexible layout নয়                  | Flexible layout                               |

Wrap  এটি Row বা Column এর একটি স্মার্ট বিকল্প। Row উইজেট জায়গা শেষ হয়ে গেলে ওভারফ্লো (overflow) এরর দেখায়, কিন্তু Wrap দেখায় না।
গুরুত্বপূর্ণ প্রোপার্টি Wrap:

direction: উইজেটগুলো পাশাপাশি বসবে (Axis.horizontal) নাকি উপর-নিচ (Axis.vertical)। ডিফল্ট Axis.horizontal।
spacing: পাশাপাশি দুটি উইজেটের মধ্যে কতটুকু ফাঁকা থাকবে।
runSpacing: এক লাইন থেকে পরের লাইনের মধ্যে কতটুকু ফাঁকা থাকবে।
children: এখানে তোমার সব ছোট ছোট উইজেটগুলো থাকবে।

Chip উইজেট কী?
Chip হলো একটি ছোট, লেবেলযুক্ত বক্স যা দেখতে অনেকটা ট্যাগের মতো। এটি সাধারণত কোনো তথ্য ফিল্টার করা, কোনো অপশন সিলেক্ট করা বা কোনো অ্যাট্রিবিউট দেখানোর জন্য ব্যবহৃত হয়।যেখানে টেক্সট, আইকন, অ্যাভাটার ইত্যাদি থাকতে পারে।
প্রায়ই Filter, Tags, বা Contact UI তে ব্যবহৃত হয়।

উদাহরণ:
ই-কমার্স অ্যাপে বিভিন্ন ক্যাটাগরি (যেমন: "Electronics", "Fashion", "Books")।
ব্লগ পোস্টে বিভিন্ন ট্যাগ (যেমন: "Flutter", "Dart", "UI")।
ইমেইলে প্রাপকের নাম (Contact Chip)

📌 Chip-এর ধরন

Chip → Basic text + optional avatar
InputChip → Select/delete সহ
ChoiceChip → Selectable options
FilterChip → Multiple selection
ActionChip → Action trigger করার জন্য

গুরুত্বপূর্ণ প্রোপার্টি:

label: চিপের ভেতরে যে লেখাটি দেখা যায় (Text উইজেট)।
avatar: চিপের বাম পাশে একটি ছোট আইকন বা ছবি (CircleAvatar, Icon)।
backgroundColor: চিপের পটভূমি রঙ।
onPressed: চিপে ট্যাপ করলে কী হবে তা নির্ধারণ করে।
onDeleted: চিপের ডান পাশে একটি 'x' আইকন দেখায় এবং এতে ট্যাপ করলে কী হবে তা নির্ধারণ করা যায়।

Wrap + Chip কম্বিনেশন — কেন দরকার?
E-commerce বা Social media অ্যাপে category/tags অনেক থাকে।
Row/Column-এ রাখলে responsive হয় না, কিন্তু Wrap + Chip দিলে auto layout হয়ে যায়।

 */

///Step 6.33: Wrap & Chip — (Tags/Category UI) Practice Task Ans:

class Wrapchip extends StatefulWidget {
  const Wrapchip({super.key});

  @override
  State<Wrapchip> createState() => _WrapchipState();
}

class _WrapchipState extends State<Wrapchip> {
  List<String> categoriesE = [
    "Electronics",
    "Fashion",
    "Home & Living",
    "Sports & Outdoors",
    "Books & Stationery",
    "Toys & Games",
    "Health & Beauty",
    "Groceries",
    "Automotive",
    "Music & Instruments",
  ];
  List<String> selectedCategoriesE = [];

  SnnkB(masg, context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(masg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wrap & Chip Example")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          spacing: 8,
          runSpacing: 4,
          children: categoriesE.map((catgry) {
            final isSelected = selectedCategoriesE.contains(catgry);
            return InkWell(
              onDoubleTap: () => SnnkB("${catgry}", context),
              child: ChoiceChip(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                label: Text(catgry),
                selected: isSelected,
                selectedColor: Colors.blue,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                onSelected: (value) {
                  setState(() {
                    isSelected
                        ? selectedCategoriesE.remove(catgry)
                        : selectedCategoriesE.add(catgry);
                  });
                },
              ),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.yellowAccent[200],
        child: Text(
          "Selecetet Catagories:  ${selectedCategoriesE.join(",")}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//Practice Task 633 Gmini
/*
class ProductFilterScreen1 extends StatefulWidget {
  const ProductFilterScreen1({super.key});

  @override
  State<ProductFilterScreen1> createState() => _ProductFilterScreen1State();
}

class _ProductFilterScreen1State extends State<ProductFilterScreen1> {
  List<String> categoriesN = [
    "Smartphones",
    "Laptops",
    "Monitors",
    "Keyboards",
    "Headphones",
    "Mouse",
    "PowerBank",
  ];

  SnnkB(masg, context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(masg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Filter"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 12,
            runSpacing: 16,
            children: categoriesN.map((item) {
              return Chip(
                label: Text(item),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white),
                onDeleted: () {
                  setState(() {
                    categoriesN.remove(item);
                  });
                  SnnkB("${item} deleted!", context);
                  print("Chip deleted!");
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

 */

//Practice Task 633 GminiExtra
class ProductFilterScreen extends StatefulWidget {
  const ProductFilterScreen({super.key});

  @override
  State<ProductFilterScreen> createState() => _ProductFilterScreenState();
}

class _ProductFilterScreenState extends State<ProductFilterScreen> {
  List<String> categoriesN = [
    "Smartphones",
    "Laptops",
    "Monitors",
    "Keyboards",
    "Headphones",
    "Mouse",
    "PowerBank",
  ];

  SnnkB(masg, context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(masg)));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Product Filter"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 12,
            runSpacing: 16,
            children: List<Widget>.generate(categoriesN.length, (index) {
              final item = categoriesN[index];
              if (index == 0) {
                return Chip(
                  label: Text(categoriesN[index]),
                  backgroundColor: Colors.blue,
                  labelStyle: TextStyle(color: Colors.white),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                );
              } else if (categoriesN[index] == "Keyboards") {
                return Chip(
                  label: Text(categoriesN[index]),
                  avatar: const Icon(Icons.laptop_chromebook),
                  onDeleted: (){
                    setState(() {
                      categoriesN.remove(item);
                    });
                    SnnkB("${item} deleted!", context);
                    print("Chip deleted!");
                  },
                );
              }
              else{
                return Chip(
                  label: Text(categoriesN[index]),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}


///

//Copy Ai Collected
class ChipWrap extends StatelessWidget {
  const ChipWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wrap & Chip Example'),
          backgroundColor: Colors.teal,
        ),
        body: const SkillTagScreen(),
      ),
    );
  }
}

class SkillTagScreen extends StatelessWidget {
  const SkillTagScreen({super.key});

  // আমাদের স্কিলগুলোর একটি লিস্ট
  final List<String> _skills = const [
    'Flutter',
    'Dart',
    'Firebase',
    'UI/UX Design',
    'Provider',
    'BLoC',
    'REST API',
    'Git',
    'Problem Solving',
    'Project Management',
    'Agile',
    'Teamwork',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        // পাশাপাশি চিপগুলোর মধ্যে ফাঁকা জায়গা
        spacing: 8.0,
        // এক লাইন থেকে অন্য লাইনের মধ্যে ফাঁকা জায়গা
        runSpacing: 12.0,
        children: _skills.map((skill) {
          //_skills.map((skill) { ... }).toList() ব্যবহার করে আমরা লিস্টের প্রতিটি আইটেমের জন্য একটি করে Chip উইজেট তৈরি করেছি।
          // 💡 সমাধান: এখানে GestureDetector ব্যবহার করা হয়েছে
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$skill selected!'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            child: Chip(
              // চিপের বাম পাশে আইকন
              avatar: CircleAvatar(
                backgroundColor: Colors.teal.shade700,
                child: const Icon(Icons.code, color: Colors.white, size: 16),
              ),
              // চিপের লেখা
              label: Text(skill),
              // চিপের الخلفية রঙ
              backgroundColor: Colors.teal.shade100,
              // চিপের বর্ডারের রঙ
              shape: StadiumBorder(
                side: BorderSide(color: Colors.teal.shade200),
              ),
              // onPressed প্রোপার্টিটি এখান থেকে সরিয়ে দেওয়া হয়েছে
            ),
          );
        }).toList(), // map() থেকে পাওয়া 결과를 একটি লিস্টে পরিণত করা হয়েছে
      ),
    );
  }
}

////WrapeChip1 Ai Cloude1 Copy
class WrapeChip1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wrap & Chip Tutorial',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: WrapChipDemo(),
    );
  }
}

class WrapChipDemo extends StatefulWidget {
  @override
  _WrapChipDemoState createState() => _WrapChipDemoState();
}

class _WrapChipDemoState extends State<WrapChipDemo> {
  // Example 1: Simple tags
  List<String> tags = [
    'Flutter',
    'Dart',
    'Mobile Dev',
    'UI/UX',
    'Firebase',
    'API',
    'State Management',
    'Animation',
  ];

  // Example 2: Selectable categories
  List<String> categories = [
    'Technology',
    'Sports',
    'Music',
    'Food',
    'Travel',
    'Fashion',
    'Health',
    'Education',
  ];
  Set<String> selectedCategories = {};

  // Example 3: Skills with levels
  Map<String, int> skills = {
    'Flutter': 4,
    'Dart': 5,
    'JavaScript': 3,
    'Python': 2,
    'Firebase': 4,
    'Git': 3,
  };

  // Example 4: Filter chips
  Map<String, bool> filters = {
    'Online': false,
    'Free': false,
    'Certificate': false,
    'Beginner': false,
    'Advanced': false,
  };

  // Example 5: Action chips with icons
  List<Map<String, dynamic>> actions = [
    {'label': 'Share', 'icon': Icons.share},
    {'label': 'Like', 'icon': Icons.favorite_border},
    {'label': 'Comment', 'icon': Icons.comment},
    {'label': 'Save', 'icon': Icons.bookmark_border},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap & Chip Widget Tutorial'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example 1: Basic Wrap with simple Chips
            _buildSection(
              'Example 1: Simple Tags',
              Wrap(
                spacing: 8.0, // horizontal space between chips
                runSpacing: 4.0, // vertical space between lines
                children: tags.map((tag) {
                  return Chip(
                    label: Text(tag),
                    backgroundColor: Colors.blue.shade100,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  );
                }).toList(),
              ),
            ),

            // Example 2: Choice Chips (Selectable)
            _buildSection(
              'Example 2: Selectable Categories',
              Wrap(
                spacing: 8.0,
                children: categories.map((category) {
                  return ChoiceChip(
                    label: Text(category),
                    selected: selectedCategories.contains(category),
                    selectedColor: Colors.green.shade300,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedCategories.add(category);
                        } else {
                          selectedCategories.remove(category);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            if (selectedCategories.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  'Selected: ${selectedCategories.join(', ')}',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),

            // Example 3: Input Chips with delete
            _buildSection(
              'Example 3: Skills with Levels (Deletable)',
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: skills.entries.map((entry) {
                  return InputChip(
                    label: Text(entry.key),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(
                        entry.value.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    onDeleted: () {
                      setState(() {
                        skills.remove(entry.key);
                      });
                    },
                    deleteIconColor: Colors.red,
                  );
                }).toList(),
              ),
            ),

            // Example 4: Filter Chips
            _buildSection(
              'Example 4: Filter Options',
              Wrap(
                spacing: 8.0,
                children: filters.keys.map((filter) {
                  return FilterChip(
                    label: Text(filter),
                    selected: filters[filter]!,
                    checkmarkColor: Colors.white,
                    selectedColor: Colors.purple,
                    onSelected: (selected) {
                      setState(() {
                        filters[filter] = selected;
                      });
                    },
                  );
                }).toList(),
              ),
            ),

            // Example 5: Action Chips
            _buildSection(
              'Example 5: Action Chips with Icons',
              Wrap(
                spacing: 10.0,
                children: actions.map((action) {
                  return ActionChip(
                    avatar: Icon(action['icon'], size: 18),
                    label: Text(action['label']),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${action['label']} clicked!'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            // Example 6: Custom styled chips in Wrap
            _buildSection(
              'Example 6: Custom Styled Chips',
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                alignment: WrapAlignment.center,
                children: [
                  _buildCustomChip('Premium', Colors.amber, Icons.star),
                  _buildCustomChip('Hot', Colors.red, Icons.whatshot),
                  _buildCustomChip('New', Colors.green, Icons.new_releases),
                  _buildCustomChip('Sale', Colors.purple, Icons.local_offer),
                  _buildCustomChip('Limited', Colors.blue, Icons.timer),
                ],
              ),
            ),

            // Example 7: Wrap with different directions
            _buildSection(
              'Example 7: Vertical Wrap Direction',
              Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(10, (index) {
                    return Chip(
                      label: Text('Item ${index + 1}'),
                      backgroundColor: Colors
                          .primaries[index % Colors.primaries.length]
                          .shade100,
                    );
                  }),
                ),
              ),
            ),

            // Example 8: Dynamic tag input
            _buildSection('Example 8: Dynamic Tag Input', DynamicTagInput()),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700,
          ),
        ),
        SizedBox(height: 8),
        content,
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildCustomChip(String label, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [DefaultSelectionStyle.defaultColor]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// Dynamic Tag Input Component
class DynamicTagInput extends StatefulWidget {
  @override
  _DynamicTagInputState createState() => _DynamicTagInputState();
}

class _DynamicTagInputState extends State<DynamicTagInput> {
  final TextEditingController _controller = TextEditingController();
  List<String> _tags = ['Flutter', 'Dart'];

  void _addTag() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tags.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter tag',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                onSubmitted: (_) => _addTag(),
              ),
            ),
            SizedBox(width: 8),
            ElevatedButton(onPressed: _addTag, child: Text('Add')),
          ],
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: _tags.map((tag) {
            return InputChip(
              label: Text(tag),
              onDeleted: () {
                setState(() {
                  _tags.remove(tag);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

// Advanced Example: Product Filter Page
class ProductFilterPage extends StatefulWidget {
  @override
  _ProductFilterPageState createState() => _ProductFilterPageState();
}

class _ProductFilterPageState extends State<ProductFilterPage> {
  // Price ranges
  String? selectedPriceRange;
  List<String> priceRanges = ['৳0-500', '৳500-1000', '৳1000-5000', '৳5000+'];

  // Brands
  Set<String> selectedBrands = {};
  List<String> brands = [
    'Samsung',
    'Apple',
    'Xiaomi',
    'OnePlus',
    'Realme',
    'Oppo',
  ];

  // Features
  Map<String, bool> features = {
    '5G': false,
    'Dual SIM': false,
    'Fast Charging': false,
    'Wireless Charging': false,
    'Water Resistant': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Filters'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedPriceRange = null;
                selectedBrands.clear();
                features.updateAll((key, value) => false);
              });
            },
            child: Text('Clear All', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Price Range
          Text(
            'Price Range',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: priceRanges.map((range) {
              return ChoiceChip(
                label: Text(range),
                selected: selectedPriceRange == range,
                onSelected: (selected) {
                  setState(() {
                    selectedPriceRange = selected ? range : null;
                  });
                },
              );
            }).toList(),
          ),

          SizedBox(height: 20),

          // Brands
          Text(
            'Brands',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: brands.map((brand) {
              return FilterChip(
                label: Text(brand),
                selected: selectedBrands.contains(brand),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedBrands.add(brand);
                    } else {
                      selectedBrands.remove(brand);
                    }
                  });
                },
              );
            }).toList(),
          ),

          SizedBox(height: 20),

          // Features
          Text(
            'Features',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: features.keys.map((feature) {
              return FilterChip(
                label: Text(feature),
                selected: features[feature]!,
                onSelected: (selected) {
                  setState(() {
                    features[feature] = selected;
                  });
                },
              );
            }).toList(),
          ),

          SizedBox(height: 30),

          // Apply Button
          ElevatedButton(
            onPressed: () {
              // Apply filters
              print('Price: $selectedPriceRange');
              print('Brands: $selectedBrands');
              print('Features: $features');
            },
            child: Text('Apply Filters'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
