import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/config/constants/constants.dart';
import 'package:my_simple_store/presentation/widgets/categorys_widget.dart';
import 'package:my_simple_store/presentation/widgets/custom_container.dart';
import 'package:my_simple_store/presentation/widgets/custom_textfield.dart';
import 'package:my_simple_store/presentation/widgets/selected_size.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  TextEditingController catController = TextEditingController();

  bool size1 = false;
  bool size2 = false;

  String defCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: const Text('Добавить категории'),
      ),
      body: ListView(
        children: [
          CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 10),
                  child: Text(
                    'Имя категории:',
                    style: AppTextStyles.body18w5,
                  ),
                ),
                CustomTextField(
                  controller: catController,
                  borderRadius: 10.r,
                  width: 250,
                  icon: const Icon(Icons.category),
                  hintText: 'Введите имя категории',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 10, top: 10),
                  child: Text(
                    'Тип размера:',
                    style: AppTextStyles.body18w5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            size1 = true;
                            size2 = false;
                          });
                        },
                        child: SelectSizeWidget(
                          selected: size1,
                          text: sizes[0],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            size2 = true;
                            size1 = false;
                          });
                        },
                        child: SelectSizeWidget(
                          selected: size2,
                          text: sizes[1],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        defCategory = catController.text;
                        showDialogFunc();
                      });
                    },
                    child: const Text('Добавить категорию'),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Text(
              'Мои категории',
              style: AppTextStyles.body20wB,
            ),
          ),
          const CustomContainer(
            color: Colors.blue,
            child: MyCategorysWidget(
              category: 'Имя категории',
              size: 'Тип размера',
            ),
          ),
          CustomContainer(
            child: Column(
              children: List.generate(
                20,
                (index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: const MyCategorysWidget(
                    color: Colors.black,
                    category: 'Ботинки',
                    size: '36..45',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
                  'Имя категории:     ',
                ),
                SizedBox(width: 110.w, child: Text(defCategory))
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                const Text(
                  'Тип размера:     ',
                ),
                SizedBox(
                  width: 110.w,
                  child: Text(size1
                      ? sizes[0]
                      : size2
                          ? sizes[1]
                          : ''),
                )
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text('Сохранить')),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: () {
                      catController.clear();
                      setState(() {
                        size1 = false;
                        size2 = false;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Отмена')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
