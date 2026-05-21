import 'package:flutter/material.dart';
import '../models/ingredient.dart';
import '../widgets/result_card.dart';
import '../generated/app_localizations.dart';

class ResultScreen
    extends
        StatelessWidget {
  final Ingredient ingredient;
  final Map<
    String,
    double
  >
  enteredValues;

  const ResultScreen({
    Key? key,
    required this.ingredient,
    required this.enteredValues,
  }) : super(
         key:
             key,
       );

  bool _isValueValid(
    NutritionRule rule,
    double value,
  ) {
    return value >=
            rule.minValue &&
        value <=
            rule.maxValue;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final l10n =
        AppLocalizations.of(
          context,
        )!;

    int validCount =
        0;
    List<
      Map<
        String,
        dynamic
      >
    >
    results =
        [];

    for (var rule in ingredient.rules) {
      final value =
          enteredValues[rule.type] ??
          0;
      final isValid = _isValueValid(
        rule,
        value,
      );
      if (isValid) validCount++;
      results.add(
        {
          'rule':
              rule,
          'value':
              value,
          'isValid':
              isValid,
        },
      );
    }

    double healthPercentage =
        (validCount /
            ingredient.rules.length) *
        100;
    Color healthColor =
        healthPercentage >=
                80
            ? Color(
              0xFF10B981,
            )
            : healthPercentage >=
                50
            ? Color(
              0xFFF59E0B,
            )
            : Color(
              0xFFEF4444,
            );

    String healthStatus =
        healthPercentage >=
                80
            ? l10n.healthyStatus
            : healthPercentage >=
                50
            ? l10n.acceptableStatus
            : l10n.unhealthyStatus;

    String healthMessage =
        healthPercentage >=
                80
            ? l10n.healthyMessage
            : healthPercentage >=
                50
            ? l10n.acceptableMessage
            : l10n.unhealthyMessage;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.checkResults,
          style: TextStyle(
            fontSize:
                17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          20,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(
                30,
              ),
              decoration: BoxDecoration(
                color:
                    Colors.white,
                borderRadius: BorderRadius.circular(
                  24,
                ),
                border: Border.all(
                  color: Color(
                    0xFFF1F5F9,
                  ),
                  width:
                      1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                      0.05,
                    ),
                    blurRadius:
                        40,
                    offset: Offset(
                      0,
                      20,
                    ),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    alignment:
                        Alignment.center,
                    children: [
                      Container(
                        width:
                            140,
                        height:
                            140,
                        decoration: BoxDecoration(
                          shape:
                              BoxShape.circle,
                          border: Border.all(
                            color: healthColor.withOpacity(
                              0.2,
                            ),
                            width:
                                8,
                          ),
                        ),
                      ),
                      Container(
                        width:
                            120,
                        height:
                            120,
                        decoration: BoxDecoration(
                          shape:
                              BoxShape.circle,
                          color: healthColor.withOpacity(
                            0.1,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Text(
                                '${healthPercentage.toStringAsFixed(0)}%',
                                style: TextStyle(
                                  fontSize:
                                      36,
                                  fontWeight:
                                      FontWeight.w800,
                                  color:
                                      healthColor,
                                  height:
                                      1,
                                ),
                              ),
                              SizedBox(
                                height:
                                    4,
                              ),
                              Text(
                                l10n.healthRatio,
                                style: TextStyle(
                                  fontSize:
                                      13,
                                  color: Color(
                                    0xFF64748B,
                                  ),
                                  fontWeight:
                                      FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                        24,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          20,
                      vertical:
                          10,
                    ),
                    decoration: BoxDecoration(
                      color: healthColor.withOpacity(
                        0.1,
                      ),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Row(
                      mainAxisSize:
                          MainAxisSize.min,
                      children: [
                        Icon(
                          healthPercentage >=
                                  80
                              ? Icons.check_circle
                              : healthPercentage >=
                                  50
                              ? Icons.warning
                              : Icons.error,
                          color:
                              healthColor,
                          size:
                              18,
                        ),
                        SizedBox(
                          width:
                              8,
                        ),
                        Text(
                          healthStatus,
                          style: TextStyle(
                            fontSize:
                                16,
                            fontWeight:
                                FontWeight.w600,
                            color:
                                healthColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:
                        16,
                  ),
                  Text(
                    healthMessage,
                    textAlign:
                        TextAlign.center,
                    style: TextStyle(
                      fontSize:
                          15,
                      color: Color(
                        0xFF475569,
                      ),
                      height:
                          1.6,
                    ),
                  ),
                  SizedBox(
                    height:
                        24,
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      20,
                    ),
                    decoration: BoxDecoration(
                      color: Color(
                        0xFFF8FAFC,
                      ),
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem(
                          validCount.toString(),
                          l10n.healthyStat,
                          Color(
                            0xFF10B981,
                          ),
                        ),
                        Container(
                          width:
                              1,
                          height:
                              30,
                          color: Color(
                            0xFFE2E8F0,
                          ),
                        ),
                        _buildStatItem(
                          (ingredient.rules.length -
                                  validCount)
                              .toString(),
                          l10n.unhealthyStat,
                          Color(
                            0xFFEF4444,
                          ),
                        ),
                        Container(
                          width:
                              1,
                          height:
                              30,
                          color: Color(
                            0xFFE2E8F0,
                          ),
                        ),
                        _buildStatItem(
                          ingredient.rules.length.toString(),
                          l10n.totalStat,
                          Color(
                            0xFF64748B,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height:
                  32,
            ),

            Row(
              children: [
                Container(
                  width:
                      4,
                  height:
                      20,
                  decoration: BoxDecoration(
                    color: Color(
                      0xFF2563EB,
                    ),
                    borderRadius: BorderRadius.circular(
                      2,
                    ),
                  ),
                ),
                SizedBox(
                  width:
                      12,
                ),
                Text(
                  l10n.resultDetails,
                  style: TextStyle(
                    fontSize:
                        18,
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
                  8,
            ),
            Text(
              l10n.resultSubtitle,
              style: TextStyle(
                fontSize:
                    14,
                color: Color(
                  0xFF64748B,
                ),
              ),
            ),
            SizedBox(
              height:
                  20,
            ),

            Column(
              children:
                  results.map(
                    (
                      result,
                    ) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom:
                              12,
                        ),
                        child: ResultCard(
                          rule:
                              result['rule']
                                  as NutritionRule,
                          enteredValue:
                              result['value']
                                  as double,
                          isValid:
                              result['isValid']
                                  as bool,
                          color:
                              ingredient.color,
                        ),
                      );
                    },
                  ).toList(),
            ),

            SizedBox(
              height:
                  40,
            ),

            SizedBox(
              width:
                  double.infinity,
              height:
                  56,
              child: ElevatedButton(
                onPressed:
                    () => Navigator.pop(
                      context,
                    ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white,
                  foregroundColor: Color(
                    0xFF2563EB,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      14,
                    ),
                    side: BorderSide(
                      color: Color(
                        0xFF2563EB,
                      ),
                      width:
                          2,
                    ),
                  ),
                  elevation:
                      0,
                ),
                child: Text(
                  l10n.checkAnotherIngredient,
                  style: TextStyle(
                    fontSize:
                        16,
                    fontWeight:
                        FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(
              height:
                  20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    String value,
    String label,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize:
                24,
            fontWeight:
                FontWeight.w700,
            color:
                color,
          ),
        ),
        SizedBox(
          height:
              4,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize:
                13,
            color: Color(
              0xFF64748B,
            ),
          ),
        ),
      ],
    );
  }
}
