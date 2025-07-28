
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/common_widgets/custom_textfeild.dart';
import 'package:digital_app/features/merchant/merchant_auth/merchant_information_screen/widget/day_card.dart';
import 'package:digital_app/features/user_section/user_home_section/presentation/diraction_screen.dart';
import 'package:digital_app/helpers/all_routes.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';




class MerchantEditStorInformationScreen extends StatefulWidget {
  final Function(bool) onChanged;

  const MerchantEditStorInformationScreen({super.key, required this.onChanged});

  @override
  State<MerchantEditStorInformationScreen> createState() => _MerchantEditStorInformationScreenState();
}

class _MerchantEditStorInformationScreenState extends State<MerchantEditStorInformationScreen> {
  //---------------------------- textfield ---------------------------------//
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController businessCategoryController = TextEditingController();
  final TextEditingController storeAddressController = TextEditingController();

  bool _isChecked = false;
  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSwitched = false;
  bool _showDropdown = false;
  final List<String> _items = ['1', '2', '3', '4', '5'];
  bool _isLoading = false;

  dynamic destinationLat = 23.8103;
  dynamic destinationLng = 90.4125;
  String selectedCategory = "";
  final List<CategoryItem> categories = [
    CategoryItem(name: "Save to favorites", icon: AppIcons.loveIconActive),
    CategoryItem(name: "Share offer", icon: AppIcons.share),
    CategoryItem(name: "Report", icon: AppIcons.report),
  ];

  String? _validateUserName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    final RegExp nameRegExp = RegExp(r'^[A-Za-z]+(?: [A-Za-z]+)*\$');
    if (!nameRegExp.hasMatch(value.trim())) {
      return "Only letters and single spaces allowed";
    }
    if (value.trim().length < 2) {
      return "Name must be at least 2 characters";
    }
    return null;
  }

  @override
  void dispose() {
    storeNameController.dispose();
    businessCategoryController.dispose();
    storeAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppbarProfile(
        title: "Edit store information",
        iconPath: AppIcons.backArrowIcon,
        onIconTap: () => NavigationService.goBack(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
              children: [
                UIHelper.verticalSpace(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Store Name", style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
                  ],
                ),
                UIHelper.verticalSpace(8.h),
                CustomTextfield(
                  borderRadius: 8.r,
                  borderColor: AppColors.cE8E8E8,
                  fillColor: AppColors.white,
                  controller: storeNameController,
                  hintText: "Sahah jahan store",
                  hintTextSyle: TextFontStyle.titleStyle14w500c181818Manrope,
                  validator: _validateUserName,
                ),

                UIHelper.verticalSpace(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Business Category", style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
                  ],
                ),
                UIHelper.verticalSpace(8.h),

//---------------------------- TextForm filed -------------------------------//


                CustomTextfield(
                  borderRadius: 8.r,
                  isRead: true,
                  controller: businessCategoryController,
                  suffixIcon: GestureDetector(
                    onTap: () => setState(() => _showDropdown = !_showDropdown),
                    child: Transform.scale(
                      scale: 0.30,
                      child: SvgPicture.asset(AppIcons.dropDownArrow, height: 12.h),
                    ),
                  ),
                  fillColor: AppColors.cFFFFFF,
                  borderColor: _showDropdown ? AppColors.primary : AppColors.cE8E8E8, // 🔥 change here
                  hintText: 'Restaurant',
                  hintTextSyle: TextFontStyle.titleStyle14w500c181818Manrope,
                ),
                if (_showDropdown)
                  Container(
                    width: 125.w,
                    margin: EdgeInsets.only(top: 2.h, left: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.cFFFFFF,
                      border: Border.all(color: AppColors.primary), // Optional: highlight dropdown too
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Column(
                      children: _items.map((item) => InkWell(
                        onTap: () => setState(() {
                          businessCategoryController.text = item;
                          _showDropdown = false;
                        }),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(item, style: TextStyle(fontSize: 10.sp)),
                          ),
                        ),
                      )).toList(),
                    ),
                  ),

//------------------------ Done ------------------------------//
                UIHelper.verticalSpace(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Store address", style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
                  ],
                ),
                UIHelper.verticalSpace(8.h),


                CustomButton(
                  iconPrefix: Icon(Icons.location_on_outlined, color: AppColors.primary2, size: 24.sp,),
                  color: AppColors.white,
                  borderRadius: 8.r,
                  borderColor: AppColors.cE8E8E8,
                  name: " Riyadh – Al Olaya branch",
                  textStyle:  TextFontStyle.titleStyle14w500c181818Manrope,
                  onCallBack: () {
                    Get.to(UserDirectionScreen(
                      destinationLat: destinationLat,
                      destinationLng: destinationLng,
                    ));
                  },
                  context: context,
                ),


                UIHelper.verticalSpace(12),

                Row(
                  children: [
                    Text('Business Hours',style: TextFontStyle.titleStyle14w500c2F2F2FManrope.copyWith(fontSize: 16.sp)),
                  ],
                ),

                UIHelper.verticalSpace(8.h),
//-------------------------------------- Time -------------------------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        iconPrefix: Icon(Icons.access_time_outlined,
                            color: AppColors.primary2),
                        color: AppColors.cFFFFFF,
                        borderRadius: 16.r,
                        borderColor: AppColors.cE8E8E8,
                        name: "08.00 AM",
                        textStyle:  TextFontStyle.titleStyle16w400c181818FManrope,
                        onCallBack: () {},
                        context: context,
                      ),
                    ),
                    UIHelper.horizontalSpace(16.w),
                    Expanded(
                      child: CustomButton(
                        iconPrefix: Icon(Icons.access_time_outlined,
                            color: AppColors.primary2),
                        color: AppColors.cFFFFFF,
                        borderRadius: 16.r,
                        borderColor: AppColors.cE8E8E8,
                        name: "08.00 PM",
                        textStyle:  TextFontStyle.titleStyle16w400c181818FManrope,
                        onCallBack: () {},
                        context: context,
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(12.h),

//-------------------------- Done ---------------------------------//

//-------------------------- Cupper  ---------------------------------//

                Row(
                  children: [
                    Transform.scale(
                      scale: 0.7,
                      child: CupertinoSwitch(
                        inactiveThumbColor: AppColors.cFFFFFF,
                        thumbColor: AppColors.cFFFFFF,
                        value: isSwitched,
                        activeColor: AppColors.cD1D1D1,
                        trackColor: AppColors.cFF4800,
                        onChanged: (bool value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                      ),
                    ),
                    UIHelper.horizontalSpace(12.w),
                    Text(
                      'Open 24/7',
                      style: TextFontStyle.titleStyle20w700Whiteinter.copyWith(fontSize: 16.sp)
                    ),
                  ],
                ),
                UIHelper.verticalSpace(12.h),

                SizedBox(
                  height: 48.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: days.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      return DayCard(day: days[index]);
                    },
                  ),
                ),
                UIHelper.verticalSpace(24.h),


              ]



          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 55.h),
          child: CustomButton(
            name: "Update",
            context: context,
            color: AppColors.primary2,
            height: 56.h,
            borderRadius: 8.r,
            textStyle: TextFontStyle.titleStyle14w500WhiteManrope,
            onCallBack: () {
             NavigationService.navigateTo(Routes.merchantProfile);
            },
          ),
        ),
      ),
    );
  }
}





class CategoryItem {
  final String name;
  final String icon;

  CategoryItem({required this.name, required this.icon});
}