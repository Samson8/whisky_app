import 'package:flutter/material.dart';
import 'package:whisky_app/core/theme/theme.dart';
import 'package:whisky_app/feature/widgets/details_tab_content.dart';
import 'package:whisky_app/feature/widgets/history_tab_content.dart';
import 'package:whisky_app/feature/widgets/tasting_note_tab_content.dart';

class BottleDetailScreen extends StatefulWidget {
  static const routeName = '/bottle-detail';

  const BottleDetailScreen({super.key});

  @override
  State<BottleDetailScreen> createState() => _BottleDetailScreenState();
}

class _BottleDetailScreenState extends State<BottleDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<String> tabs = ['Details', 'Tasting notes', 'History'];

  double _tabViewHeight = 300;
  bool _showBottleImage = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      // When tab changes, update the height later after build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateTabViewHeight();
      });
    }
  }

  void _updateTabViewHeight() {
    // Find the right key child and measure its height
    final context = _tabKeys[_tabController.index].currentContext;
    if (context != null) {
      final box = context.findRenderObject() as RenderBox;
      setState(() {
        _tabViewHeight = box.size.height;
      });
    }
  }

  final List<GlobalKey> _tabKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Genesis Collection'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_pattern.png"),
            fit: BoxFit.cover,
          ),
          color: AppTheme.backgroundColor,
        ),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Status Indicator
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showBottleImage = !_showBottleImage;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundColor.withOpacity(0.8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/genuine_icon.png',
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Genuine Bottle (Unopened)',
                            style: textTheme.bodyMedium,
                          ),
                          const Spacer(),
                          Icon(
                              _showBottleImage
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: AppTheme.subtleTextColor),
                        ],
                      ),
                    ),
                  ),
                ),
                // Bottle Image
                Visibility(
                  visible: _showBottleImage,
                  child: Container(
                    height: size.height * 0.4,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Image.asset(
                      'assets/images/bottle.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Card with Tabs
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.cardBackgroundColor.withOpacity(0.8),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bottle Title Info
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bottle 135/184'),
                            const SizedBox(height: 4),
                            RichText(
                              text: TextSpan(
                                style: textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 26),
                                children: <TextSpan>[
                                  const TextSpan(text: 'Talisker '),
                                  TextSpan(
                                      text: '18 Year old',
                                      style: TextStyle(
                                          color: AppTheme.primaryColor,
                                          fontWeight: FontWeight.bold)),
                                  const TextSpan(text: '\n#2504'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Tab Bar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppTheme.backgroundColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          margin: const EdgeInsets.only(bottom: 4.0),
                          child: TabBar(
                            controller: _tabController,
                            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            indicator: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            dividerColor: Colors.transparent,
                          ),
                        ),
                      ),

                      // Dynamic height TabView
                      SizedBox(
                        height: _tabViewHeight,
                        child: TabBarView(
                          controller: _tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            // Attach each tab content to a GlobalKey
                            DetailsTabContent(key: _tabKeys[0]),
                            TastingNotesTabContent(key: _tabKeys[1]),
                            HistoryTabContent(key: _tabKeys[2]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Add Button
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add,
                      size: 20,
                      color: AppTheme.backgroundColor,
                    ),
                    label: const Text('Add to my collection'),
                    onPressed: () {
                      print('Add to Collection Tapped');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
