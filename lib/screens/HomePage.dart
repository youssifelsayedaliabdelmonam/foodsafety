import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ingredient.dart';
import '../data/ingredients_data.dart';
import '../widgets/ingredient_card.dart';
import '../widgets/themes_toggel.dart';
import '../providers/themes_provider.dart';
import 'ingredient_screen.dart';

class HomeScreen
    extends
        StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(
         key:
             key,
       );

  @override
  State<
    HomeScreen
  >
  createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends
        State<
          HomeScreen
        > {
  String _selectedCategory =
      'الكل';
  final List<
    String
  >
  _categories = [
    'الكل',
    'الألبان',
    'اللحوم',
    'الخضروات',
    'الفواكه',
    'المشروبات',
    'الحبوب',
  ];

  List<
    Ingredient
  >
  _getFilteredIngredients() {
    if (_selectedCategory ==
        'الكل') {
      return IngredientsData.ingredients;
    }
    return IngredientsData.ingredients
        .where(
          (
            ingredient,
          ) =>
              ingredient.category ==
              _selectedCategory,
        )
        .toList();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final filteredIngredients =
        _getFilteredIngredients();
    final screenWidth =
        MediaQuery.of(
          context,
        ).size.width;
    final screenHeight =
        MediaQuery.of(
          context,
        ).size.height;

    final theme = Theme.of(
      context,
    );
    final isDark =
        theme.brightness ==
        Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight:
                screenHeight *
                0.12,
            floating:
                false,
            pinned:
                true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle:
                  true,
              title: Row(
                mainAxisSize:
                    MainAxisSize.min,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Container(
                    width:
                        28,
                    height:
                        28,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.primary.withOpacity(
                            0.8,
                          ),
                        ],
                        begin:
                            Alignment.topLeft,
                        end:
                            Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withOpacity(
                            0.3,
                          ),
                          blurRadius:
                              6,
                          offset: const Offset(
                            0,
                            2,
                          ),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.health_and_safety,
                      color:
                          Colors.white,
                      size:
                          16,
                    ),
                  ),
                  const SizedBox(
                    width:
                        8,
                  ),
                  Flexible(
                    child: Text(
                      'Nutrition Check',
                      style:
                          theme.appBarTheme.titleTextStyle,
                      overflow:
                          TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                        isDark
                            ? [
                              const Color(
                                0xFF1E293B,
                              ),
                              const Color(
                                0xFF0F172A,
                              ),
                            ]
                            : [
                              const Color.fromARGB(
                                255,
                                32,
                                220,
                                170,
                              ),
                              const Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ),
                            ],
                    begin:
                        Alignment.topCenter,
                    end:
                        Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            actions: [
              const ThemeToggleButton(),
              const SizedBox(
                width:
                    8,
              ),
            ],
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height:
                      12,
                ),

                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth *
                        0.05,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.primary,
                        theme.colorScheme.primary.withOpacity(
                          0.8,
                        ),
                      ],
                      begin:
                          Alignment.topLeft,
                      end:
                          Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withOpacity(
                          0.3,
                        ),
                        blurRadius:
                            15,
                        offset: const Offset(
                          0,
                          8,
                        ),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right:
                            -15,
                        top:
                            -15,
                        child: Container(
                          width:
                              70,
                          height:
                              70,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                              0.1,
                            ),
                            shape:
                                BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        left:
                            -20,
                        bottom:
                            -20,
                        child: Container(
                          width:
                              80,
                          height:
                              80,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                              0.05,
                            ),
                            shape:
                                BoxShape.circle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          16,
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          mainAxisSize:
                              MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width:
                                      44,
                                  height:
                                      44,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(
                                      0.2,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(
                                        0.3,
                                      ),
                                      width:
                                          1.5,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.analytics_outlined,
                                    color: Color.fromARGB(
                                      255,
                                      8,
                                      157,
                                      97,
                                    ),
                                    size:
                                        22,
                                  ),
                                ),
                                const SizedBox(
                                  width:
                                      12,
                                ),
                                const Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize:
                                        MainAxisSize.min,
                                    children: [
                                      Text(
                                        'مرحباً بك 👋',
                                        style: TextStyle(
                                          fontSize:
                                              18,
                                          fontWeight:
                                              FontWeight.w700,
                                          color:
                                              Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            2,
                                      ),
                                      Text(
                                        'افحص سلامة المكونات الغذائية بسهولة',
                                        style: TextStyle(
                                          fontSize:
                                              12,
                                          color:
                                              Colors.white70,
                                          fontWeight:
                                              FontWeight.w400,
                                        ),
                                        maxLines:
                                            2,
                                        overflow:
                                            TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height:
                                  14,
                            ),
                            Container(
                              padding: const EdgeInsets.all(
                                12,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ).withOpacity(
                                  0.15,
                                ),
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                                border: Border.all(
                                  color: Colors.white.withOpacity(
                                    0.2,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(
                                      6,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        6,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.lightbulb_outline,
                                      color:
                                          theme.colorScheme.primary,
                                      size:
                                          16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width:
                                        10,
                                  ),
                                  const Flexible(
                                    child: Text(
                                      'اختر مكوناً وأدخل القيم للحصول على تحليل مفصل',
                                      style: TextStyle(
                                        fontSize:
                                            11,
                                        color:
                                            Colors.white,
                                        fontWeight:
                                            FontWeight.w500,
                                        height:
                                            1.3,
                                      ),
                                      maxLines:
                                          2,
                                      overflow:
                                          TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height:
                      24,
                ),

                // Categories Section Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth *
                        0.05,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'التصنيفات',
                          style:
                              theme.textTheme.headlineLarge,
                          overflow:
                              TextOverflow.ellipsis,
                          maxLines:
                              1,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal:
                              10,
                          vertical:
                              5,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(
                            0.1,
                          ),
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min,
                          children: [
                            Container(
                              width:
                                  5,
                              height:
                                  5,
                              decoration: BoxDecoration(
                                color:
                                    theme.colorScheme.primary,
                                shape:
                                    BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              width:
                                  4,
                            ),
                            Text(
                              '${_categories.length} فئات',
                              style: const TextStyle(
                                fontSize:
                                    11,
                                fontWeight:
                                    FontWeight.w600,
                                color: Color.fromARGB(
                                  255,
                                  2,
                                  151,
                                  106,
                                ), // تم استبدال theme.colorScheme.primary إذا لزم
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height:
                      12,
                ),

                // Categories List (بدون تغيير)
                SizedBox(
                  height:
                      42,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          screenWidth *
                          0.05,
                    ),
                    scrollDirection:
                        Axis.horizontal,
                    itemCount:
                        _categories.length,
                    separatorBuilder:
                        (
                          context,
                          index,
                        ) => const SizedBox(
                          width:
                              8,
                        ),
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      final category =
                          _categories[index];
                      final isSelected =
                          _selectedCategory ==
                          category;
                      return GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              _selectedCategory =
                                  category;
                            },
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(
                            milliseconds:
                                200,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal:
                                16,
                            vertical:
                                10,
                          ),
                          decoration: BoxDecoration(
                            gradient:
                                isSelected
                                    ? LinearGradient(
                                      colors: [
                                        theme.colorScheme.primary,
                                        theme.colorScheme.primary.withOpacity(
                                          0.8,
                                        ),
                                      ],
                                      begin:
                                          Alignment.topLeft,
                                      end:
                                          Alignment.bottomRight,
                                    )
                                    : null,
                            color:
                                isSelected
                                    ? null
                                    : theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.outline,
                              width:
                                  isSelected
                                      ? 0
                                      : 1.5,
                            ),
                            boxShadow:
                                isSelected
                                    ? [
                                      BoxShadow(
                                        color: theme.colorScheme.primary.withOpacity(
                                          0.3,
                                        ),
                                        blurRadius:
                                            8,
                                        offset: const Offset(
                                          0,
                                          3,
                                        ),
                                      ),
                                    ]
                                    : null,
                          ),
                          child: Row(
                            mainAxisSize:
                                MainAxisSize.min,
                            children: [
                              if (isSelected)
                                Container(
                                  margin: const EdgeInsets.only(
                                    right:
                                        5,
                                  ),
                                  width:
                                      5,
                                  height:
                                      5,
                                  decoration: const BoxDecoration(
                                    color:
                                        Colors.white,
                                    shape:
                                        BoxShape.circle,
                                  ),
                                ),
                              Text(
                                category,
                                style: TextStyle(
                                  fontSize:
                                      13,
                                  fontWeight:
                                      isSelected
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : theme.textTheme.bodyMedium?.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(
                  height:
                      24,
                ),

                // Ingredients Section Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth *
                        0.05,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'المكونات الغذائية',
                          style:
                              theme.textTheme.headlineLarge,
                          overflow:
                              TextOverflow.ellipsis,
                          maxLines:
                              1,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal:
                              10,
                          vertical:
                              5,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(
                            0.1,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          border: Border.all(
                            color: theme.colorScheme.primary.withOpacity(
                              0.2,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.folder_outlined,
                              size:
                                  13,
                              color:
                                  theme.colorScheme.primary,
                            ),
                            const SizedBox(
                              width:
                                  4,
                            ),
                            Text(
                              '${filteredIngredients.length} عنصر',
                              style: const TextStyle(
                                fontSize:
                                    11,
                                fontWeight:
                                    FontWeight.w700,
                                color: Color.fromARGB(
                                  255,
                                  0,
                                  150,
                                  115,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height:
                      16,
                ),

                // Ingredients List or Empty State
                if (filteredIngredients.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          screenWidth *
                          0.05,
                    ),
                    child: Column(
                      children:
                          filteredIngredients.map(
                            (
                              ingredient,
                            ) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  bottom:
                                      12,
                                ),
                                child: IngredientCard(
                                  ingredient:
                                      ingredient,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (
                                              context,
                                            ) => IngredientScreen(
                                              ingredient:
                                                  ingredient,
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ).toList(),
                    ),
                  )
                else
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal:
                          screenWidth *
                          0.05,
                    ),
                    padding: const EdgeInsets.all(
                      32,
                    ),
                    decoration: BoxDecoration(
                      color:
                          theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      border: Border.all(
                        color:
                            theme.colorScheme.outline,
                        width:
                            2,
                      ),
                    ),
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min,
                      children: [
                        Container(
                          width:
                              60,
                          height:
                              60,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.outline.withOpacity(
                              0.3,
                            ),
                            shape:
                                BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.inbox_outlined,
                            size:
                                30,
                            color:
                                theme.iconTheme.color,
                          ),
                        ),
                        const SizedBox(
                          height:
                              16,
                        ),
                        Text(
                          'لا توجد مكونات في هذا التصنيف',
                          style:
                              theme.textTheme.bodyLarge,
                          textAlign:
                              TextAlign.center,
                        ),
                        const SizedBox(
                          height:
                              6,
                        ),
                        Text(
                          'جرب تصنيفاً آخر للعثور على المزيد',
                          style:
                              theme.textTheme.bodyMedium,
                          textAlign:
                              TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                const SizedBox(
                  height:
                      80,
                ),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16,
          ),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(
                0.4,
              ),
              blurRadius:
                  15,
              offset: const Offset(
                0,
                6,
              ),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed:
              () {},
          icon: const Icon(
            Icons.add,
            size:
                20,
          ),
          label: const Text(
            'إضافة مكون',
            style: TextStyle(
              fontSize:
                  13,
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
