import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/presentation/widgets/custom_textfield.dart';
import 'package:my_simple_store/presentation/widgets/product_widget.dart';
import 'package:my_simple_store/presentation/widgets/products_title.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key});

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.grey.withOpacity(0.1),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              titleTextStyle:
                  AppTextStyles.body16w4.copyWith(color: AppColors.white),
              title: const CustomTextField(),
              titleSpacing: 0,
              backgroundColor: Colors.white,
              pinned: true,
              snap: false,
              floating: true,
              expandedHeight: 95.h,
              bottom: const PreferredSize(
                preferredSize: Size(0, 46),
                child: ProductsTitlesWidget(),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: List.generate(
                50,
                (index) => const ProductWidget(),
              ),
            ))
          ],
        ));
  }
}
