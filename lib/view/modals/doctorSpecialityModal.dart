import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom/detailstext1.dart';


class DoctorSpecialityModal extends StatelessWidget {
  final List<Category> categories = [
    Category('Dentist', CupertinoIcons.heart_fill),
    Category('Cardiolo..', CupertinoIcons.heart),
    Category('Orthopae..', CupertinoIcons.hand_raised_fill),
    Category('Neurolo..', CupertinoIcons.lab_flask),
    Category('Otology', CupertinoIcons.ear),
    Category('Gastroen..', CupertinoIcons.lab_flask_solid),
    Category('Rhinolog..', CupertinoIcons.lab_flask),
    Category('Utologis..', CupertinoIcons.person_crop_circle_fill_badge_checkmark),
    Category('Pulmonol..', CupertinoIcons.lab_flask_solid),
    Category('Hepatolo..', CupertinoIcons.drop_fill),
    Category('Gynecolo..', CupertinoIcons.person_2_fill),
    Category('Osteolog..', CupertinoIcons.lab_flask),
    Category('Plastic S..', CupertinoIcons.scissors),
    Category('Radiolog..', CupertinoIcons.wand_rays),
    Category('Intestine', CupertinoIcons.rectangle_grid_1x2_fill),
    Category('Pediatric', CupertinoIcons.lab_flask),
    Category('Naturopa..', CupertinoIcons.leaf_arrow_circlepath),
    Category('Herbal', CupertinoIcons.lab_flask_solid),
    Category('General', CupertinoIcons.person_3_fill),
  ];

  DoctorSpecialityModal({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
              child: Row(
                children: [

                  const Spacer(),
                  const Text1(text1: 'Speciality'),
                  const Spacer(),
                ],
              ),
            ),



            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryItem(category: categories[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.pop(context);},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Icon(
              category.icon,
              color: AppColors.buttonColor,
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
              child: Text1(text1: category.name,size: 11,)
          ),
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;

  Category(this.name, this.icon);
}












