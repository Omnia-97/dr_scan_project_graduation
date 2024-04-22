import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dr_scan_graduation_project/core/presentation/widgets/customicon_bodyitem.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';

class BodyItemPage extends StatelessWidget {
  const BodyItemPage({Key? key}) : super(key: key);
  static String id = 'BodyItemPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 228,
              top: 127,
              child: Image.asset(
                'assets/images/background_body.png',
                width: 320,
                opacity: const AlwaysStoppedAnimation(0.5),
              )),
          Column(
            children: [
              const SizedBox(
                height: 81,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Color(0xff3A3A3A),
                      size: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const Text(
                    'Body Items',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: kRoboto,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 50),
                child: Text(
                  """choose the part of that you feel 
pain on it """,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff727272),
                    fontFamily: kRoboto,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              BodyItemContainer(
                image: const AssetImage('assets/images/headlist.png'),
                text: 'Head',
                width1: 17,
                width2: 11,
                width3: 10,
                width4: 150,
                ontap: () {
                  // Get.to(() => SymptomPage());
                },
              ),
              const SizedBox(
                height: 17,
              ),
              BodyItemContainer(
                  image: const AssetImage('assets/images/necklist.png'),
                  text: 'Neck',
                  width1: 20,
                  width2: 10,
                  width3: 10,
                  width4: 150,
                  ontap: () {}),
              const SizedBox(
                height: 17,
              ),
              BodyItemContainer(
                  image: const AssetImage('assets/images/chestlist.png'),
                  text: 'Chest',
                  width1: 18,
                  width2: 10,
                  width3: 10,
                  width4: 142,
                  ontap: () {}),
              const SizedBox(
                height: 17,
              ),
              BodyItemContainer(
                  image: const AssetImage('assets/images/armslist.png'),
                  text: 'Arms',
                  width1: 17,
                  width2: 8,
                  width3: 10,
                  width4: 145,
                  ontap: () {}),
              const SizedBox(
                height: 17,
              ),
              BodyItemContainer(
                  image: const AssetImage('assets/images/Abdomenlist.png'),
                  text: 'Abdomen',
                  width1: 16,
                  width2: 10,
                  width3: 10,
                  width4: 110,
                  ontap: () {}),
              const SizedBox(
                height: 17,
              ),
              BodyItemContainer(
                  image: const AssetImage('assets/images/backlist.png'),
                  text: 'Back',
                  width1: 15,
                  width2: 6,
                  width3: 10,
                  width4: 150,
                  ontap: () {}),
              const SizedBox(
                height: 17,
              ),
              BodyItemContainer(
                  image: const AssetImage('assets/images/pelvislist.png'),
                  text: 'Pelvis',
                  width1: 17.37,
                  width2: 6,
                  width3: 10,
                  width4: 142,
                  ontap: () {}),
              const SizedBox(
                height: 17,
              ),
              BodyItemContainer(
                  image: const AssetImage('assets/images/buttockslist.png'),
                  text: 'Buttocks',
                  width1: 18,
                  width2: 6,
                  width3: 10,
                  width4: 117,
                  ontap: () {}),
              const SizedBox(
                height: 17,
              ),
              BodyItemContainer(
                  image: const AssetImage('assets/images/legslist.png'),
                  text: 'Legs',
                  width1: 23,
                  width2: 14,
                  width3: 10,
                  width4: 150,
                  ontap: () {}),
            ],
          )
        ],
      ),
    );
  }
}
