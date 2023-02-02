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
  TextEditingController controller = TextEditingController();

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
            title: CustomTextField(
              controller: controller,
              hintText: 'Введите артикул',
              icon: const Icon(Icons.search),
            ),
            titleSpacing: 0,
            backgroundColor: Colors.white,
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 107.h,
            bottom: PreferredSize(
              preferredSize: Size(0, 58.h),
              child: const ProductsTitlesWidget(),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: List.generate(
              20,
              (index) => const ProductWidget(),
            ),
          ))
        ],
      ),
    );
  }
}
