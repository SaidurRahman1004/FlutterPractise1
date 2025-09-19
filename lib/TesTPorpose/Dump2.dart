import 'package:flutter/material.dart';



class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
        cardTheme: CardThemeData(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0; // for sidebar highlight

  // sample summary items
  final List<_SummaryItem> summaryItems = [
    _SummaryItem(title: 'Total Properties', value: '12', icon: Icons.apartment, color: Colors.blue.shade100),
    _SummaryItem(title: 'All Units', value: '12', icon: Icons.grid_view, color: Colors.green.shade100),
    _SummaryItem(title: 'Booked Units', value: '12', icon: Icons.book_online, color: Colors.orange.shade100),
    _SummaryItem(title: 'Occupied Units', value: '12', icon: Icons.home, color: Colors.purple.shade100),
    _SummaryItem(title: 'Vacant Units', value: '3', icon: Icons.meeting_room, color: Colors.teal.shade50),
    _SummaryItem(title: 'Expected Rent', value: '4,35,000', icon: Icons.currency_rupee, color: Colors.blue.shade50),
    _SummaryItem(title: 'Total Rent Due', value: '12', icon: Icons.receipt_long, color: Colors.yellow.shade50),
    _SummaryItem(title: 'Rent Collected', value: '12', icon: Icons.payments, color: Colors.pink.shade50),
  ];

  final List<_QuickAction> quickActions = [
    _QuickAction(label: 'Add New Building', color: Colors.blue, icon: Icons.add_business),
    _QuickAction(label: 'Add New Unit', color: Colors.green, icon: Icons.home_work),
    _QuickAction(label: 'Add New Tenant', color: Colors.orange, icon: Icons.person_add),
    _QuickAction(label: 'Add Expense', color: Colors.purple, icon: Icons.money_off),
    _QuickAction(label: 'Add New Staff', color: Colors.teal, icon: Icons.person),
    _QuickAction(label: 'All Invoices', color: Colors.indigo, icon: Icons.receipt),
  ];

  @override
  Widget build(BuildContext context) {
    final isLarge = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      drawer: isLarge ? null : _buildDrawer(),
      body: SafeArea(
        child: Row(
          children: [
            if (isLarge) _buildSideBar(), // persistent sidebar for large screens
            Expanded(
              child: Column(
                children: [
                  _TopBar(
                    onProfileTap: () {
                      // show profile or settings - demo only
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile tapped')));
                    },
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Dashboard Overview',
                              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          // Portfolio Overview - summary cards in grid
                          LayoutBuilder(builder: (context, constraints) {
                            final crossAxisCount = constraints.maxWidth ~/ 260; // target card width
                            return GridView.builder(
                              itemCount: summaryItems.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount.clamp(1, 4),
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                childAspectRatio: 3.2,
                              ),
                              itemBuilder: (context, index) {
                                return _SummaryCard(item: summaryItems[index]);
                              },
                            );
                          }),
                          const SizedBox(height: 20),
                          // Financial Summary row
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.lightBlue.shade50,
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: const Icon(Icons.show_chart, size: 32, color: Colors.blue),
                                        ),
                                        const SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text('Financial Summary', style: TextStyle(fontWeight: FontWeight.bold)),
                                            SizedBox(height: 6),
                                            Text('Net Profit: 3   Expected Rent (per month) 4,35,000')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  children: [
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.paid, color: Colors.green),
                                            SizedBox(width: 8),
                                            Text('Total Expenses'),
                                            Spacer(),
                                            Text('12')
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.warning_amber_rounded, color: Colors.deepPurple),
                                            SizedBox(width: 8),
                                            Text('Overdue Tenants'),
                                            Spacer(),
                                            Text('12')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Tenant Metrics row
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text('Tenant Metrics', style: TextStyle(fontWeight: FontWeight.bold)),
                                        SizedBox(height: 8),
                                        Text('Paid Tenants: 12'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        SizedBox(height: 2),
                                        Text('Unpaid Tenants: 12'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 18),
                          const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: quickActions.map((q) {
                              return ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(q.icon, size: 18),
                                label: Text(q.label),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: q.color,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 28),

                          // Trending / list sample
                          const Text('Trending Packages', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 320,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              separatorBuilder: (_, __) => const SizedBox(width: 12),
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width: 300,
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 160,
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                            image: DecorationImage(
                                              image: NetworkImage('https://picsum.photos/seed/$index/800/400'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Romantic Paris Getaway', style: const TextStyle(fontWeight: FontWeight.bold)),
                                              const SizedBox(height: 6),
                                              Row(
                                                children: const [
                                                  Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                                                  SizedBox(width: 6),
                                                  Text('4 nights • 5 days', style: TextStyle(color: Colors.grey)),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text('\$799', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                                                  ElevatedButton(onPressed: () {}, child: const Text('Book Now'))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 40),
                          // footer spacer
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideBar() {
    return Container(
      width: 220,
      decoration: const BoxDecoration(
        border: Border(right: BorderSide(color: Color(0xFFE6E9F2))),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: const [
                Icon(Icons.dashboard_customize, color: Colors.green),
                SizedBox(width: 8),
                Text('AHTM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _SidebarItem(icon: Icons.dashboard, label: 'Dashboard', index: 0, selectedIndex: _selectedIndex, onTap: _onSelect),
                _SidebarItem(icon: Icons.apartment, label: 'Properties', index: 1, selectedIndex: _selectedIndex, onTap: _onSelect),
                _SidebarItem(icon: Icons.people, label: 'Tenants', index: 2, selectedIndex: _selectedIndex, onTap: _onSelect),
                _SidebarItem(icon: Icons.receipt_long, label: 'Billing Center', index: 3, selectedIndex: _selectedIndex, onTap: _onSelect),
                _SidebarItem(icon: Icons.money_off, label: 'Expenses', index: 4, selectedIndex: _selectedIndex, onTap: _onSelect),
                _SidebarItem(icon: Icons.account_balance_wallet, label: 'Financial Tracker', index: 5, selectedIndex: _selectedIndex, onTap: _onSelect),
                _SidebarItem(icon: Icons.group, label: 'Staff Management', index: 6, selectedIndex: _selectedIndex, onTap: _onSelect),
                _SidebarItem(icon: Icons.person, label: 'Profile', index: 7, selectedIndex: _selectedIndex, onTap: _onSelect),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(radius: 18, backgroundImage: NetworkImage('https://picsum.photos/seed/me/200')),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Saidur', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Admin', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
            child: Row(
              children: const [
                CircleAvatar(radius: 30, backgroundImage: NetworkImage('https://picsum.photos/seed/me/200')),
                SizedBox(width: 12),
                Text('Saidur Rahman', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(leading: const Icon(Icons.dashboard), title: const Text('Dashboard')),
                ListTile(leading: const Icon(Icons.apartment), title: const Text('Properties')),
                ListTile(leading: const Icon(Icons.people), title: const Text('Tenants')),
                ListTile(leading: const Icon(Icons.receipt_long), title: const Text('Billing Center')),
                ListTile(leading: const Icon(Icons.money_off), title: const Text('Expenses')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// small helper classes & widgets

class _SummaryItem {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  _SummaryItem({required this.title, required this.value, required this.icon, required this.color});
}

class _SummaryCard extends StatelessWidget {
  final _SummaryItem item;
  const _SummaryCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(item.icon, size: 28, color: Colors.blueGrey),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item.title, style: const TextStyle(fontSize: 13, color: Colors.black54)),
                const SizedBox(height: 6),
                Text(item.value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAction {
  final String label;
  final Color color;
  final IconData icon;
  _QuickAction({required this.label, required this.color, required this.icon});
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;
  const _SidebarItem({required this.icon, required this.label, required this.index, required this.selectedIndex, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final selected = index == selectedIndex;
    return ListTile(
      leading: Icon(icon, color: selected ? Theme.of(context).colorScheme.primary : Colors.black54),
      title: Text(label, style: TextStyle(color: selected ? Theme.of(context).colorScheme.primary : Colors.black87)),
      selected: selected,
      onTap: () => onTap(index),
      visualDensity: const VisualDensity(vertical: -1),
    );
  }
}

class _TopBar extends StatelessWidget {
  final VoidCallback onProfileTap;
  const _TopBar({required this.onProfileTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          // left: small breadcrumb / title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Dashboard', style: TextStyle(fontSize: 12, color: Colors.grey)),
                SizedBox(height: 4),
                Text('Dashboard Overview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // right: controls
          Row(
            children: [
              // language toggle mock
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: Colors.blue.shade50),
                child: const Text('EN  |  বাং', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 12),
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onProfileTap,
                child: const CircleAvatar(radius: 18, backgroundImage: NetworkImage('https://picsum.photos/seed/me/200')),
              ),
            ],
          )
        ],
      ),
    );
  }
}


/*

Scaffold
├─ drawer: Drawer (used on small screens)
└─ body: SafeArea
   └─ Row
      ├─ SidebarContainer (width ~220)        <-- কাস্টম _Sidebar widget
      │   ├─ Logo/Title
      │   ├─ ListView
      │   │   ├─ SidebarItem (Dashboard)
      │   │   ├─ SidebarItem (Properties)
      │   │   └─ ...
      │   └─ Profile small footer
      │
      └─ Expanded (main content)
         └─ Column
            ├─ TopBar (search, language toggle, notifications, avatar)   <-- কাস্টম _TopBar
            └─ Expanded
               └─ SingleChildScrollView
                  └─ Column
                     ├─ Heading: "Dashboard Overview"
                     ├─ GridView (summary cards)                       <-- uses _SummaryCard
                     │   ├─ _SummaryCard(item1)
                     │   ├─ _SummaryCard(item2)
                     │   └─ ...
                     ├─ Row
                     │   ├─ FinancialSummaryCard
                     │   └─ SmallStatsColumn (two cards stacked)
                     ├─ Row (Tenant Metrics cards)
                     ├─ "Quick Actions" Text
                     ├─ Wrap (QuickActionButton widgets)               <-- _QuickActionButton
                     ├─ "Trending Packages" label
                     └─ Horizontal ListView (TrendingCard widgets)    <-- _TrendingCard

 */