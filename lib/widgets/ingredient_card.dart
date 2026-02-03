import 'package:flutter/material.dart';
import '../models/ingredient.dart';

class IngredientCard
    extends
        StatelessWidget {
  final Ingredient ingredient;
  final VoidCallback onTap;

  const IngredientCard({
    Key? key,
    required this.ingredient,
    required this.onTap,
  }) : super(
         key:
             key,
       );

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(
      context,
    );
    final isDark =
        theme.brightness ==
        Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(
        bottom:
            12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: [
          BoxShadow(
            color: ingredient.color.withOpacity(
              0.08,
            ),
            blurRadius:
                20,
            offset: const Offset(
              0,
              8,
            ),
            spreadRadius:
                0,
          ),
        ],
      ),
      child: Material(
        color:
            Colors.transparent,
        child: InkWell(
          onTap:
              onTap,
          borderRadius: BorderRadius.circular(
            20,
          ),
          splashColor: ingredient.color.withOpacity(
            0.1,
          ),
          highlightColor: ingredient.color.withOpacity(
            0.05,
          ),
          child: Ink(
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
                          Colors.white,
                          Colors.white.withOpacity(
                            0.95,
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
              border: Border.all(
                color: ingredient.color.withOpacity(
                  0.15,
                ),
                width:
                    1.5,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Row(
                children: [
                  // أيقونة المكون مع تأثير 3D
                  Container(
                    width:
                        72,
                    height:
                        72,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ingredient.color.withOpacity(
                            0.15,
                          ),
                          ingredient.color.withOpacity(
                            0.08,
                          ),
                        ],
                        begin:
                            Alignment.topLeft,
                        end:
                            Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                      border: Border.all(
                        color: ingredient.color.withOpacity(
                          0.2,
                        ),
                        width:
                            2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ingredient.color.withOpacity(
                            0.2,
                          ),
                          blurRadius:
                              12,
                          offset: const Offset(
                            0,
                            4,
                          ),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // دائرة خلفية صغيرة للتأثير
                        Positioned(
                          right:
                              8,
                          top:
                              8,
                          child: Container(
                            width:
                                20,
                            height:
                                20,
                            decoration: BoxDecoration(
                              color: ingredient.color.withOpacity(
                                0.1,
                              ),
                              shape:
                                  BoxShape.circle,
                            ),
                          ),
                        ),
                        // الأيقونة
                        Center(
                          child: Text(
                            ingredient.icon,
                            style: const TextStyle(
                              fontSize:
                                  32,
                              height:
                                  1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    width:
                        16,
                  ),

                  // المحتوى
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        // اسم المكون
                        Text(
                          ingredient.name,
                          style: TextStyle(
                            fontSize:
                                19,
                            fontWeight:
                                FontWeight.w700,
                            color:
                                isDark
                                    ? Colors.white
                                    : const Color(
                                      0xFF1E293B,
                                    ),
                            letterSpacing:
                                -0.5,
                            height:
                                1.2,
                          ),
                          maxLines:
                              1,
                          overflow:
                              TextOverflow.ellipsis,
                        ),

                        const SizedBox(
                          height:
                              12,
                        ),

                        // الفئة والوحدة
                        Row(
                          children: [
                            // الفئة
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      10,
                                  vertical:
                                      6,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      ingredient.color.withOpacity(
                                        0.15,
                                      ),
                                      ingredient.color.withOpacity(
                                        0.08,
                                      ),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  border: Border.all(
                                    color: ingredient.color.withOpacity(
                                      0.2,
                                    ),
                                    width:
                                        1,
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
                                            ingredient.color,
                                        shape:
                                            BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width:
                                          6,
                                    ),
                                    Flexible(
                                      child: Text(
                                        ingredient.category,
                                        style: TextStyle(
                                          fontSize:
                                              12,
                                          fontWeight:
                                              FontWeight.w700,
                                          color:
                                              ingredient.color,
                                          letterSpacing:
                                              -0.2,
                                        ),
                                        maxLines:
                                            1,
                                        overflow:
                                            TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              width:
                                  8,
                            ),

                            // الوحدة
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      10,
                                  vertical:
                                      6,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isDark
                                          ? const Color(
                                            0xFF334155,
                                          )
                                          : const Color(
                                            0xFFF1F5F9,
                                          ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  border: Border.all(
                                    color:
                                        isDark
                                            ? const Color(
                                              0xFF475569,
                                            )
                                            : const Color(
                                              0xFFE2E8F0,
                                            ),
                                    width:
                                        1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize:
                                      MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.scale_outlined,
                                      size:
                                          12,
                                      color:
                                          isDark
                                              ? const Color(
                                                0xFF94A3B8,
                                              )
                                              : const Color(
                                                0xFF64748B,
                                              ),
                                    ),
                                    const SizedBox(
                                      width:
                                          4,
                                    ),
                                    Flexible(
                                      child: Text(
                                        ingredient.unit,
                                        style: TextStyle(
                                          fontSize:
                                              12,
                                          fontWeight:
                                              FontWeight.w600,
                                          color:
                                              isDark
                                                  ? const Color(
                                                    0xFF94A3B8,
                                                  )
                                                  : const Color(
                                                    0xFF64748B,
                                                  ),
                                          letterSpacing:
                                              -0.2,
                                        ),
                                        maxLines:
                                            1,
                                        overflow:
                                            TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height:
                              14,
                        ),

                        // زر تحليل النسب
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal:
                                12,
                            vertical:
                                8,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ingredient.color.withOpacity(
                                  0.1,
                                ),
                                ingredient.color.withOpacity(
                                  0.05,
                                ),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            border: Border.all(
                              color: ingredient.color.withOpacity(
                                0.15,
                              ),
                              width:
                                  1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize:
                                MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.analytics_rounded,
                                size:
                                    16,
                                color:
                                    ingredient.color,
                              ),
                              const SizedBox(
                                width:
                                    6,
                              ),
                              Text(
                                'تحليل النسب',
                                style: TextStyle(
                                  fontSize:
                                      13,
                                  color:
                                      ingredient.color,
                                  fontWeight:
                                      FontWeight.w700,
                                  letterSpacing:
                                      -0.2,
                                ),
                              ),
                              const SizedBox(
                                width:
                                    8,
                              ),
                              Container(
                                width:
                                    20,
                                height:
                                    20,
                                decoration: BoxDecoration(
                                  color: ingredient.color.withOpacity(
                                    0.15,
                                  ),
                                  shape:
                                      BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size:
                                      10,
                                  color:
                                      ingredient.color,
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
          ),
        ),
      ),
    );
  }
}
