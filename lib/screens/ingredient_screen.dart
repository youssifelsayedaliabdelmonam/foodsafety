import 'package:flutter/material.dart';
import '../models/ingredient.dart';
import '../generated/app_localizations.dart';
import 'result_screen.dart';

class IngredientScreen
    extends
        StatefulWidget {
  final Ingredient ingredient;

  const IngredientScreen({
    Key? key,
    required this.ingredient,
  }) : super(
         key:
             key,
       );

  @override
  State<
    IngredientScreen
  >
  createState() =>
      _IngredientScreenState();
}

class _IngredientScreenState
    extends
        State<
          IngredientScreen
        > {
  final Map<
    String,
    TextEditingController
  >
  _controllers =
      {};
  final Map<
    String,
    FocusNode
  >
  _focusNodes =
      {};

  @override
  void initState() {
    super.initState();
    for (var rule in widget.ingredient.rules) {
      _controllers[rule.type] =
          TextEditingController();
      _focusNodes[rule.type] =
          FocusNode();
    }
  }

  void _validateAndNavigate() {
    final l10n =
        AppLocalizations.of(
          context,
        )!;
    Map<
      String,
      double
    >
    values =
        {};
    bool hasErrors =
        false;

    for (var rule in widget.ingredient.rules) {
      final controller =
          _controllers[rule.type];
      final text =
          controller?.text.trim() ??
          '';

      if (text.isEmpty) {
        hasErrors =
            true;
        _showError(
          l10n.enterValueFor(
            rule.type,
          ),
        );
        _focusNodes[rule.type]?.requestFocus();
        break;
      }

      final value = double.tryParse(
        text,
      );
      if (value ==
          null) {
        hasErrors =
            true;
        _showError(
          l10n.invalidValueFor(
            rule.type,
          ),
        );
        _focusNodes[rule.type]?.requestFocus();
        break;
      }

      values[rule.type] =
          value;
    }

    if (!hasErrors) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (
                context,
              ) => ResultScreen(
                ingredient:
                    widget.ingredient,
                enteredValues:
                    values,
              ),
        ),
      );
    }
  }

  void _showError(
    String message,
  ) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: Color(
          0xFFDC2626,
        ),
        behavior:
            SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        margin: EdgeInsets.all(
          20,
        ),
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final l10n =
        AppLocalizations.of(
          context,
        )!;

    return Scaffold(
      backgroundColor: Color(
        0xFFF8FAFC,
      ),
      appBar: AppBar(
        title: Text(
          widget.ingredient.name,
        ),
      ),
      body: Column(
        children: [
          Container(
            width:
                double.infinity,
            padding: EdgeInsets.all(
              24,
            ),
            decoration: BoxDecoration(
              color:
                  Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Color(
                    0xFFF1F5F9,
                  ),
                  width:
                      1,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Container(
                      width:
                          72,
                      height:
                          72,
                      decoration: BoxDecoration(
                        color: widget.ingredient.color.withOpacity(
                          0.1,
                        ),
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        border: Border.all(
                          color: widget.ingredient.color.withOpacity(
                            0.3,
                          ),
                          width:
                              1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.ingredient.icon,
                          style: TextStyle(
                            fontSize:
                                32,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width:
                          20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.ingredient.name,
                            style: TextStyle(
                              fontSize:
                                  20,
                              fontWeight:
                                  FontWeight.w700,
                              color: Color(
                                0xFF1E293B,
                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                                12,
                          ),
                          Wrap(
                            spacing:
                                12,
                            runSpacing:
                                12,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      14,
                                  vertical:
                                      6,
                                ),
                                decoration: BoxDecoration(
                                  color: widget.ingredient.color.withOpacity(
                                    0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                child: Text(
                                  widget.ingredient.category,
                                  style: TextStyle(
                                    fontSize:
                                        13,
                                    color:
                                        widget.ingredient.color,
                                    fontWeight:
                                        FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      14,
                                  vertical:
                                      6,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(
                                    0xFFF1F5F9,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                child: Text(
                                  widget.ingredient.unit,
                                  style: TextStyle(
                                    fontSize:
                                        13,
                                    color: Color(
                                      0xFF64748B,
                                    ),
                                    fontWeight:
                                        FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
                      0xFFF0F9FF,
                    ),
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                    border: Border.all(
                      color: Color(
                        0xFFBAE6FD,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Color(
                          0xFF0EA5E9,
                        ),
                        size:
                            22,
                      ),
                      SizedBox(
                        width:
                            16,
                      ),
                      Expanded(
                        child: Text(
                          l10n.enterNutritionalValues,
                          style: TextStyle(
                            fontSize:
                                15,
                            color: Color(
                              0xFF0369A1,
                            ),
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(
                24,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.nutritionalValues,
                    style: TextStyle(
                      fontSize:
                          20,
                      fontWeight:
                          FontWeight.w700,
                      color: Color(
                        0xFF1E293B,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                        6,
                  ),
                  Text(
                    l10n.enterMeasuredValues,
                    style: TextStyle(
                      fontSize:
                          15,
                      color: Color(
                        0xFF64748B,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                        28,
                  ),

                  ...widget.ingredient.rules.map(
                    (
                      rule,
                    ) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom:
                              24,
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
                                      0xFF334155,
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
                                    color: Color(
                                      0xFFF1F5F9,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                  ),
                                  child: Text(
                                    rule.unit,
                                    style: TextStyle(
                                      fontSize:
                                          13,
                                      color: Color(
                                        0xFF64748B,
                                      ),
                                      fontWeight:
                                          FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  12,
                            ),
                            TextField(
                              controller:
                                  _controllers[rule.type],
                              focusNode:
                                  _focusNodes[rule.type],
                              keyboardType: TextInputType.numberWithOptions(
                                decimal:
                                    true,
                                signed:
                                    false,
                              ),
                              decoration: InputDecoration(
                                hintText:
                                    l10n.enterValue,
                                prefixIcon: Icon(
                                  Icons.edit,
                                  color: Color(
                                    0xFF94A3B8,
                                  ),
                                  size:
                                      22,
                                ),
                                suffixText:
                                    rule.unit
                                        .split(
                                          '/',
                                        )
                                        .first,
                                suffixStyle: TextStyle(
                                  color: Color(
                                    0xFF64748B,
                                  ),
                                  fontWeight:
                                      FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  12,
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
                                border: Border.all(
                                  color: Color(
                                    0xFFE2E8F0,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.bar_chart,
                                    size:
                                        18,
                                    color: Color(
                                      0xFF64748B,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        12,
                                  ),
                                  Expanded(
                                    child: Text(
                                      l10n.healthyRange(
                                        rule.minValue.toString(),
                                        rule.maxValue.toString(),
                                        rule.unit,
                                      ),
                                      style: TextStyle(
                                        fontSize:
                                            14,
                                        color: Color(
                                          0xFF475569,
                                        ),
                                        fontWeight:
                                            FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),

                  SizedBox(
                    height:
                        40,
                  ),

                  Column(
                    children: [
                      SizedBox(
                        width:
                            double.infinity,
                        height:
                            52,
                        child: ElevatedButton(
                          onPressed:
                              _validateAndNavigate,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                widget.ingredient.color,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.analytics_outlined,
                                size:
                                    22,
                              ),
                              SizedBox(
                                width:
                                    12,
                              ),
                              Text(
                                l10n.analyzeRatios,
                                style: TextStyle(
                                  fontSize:
                                      16,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height:
                            20,
                      ),
                      SizedBox(
                        width:
                            double.infinity,
                        height:
                            48,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(
                              () {
                                for (var controller in _controllers.values) {
                                  controller.clear();
                                }
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Color(
                                0xFFE2E8F0,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                            ),
                          ),
                          child: Text(
                            l10n.reset,
                            style: TextStyle(
                              fontSize:
                                  15,
                              color: Color(
                                0xFF64748B,
                              ),
                              fontWeight:
                                  FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes.values) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
