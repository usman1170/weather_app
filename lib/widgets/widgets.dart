import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/global_controllar.dart';

class HeaderContainer extends StatefulWidget {
  const HeaderContainer({
    super.key,
  });

  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  String locality = '';
  String city = '';
  String date = DateFormat("yMMMMd").format(DateTime.now());
  final GlobalController _globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  @override
  void initState() {
    getAddress(
      _globalController.getLattitude().value,
      _globalController.getLongitude().value,
    );
    super.initState();
  }

  getAddress(lat, long) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, long);
    Placemark place = placemark[0];
    print(placemark);
    setState(() {
      locality = place.locality!;

      city = place.subAdministrativeArea!;
      // if (place.subLocality == '') {
      //   city = place.locality!;
      // } else {
      //   city = place.subLocality!;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .025,
      ),
      height: MediaQuery.of(context).size.height * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    city,
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ],
              ),
              Text(
                locality,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.menu,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class RowLowerContainer extends StatelessWidget {
  const RowLowerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .32,
      width: MediaQuery.of(context).size.width * .38,
      decoration: BoxDecoration(
        color: Colors.blue.shade100.withOpacity(.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Air\nQuality.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 14,
                    right: MediaQuery.of(context).size.width * .2,
                    bottom: 14,
                  ),
                  child: Text(
                    "54",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.orange.shade100,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Text(
                  "moderate\n",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1.2,
                endIndent: 40,
                indent: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowUpperContainer extends StatelessWidget {
  const RowUpperContainer({
    super.key,
    required this.temp,
  });
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .04,
        vertical: MediaQuery.of(context).size.height * .01,
      ),
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width * .38,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(.5),
              Colors.orangeAccent.shade100.withOpacity(.65),
              Colors.orangeAccent.shade400.withOpacity(.7),
            ]),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Temp.",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    right: 25,
                  ),
                  child: Text(
                    "$temp 'C",
                    style: const TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(
                color: Colors.white,
                thickness: 1.2,
                endIndent: 40,
                indent: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainLongContainer extends StatefulWidget {
  const MainLongContainer({
    super.key,
  });

  @override
  State<MainLongContainer> createState() => _MainLongContainerState();
}

class _MainLongContainerState extends State<MainLongContainer> {
  String date = DateFormat("yMMMMd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .04,
        vertical: MediaQuery.of(context).size.height * .02,
      ),
      height: MediaQuery.of(context).size.height * .5,
      width: MediaQuery.of(context).size.width * .43,
      decoration: BoxDecoration(
        color: Colors.blue.shade200.withOpacity(.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
                width: MediaQuery.of(context).size.width * .08,
                child: Image.asset(
                  "assets/weather/02d.png",
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 12, left: 10, top: 4),
            child: Text(
              "Sunny",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            endIndent: 30,
            indent: 30,
            thickness: 1.5,
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * .05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    //
                    // for Wind
                    //
                    Text(
                      "wind",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 4,
                        bottom: 18,
                      ),
                      child: Text(
                        "54 km/h",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    //
                    // for Humidity
                    //
                    Text(
                      "Humidity",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 4,
                        bottom: 18,
                      ),
                      child: Text(
                        "55 %",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    //
                    // for Pressure
                    //
                    Text(
                      "Pressure",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 4,
                      ),
                      child: Text(
                        "1002 pa",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .04),
                child: const Divider(
                  color: Colors.white,
                  thickness: 1.5,
                  endIndent: 30,
                  indent: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
