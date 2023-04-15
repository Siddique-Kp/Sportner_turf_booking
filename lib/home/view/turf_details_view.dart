import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';
import 'package:sporter_turf_booking/utils/global_values.dart';
import 'package:sporter_turf_booking/utils/routes/navigations.dart';
import 'package:sporter_turf_booking/utils/textstyles.dart';
import '../components/turf_details_components/available_sport_widget.dart';
import '../components/turf_details_components/contact_info_widget.dart';
import '../components/turf_details_components/turf_details_head.dart';

class TurfDetailsView extends StatelessWidget {
  const TurfDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: MyColors.white,
            expandedHeight: size.height * 0.30,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://cricketgraph.com/wp-content/gallery/enc-sports-turf/ENC-Sports-Turf-Thane-West-8.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                width: double.infinity,
                height: 20,
                decoration: const BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(75, 158, 158, 158)),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  /// Here is heder section --------
                  const TurfDetailsHeader(),
                  AppSizes.kHeight20,

                  /// here is the avalable sports section ------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        "Available Sports",
                        style:AppTextStyles.textH3,
                      ),
                      AppSizes.kHeight20,
                      const AvailableSportsWidget(),
                    ],
                  ),
                  AppSizes.kHeight10,
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_on,
                          size: 28,
                        ),
                        label: const Text(
                          "Get location",
                          style: TextStyle(fontSize: 19),
                        )),
                  ),
                  AppSizes.kHeight20,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: MyColors.black,
                        ),
                      ),
                      AppSizes.kHeight10,
                      Text(
                          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    ],
                  ),
                  AppSizes.kHeight30,
                  const TurfDetailsContactInfo(),
                  AppSizes.kHeight50,
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 45,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, NavigatorClass.bookingSlotScreen);
          },
          child: const Text("BOOK NOW"),
        ),
      ),
    );
  }
}
