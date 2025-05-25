import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine/dto/Doctor.dart';
import 'package:telemedicine/utils/utils.dart';
import 'package:telemedicine/view/doctors/doctorItem.dart';

import '../../constants/colors.dart';
import '../../controller/doctorController.dart';
import '../../widgets/custom/custombtn.dart';
import '../../widgets/custom/customtextfield.dart';
import '../../widgets/custom/detailstext1.dart';
import '../../widgets/custom/detailstext2.dart';
import '../../widgets/custom/text11.dart';
import '../../widgets/headerMiniCardWidget.dart';
import '../modals/doctorDetailModal.dart';
import '../modals/doctorSpecialityModal.dart';
import '../modals/doctorsSearchModal.dart';

class DoctorsHomePage extends StatefulWidget {
  const DoctorsHomePage({super.key});

  @override
  State<DoctorsHomePage> createState() => _DoctorsHomePageState();
}

class _DoctorsHomePageState extends State<DoctorsHomePage> {
  List<Doctor> doctors = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    setState(() => isLoading = true);

    try {
      // Replace with your API call or service method
      final response = await DoctorController.fetchTopAvailableDoctors(); // List<User>

      setState(() {
        doctors = response;
      });
    } catch (e) {
      Utils.showSnackBar(context, "failed to load Doctors");
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _refresh() async {
    await fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderMiniCardWidget(title: "Doctors"),
                    const SizedBox(height: 8.0),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomTextField(
                        label: 'Search Doctors',
                        icon: Icons.search,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text1(text1: 'Doctor Speciality '),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32.0),
                                    topRight: Radius.circular(32.0),
                                  ),
                                ),
                                builder: (context) => DoctorSpecialityModal(),
                              );
                            },
                            child: const Text11(
                              text2: 'See All',
                              color: AppColors.text3Color,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildSpecialitySection(),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DoctorSearchModal()));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text1(text1: 'Top Doctors '),
                            Text11(
                              text2: 'See All',
                              color: AppColors.text3Color,
                            )
                          ],
                        ),
                      ),
                    ),

                    if (isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (doctors.isEmpty)
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: Text('No doctors available')),
                        ),
                      )
                    else
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          return DoctorItem(doctor: doctors[index]);
                        },
                      ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


  Widget _buildSpecialitySection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Image.asset(
                      'assets/images/img/icons8-dentist-48.png',
                      width: 30,
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Text1(
                  text1: 'Dentist',
                  size: 11,
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Image.asset(
                      'assets/images/img/icons8-cardiologist-64.png',
                      width: 30,
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Text1(
                  text1: 'Cardiolo..',
                  size: 11,
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Image.asset(
                      'assets/images/img/icons8-neurologist-64.png',
                      width: 30,
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Text1(
                  text1: 'Neurolo..',
                  size: 11,
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Image.asset(
                      'assets/images/img/icons8-orthopedic-64.png',
                      width: 30,
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Text1(
                  text1: 'Orthopae..',
                  size: 11,
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Image.asset(
                      'assets/images/img/icons8-cardiologist-64.png',
                      width: 30,
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Text1(
                  text1: 'Cardiolo..',
                  size: 11,
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Image.asset(
                      'assets/images/img/icons8-cardiologist-64.png',
                      width: 30,
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Text1(
                  text1: 'Neurolo..',
                  size: 11,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}
