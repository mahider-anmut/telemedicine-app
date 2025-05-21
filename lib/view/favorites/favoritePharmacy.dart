import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';

class FavoritePharmacy extends StatelessWidget {
  const FavoritePharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  height: 245,
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/img/hospita1.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 130,
                              ),
                              const Positioned(
                                right: 10,top: 10,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.buttonColor,
                                  child: Icon(Icons.favorite,size: 20,color: Colors.white,),


                                ),
                              ),
                              Positioned(
                                right: 10,bottom: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                     height: 30,
                                  width: 152,
                                  decoration: BoxDecoration(
                                    color: AppColors.bgColor,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: const Row(
                                     children: [
                                       Icon(Icons.star,color: AppColors.buttonColor,size: 20,),
                                       Text11(text2: '4.6'),
                                       Text2(text2: '(1k + Reviews)')
                                       
                                       
                                       
                                     ],
                                    
                                  ),

                                )
                              )

                            ],
                          )),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text1(
                              text1: 'Doctor Hospital',
                              size: 16,
                            ),
                            const SizedBox(height: 4,),
                            const Text2(text2: 'Dental,Skin Care'),
                            const SizedBox(height: 4,),

                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/img/MapPin.png',
                                  color: Colors.white,
                                  width: 17,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text2(text2: 'G8502 Preston Rd. Inglewood')
                              ],
                            ),

                            const SizedBox(height: 7,),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.directions_walk_outlined,color:AppColors.buttonColor,size: 20,),
                                    Text2(text2: ' 3.5km/50mins')

                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  height: 245,
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/img/hospita2.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 130,
                              ),
                              const Positioned(
                                right: 10,top: 10,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.buttonColor,
                                  child: Icon(Icons.favorite,size: 20,color: Colors.white,),


                                ),
                              ),
                              Positioned(
                                  right: 10,bottom: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                    height: 30,
                                    width: 152,
                                    decoration: BoxDecoration(
                                      color: AppColors.bgColor,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.star,color: AppColors.buttonColor,size: 20,),
                                        Text11(text2: '4.6'),
                                        Text2(text2: '(1k + Reviews)')



                                      ],

                                    ),

                                  )
                              )

                            ],
                          )),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text1(
                              text1: 'International Hospital',
                              size: 16,
                            ),
                            const SizedBox(height: 4,),
                            const Text2(text2: 'Dental,Skin Care'),
                            const SizedBox(height: 4,),

                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/img/MapPin.png',
                                  color: Colors.white,
                                  width: 17,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text2(text2: 'G8502 Preston Rd. Inglewood')
                              ],
                            ),

                            const SizedBox(height: 7,),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.directions_walk_outlined,color:AppColors.buttonColor,size: 20,),
                                    Text2(text2: ' 3.5km/50mins')

                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  height: 245,
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/img/hospita3.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 130,
                              ),
                              const Positioned(
                                right: 10,top: 10,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.buttonColor,
                                  child: Icon(Icons.favorite,size: 20,color: Colors.white,),


                                ),
                              ),
                              Positioned(
                                  right: 10,bottom: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                    height: 30,
                                    width: 152,
                                    decoration: BoxDecoration(
                                      color: AppColors.bgColor,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.star,color: AppColors.buttonColor,size: 20,),
                                        Text11(text2: '4.6'),
                                        Text2(text2: '(1k + Reviews)')



                                      ],

                                    ),

                                  )
                              )

                            ],
                          )),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text1(
                              text1: 'CMH Hospital',
                              size: 16,
                            ),
                            const SizedBox(height: 4,),
                            const Text2(text2: 'Cancer,Skin Care'),
                            const SizedBox(height: 4,),

                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/img/MapPin.png',
                                  color: Colors.white,
                                  width: 17,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text2(text2: 'G8502 Preston Rd. Inglewood')
                              ],
                            ),

                            const SizedBox(height: 7,),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.directions_walk_outlined,color:AppColors.buttonColor,size: 20,),
                                    Text2(text2: ' 3.5km/50mins')

                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  height: 245,
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/img/hospita4.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 130,
                              ),
                              const Positioned(
                                right: 10,top: 10,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.buttonColor,
                                  child: Icon(Icons.favorite,size: 20,color: Colors.white,),


                                ),
                              ),
                              Positioned(
                                  right: 10,bottom: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                    height: 30,
                                    width: 152,
                                    decoration: BoxDecoration(
                                      color: AppColors.bgColor,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.star,color: AppColors.buttonColor,size: 20,),
                                        Text11(text2: '4.6'),
                                        Text2(text2: '(1k + Reviews)')



                                      ],

                                    ),

                                  )
                              )

                            ],
                          )),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text1(
                              text1: 'Hamid Latif Hospital',
                              size: 16,
                            ),
                            const SizedBox(height: 4,),
                            const Text2(text2: 'Cancer,Skin Care'),
                            const SizedBox(height: 4,),

                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/img/MapPin.png',
                                  color: Colors.white,
                                  width: 17,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text2(text2: 'G8502 Preston Rd. Inglewood')
                              ],
                            ),

                            const SizedBox(height: 7,),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.directions_walk_outlined,color:AppColors.buttonColor,size: 20,),
                                    Text2(text2: ' 3.5km/50mins')

                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  height: 245,
                  decoration: BoxDecoration(
                      color: AppColors.tabColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/img/hospita4.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 130,
                              ),
                              const Positioned(
                                right: 10,top: 10,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.buttonColor,
                                  child: Icon(Icons.favorite,size: 20,color: Colors.white,),


                                ),
                              ),
                              Positioned(
                                  right: 10,bottom: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                    height: 30,
                                    width: 152,
                                    decoration: BoxDecoration(
                                      color: AppColors.bgColor,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.star,color: AppColors.buttonColor,size: 20,),
                                        Text11(text2: '4.6'),
                                        Text2(text2: '(1k + Reviews)')



                                      ],

                                    ),

                                  )
                              )

                            ],
                          )),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text1(
                              text1: 'Hamid Latif Hospital',
                              size: 16,
                            ),
                            const SizedBox(height: 4,),
                            const Text2(text2: 'Cancer,Skin Care'),
                            const SizedBox(height: 4,),

                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/img/MapPin.png',
                                  color: Colors.white,
                                  width: 17,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text2(text2: 'G8502 Preston Rd. Inglewood')
                              ],
                            ),

                            const SizedBox(height: 7,),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.directions_walk_outlined,color:AppColors.buttonColor,size: 20,),
                                    Text2(text2: ' 3.5km/50mins')

                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          )),
    );
  }
}
