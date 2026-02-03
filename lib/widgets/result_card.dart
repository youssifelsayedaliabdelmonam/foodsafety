import 'package:flutter/material.dart';
import '../models/ingredient.dart';

class ResultCard
    extends
        StatelessWidget {
  final NutritionRule rule;
  final double enteredValue;
  final bool isValid;
  final Color color;

  const ResultCard({
    Key? key,
    required this.rule,
    required this.enteredValue,
    required this.isValid,
    required this.color,
  }) : super(
         key:
             key,
       );

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(
        color:
            Colors.white,
        borderRadius: BorderRadius.circular(
          16,
        ),
        border: Border.all(
          color:
              isValid
                  ? Color(
                    0xFFD1FAE5,
                  )
                  : Color(
                    0xFFFEE2E2,
                  ),
          width:
              1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.03,
            ),
            blurRadius:
                20,
            offset: Offset(
              0,
              8,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rule.type,
                style: TextStyle(
                  fontSize:
                      16,
                  fontWeight:
                      FontWeight.w600,
                  color: Color(
                    0xFF1E293B,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      12,
                  vertical:
                      6,
                ),
                decoration: BoxDecoration(
                  color:
                      isValid
                          ? Color(
                            0xFF10B981,
                          ).withOpacity(
                            0.1,
                          )
                          : Color(
                            0xFFEF4444,
                          ).withOpacity(
                            0.1,
                          ),
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      isValid
                          ? Icons.check
                          : Icons.close,
                      size:
                          14,
                      color:
                          isValid
                              ? Color(
                                0xFF10B981,
                              )
                              : Color(
                                0xFFEF4444,
                              ),
                    ),
                    SizedBox(
                      width:
                          6,
                    ),
                    Text(
                      isValid
                          ? 'صحي'
                          : 'غير صحي',
                      style: TextStyle(
                        fontSize:
                            13,
                        fontWeight:
                            FontWeight.w600,
                        color:
                            isValid
                                ? Color(
                                  0xFF10B981,
                                )
                                : Color(
                                  0xFFEF4444,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(
            height:
                16,
          ),

          Container(
            padding: EdgeInsets.all(
              16,
            ),
            decoration: BoxDecoration(
              color: Color(
                0xFFF8FAFC,
              ),
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'القيمة المدخلة',
                      style: TextStyle(
                        fontSize:
                            13,
                        color: Color(
                          0xFF64748B,
                        ),
                      ),
                    ),
                    Text(
                      '${enteredValue.toStringAsFixed(2)} ${rule.unit}',
                      style: TextStyle(
                        fontSize:
                            16,
                        fontWeight:
                            FontWeight.w600,
                        color: Color(
                          0xFF1E293B,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height:
                      12,
                ),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المدى المسموح',
                      style: TextStyle(
                        fontSize:
                            13,
                        color: Color(
                          0xFF64748B,
                        ),
                      ),
                    ),
                    Text(
                      '${rule.minValue} - ${rule.maxValue} ${rule.unit}',
                      style: TextStyle(
                        fontSize:
                            14,
                        fontWeight:
                            FontWeight.w600,
                        color:
                            isValid
                                ? Color(
                                  0xFF10B981,
                                )
                                : Color(
                                  0xFFEF4444,
                                ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height:
                16,
          ),

          Container(
            padding: EdgeInsets.all(
              16,
            ),
            decoration: BoxDecoration(
              color:
                  isValid
                      ? Color(
                        0xFFF0FDF4,
                      )
                      : Color(
                        0xFFFEF2F2,
                      ),
              borderRadius: BorderRadius.circular(
                12,
              ),
              border: Border.all(
                color:
                    isValid
                        ? Color(
                          0xFFBBF7D0,
                        )
                        : Color(
                          0xFFFECACA,
                        ),
              ),
            ),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Icon(
                  isValid
                      ? Icons.thumb_up
                      : Icons.info_outline,
                  size:
                      18,
                  color:
                      isValid
                          ? Color(
                            0xFF10B981,
                          )
                          : Color(
                            0xFFEF4444,
                          ),
                ),
                SizedBox(
                  width:
                      12,
                ),
                Expanded(
                  child: Text(
                    rule.recommendation,
                    style: TextStyle(
                      fontSize:
                          13,
                      color:
                          isValid
                              ? Color(
                                0xFF065F46,
                              )
                              : Color(
                                0xFF991B1B,
                              ),
                      height:
                          1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
