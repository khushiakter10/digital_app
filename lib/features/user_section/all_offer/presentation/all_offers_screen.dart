
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/icon_card.dart';
import 'package:digital_app/features/user_section/user_home_section/widget/popular_near_you_card.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:flutter/material.dart';

class AllOffersScreen extends StatefulWidget {
  const AllOffersScreen({super.key});

  @override
  State<AllOffersScreen> createState() => _AllOffersScreenState();
}

class _AllOffersScreenState extends State<AllOffersScreen> {
  bool _showSearchField = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _hideSearchField() {
    if (_showSearchField) {
      setState(() {
        _showSearchField = false;
        _searchController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Hide keyboard
        _hideSearchField(); // Hide text field if visible
      },
      child: Scaffold(
        backgroundColor: AppColors.cFFFFFF,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => NavigationService.goBack(),
                        child: CustomIconCard(icon: AppIcons.backArrowIcon),
                      ),
                       Spacer(),
                      Text(
                        "Offer Details",
                        style: TextFontStyle.titleStyle20w600c182245Manrope.copyWith(fontSize: 19.04),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showSearchField = !_showSearchField;
                          });
                        },
                        child: CustomIconCard(icon: AppIcons.search),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (_showSearchField)
                    TextField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: "Search offers...",
                        prefixIcon: const Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.cFF4800),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.cFF4800, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.cFF4800),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),

                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10), // space between cards
                        child: GestureDetector(
                            onTap: (){
                              NavigationService.navigateTo(Routes.userHomeOfferDetailsScreen);
                            },
                            child: PopularNearYouCard()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),





                  // other widgets below
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
