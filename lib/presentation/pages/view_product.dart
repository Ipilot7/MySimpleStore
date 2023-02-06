// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_simple_store/config/constants/app_text_styles.dart';
// import 'package:my_simple_store/config/constants/constants.dart';
// import 'package:my_simple_store/presentation/widgets/product_widget.dart';
// import 'package:my_simple_store/presentation/widgets/products_title.dart';
// import 'package:my_simple_store/presentation/widgets/textfield_add_category.dart';

// class ViewProductPage extends StatefulWidget {
//   const ViewProductPage({super.key});

//   @override
//   State<ViewProductPage> createState() => _ViewProductPageState();
// }

// class _ViewProductPageState extends State<ViewProductPage> {
//   TextEditingController count = TextEditingController();
//   TextEditingController price = TextEditingController();

//   int defcount = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ColoredBox(
//         color: Colors.grey.withOpacity(0.1),
//         child: CustomScrollView(
//           physics: const BouncingScrollPhysics(),
//           slivers: [
//             SliverAppBar(
//               title: const Text('AQ-5432'),
//               titleSpacing: 0,
//               pinned: true,
//               snap: false,
//               floating: true,
//               expandedHeight: 107.h,
//               bottom: PreferredSize(
//                 preferredSize: Size(0, 58.h),
//                 child: const ProductsTitlesWidget(
//                   text1: 'Артикул',
//                   text2: 'Размер',
//                   text3: 'Штук',
//                   text4: 'Цена',
//                   textColor: Colors.white,
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: SizedBox(height: 4.h),
//             ),
//             SliverToBoxAdapter(
//               child: Column(
//                 children: List.generate(
//                   sizeType1.length,
//                   (index) => GestureDetector(
//                     onTap: () {
//                       count.text = '1';
//                       price.text = '15000';
//                       showDialogFunc();
//                     },
//                     child: const ProductWidget(
//                       text1: 'ФК-5432dd',
//                       text2: 'M',
//                       text3: '20',
//                       text4: '15000',
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   showDialogFunc() {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         scrollable: true,
//         title: const Text('Инфо'),
//         contentTextStyle: AppTextStyles.body16w5,
//         content: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Тип товара : Category'),
//             SizedBox(height: 10.h),
//             const Text('Артикул товара : AQ-5432'),
//             SizedBox(height: 10.h),
//             const Text('Размер : S'),
//             SizedBox(height: 10.h),
//             Row(
//               children: [
//                 const Text('Количество : '),
//                 SizedBox(
//                     width: 60.w,
//                     child: TextFieldAddCategory(controller: count, text: 'шт'))
//               ],
//             ),
//             SizedBox(height: 10.h),
//             Row(
//               children: [
//                 const Text('Цена : '),
//                 SizedBox(
//                     width: 150.w,
//                     child:
//                         TextFieldAddCategory(controller: price, text: 'Сумма'))
//               ],
//             ),
//             SizedBox(height: 10.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text('В корзину')),
//                 ElevatedButton(
//                     style: const ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll(Colors.red)),
//                     onPressed: () {},
//                     child: const Text('Отмена')),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
