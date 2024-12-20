import 'package:flutter/material.dart';
import 'package:mosta2/core/extensions.dart';
import 'package:mosta2/core/widgets/click_gif.dart';
import '../core/assets.dart';
import 'details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.homeBackground),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: context.ofSH(0.1)),
                  Image.asset(
                    Assets.homeText,
                    width: context.ofSW(0.7),
                  ),
                  SizedBox(height: context.ofSH(0.1)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: context.ofSW(0.05)),
                      serviceButton(1),
                      SizedBox(width: context.ofSW(0.04)),
                      serviceButton(2),
                      SizedBox(width: context.ofSW(0.04)),
                     InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const DetailsScreen(
                                    serviceId: 3, qrPath: Assets.generalQR);
                              }));
                            },
                            child: SizedBox(
                              width: context.ofSW(0.27),
                              height: context.ofSW(0.27),
                              child: Stack(
                                children: [
                                  Image.asset(Assets.serviceButton(3)),
                                  Positioned(
                                    bottom: context.ofSH(0.01),
                                    right: 0,
                                    left: 0,
                                    child: ClickGif(
                                      height: context.ofSH(0.05),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                      SizedBox(width: context.ofSW(0.05)),
                    ],
                  ),
                  SizedBox(height: context.ofSH(0.03)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: context.ofSW(0.05)),
                      serviceButton(4),
                      SizedBox(width: context.ofSW(0.04)),
                      serviceButton(5),
                      SizedBox(width: context.ofSW(0.04)),
                      serviceButton(6, qrPath: Assets.service6QR),
                      SizedBox(width: context.ofSW(0.05)),
                    ],
                  ),
                  SizedBox(height: context.ofSH(0.03)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: context.ofSW(0.05)),
                      serviceButton(7),
                      SizedBox(width: context.ofSW(0.04)),
                      serviceButton(8),
                      SizedBox(width: context.ofSW(0.04)),
                      serviceButton(9),
                      SizedBox(width: context.ofSW(0.05)),
                    ],
                  ),
                  SizedBox(height: context.ofSH(0.03)),
                  SizedBox(
                      width: context.ofSW(0.27),
                      child: serviceButton(10, isExpanded: false)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceButton(int id,
      {bool isExpanded = true, String qrPath = Assets.generalQR}) {
    if (isExpanded) {
      return Expanded(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DetailsScreen(serviceId: id, qrPath: qrPath);
            }));
          },
          child: Image.asset(Assets.serviceButton(id)),
        ),
      );
    }
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailsScreen(serviceId: id, qrPath: qrPath);
        }));
      },
      child: Image.asset(Assets.serviceButton(id)),
    );
  }
}
