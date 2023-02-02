import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/config/constants/constants.dart';
import 'package:my_simple_store/config/constants/local_data.dart';
import 'package:my_simple_store/presentation/widgets/custom_container.dart';
import 'package:my_simple_store/presentation/widgets/size_and_count.dart';
import 'package:my_simple_store/presentation/widgets/textfield_add_category.dart';

class AddProductsPage extends StatefulWidget {
  const AddProductsPage({super.key});

  @override
  State<AddProductsPage> createState() => _AddProductsPageState();
}

class _AddProductsPageState extends State<AddProductsPage> {
  TextEditingController article = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(0.9),
      appBar: AppBar(
        title: const Text('Добавить товары'),
      ),
      body: ListView(
        children: [
          CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Выберите категорию: '),
                    SizedBox(width: 10.w),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.blue,
                          context: context,
                          builder: (context) => Column(
                            children: const [
                              Text('data'),
                              Text('asd'),
                              Text('data'),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        height: 45.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: const Text('Выберите категорию'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Text('Артикул товара:'),
                    SizedBox(width: 10.w),
                    TextFieldAddCategory(
                      controller: article,
                      text: selectedCategory,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Text('Цена товара:'),
                    SizedBox(width: 20.w),
                    TextFieldAddCategory(
                      controller: price,
                      text: 'Введите цену',
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                CustomContainer(
                    color: Colors.blue,
                    child: SizeAndCountWidget(
                      ontap: () {},
                      color: Colors.blue,
                      size: 'Размер',
                      count: 'Штук',
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.lightBlue.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: List.generate(
                      sizeType1.length,
                      (index) => SizeAndCountWidget(
                        ontap: () => showModalCount(context, index),
                        size: sizeType1[index],
                        count: selSizes[index],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        showDialogFunc();
                      },
                      child: const Text('Добавить товар')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  showModalCount(BuildContext context, int selectedSize) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.topCenter,
          height: 300.h,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.grey.shade200),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) => Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selSizes[selectedSize] = '${index + 1}';
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        '${index + 1}',
                        style: AppTextStyles.body18w5
                            .copyWith(color: Colors.blueAccent),
                      ),
                    ),
                  ),
              separatorBuilder: (_, index) => Center(
                    child: Divider(
                      indent: 50.w,
                      endIndent: 50,
                    ),
                  ),
              itemCount: 100),
        );
      },
    );
  }

  showDialogFunc() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        title: const Text('Инфо'),
        contentTextStyle: AppTextStyles.body18w5,
        content: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Категория:     ',
                ),
                SizedBox(
                  width: 110.w,
                  child: Text(selectedCategory == 'Выберите категорию'
                      ? ''
                      : selectedCategory),
                )
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                const Text(
                  'Артикул товара:     ',
                ),
                SizedBox(
                  width: 110.w,
                  child: Text(article.text),
                )
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                const Text(
                  'Цена товара:     ',
                ),
                SizedBox(
                  width: 110.w,
                  child: Text(price.text),
                )
              ],
            ),
            SizedBox(height: 15.h),
            Table(
              border: TableBorder.all(),
              columnWidths: const {1: FixedColumnWidth(140)},
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  TableCell(
                      child: ColoredBox(
                          color: Colors.grey.shade300,
                          child: const Center(child: Text('count')))),
                  TableCell(
                      child: ColoredBox(
                          color: Colors.grey.shade300,
                          child: const Center(child: Text('count'))))
                ]),
                for (int i = 0; i < selSizes.length; i++) ...[
                  TableRow(children: [
                    TableCell(child: Center(child: Text(sizeType1[i]))),
                    TableCell(child: Center(child: Text(selSizes[i])))
                  ]),
                ]
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      article.clear();
                      price.clear();
                      setState(() {
                        selSizes.replaceRange(0, sizes.length - 1, [
                          '0',
                          '0',
                          '0',
                          '0',
                          '0',
                          '0',
                          '0',
                          '0',
                          '0',
                          '0',
                          '0',
                        ]);
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Сохранить')),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {},
                    child: const Text('Отмена')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
