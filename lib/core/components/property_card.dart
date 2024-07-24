import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realstate/models/property_model.dart';

class PropertyCard extends StatelessWidget {
  final PropertyModel property;

  const PropertyCard({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: const Color(0XFFFFFFFF),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color(0XFFCCCCCC),
            width: 1,
          ),
        ),
        width: double.maxFinite,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                property.propertyImages?.first ??
                    'assets/images/img_rectangle_34625893.png',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 64,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          property.title ?? 'Unknown Title',
                          style: const TextStyle(
                            color: Color(0XB2000000),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Text(
                                'Rs.${property.price}',
                                style: const TextStyle(
                                  color: Color(0XFF000000),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  'Per night',
                                  style: TextStyle(
                                    color: Color(0XB2000000),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 16,
                                width: 16,
                                child: SvgPicture.asset(
                                  'assets/images/img_group_40308.svg',
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Text(
                                  'Chicago, US',
                                  style: TextStyle(
                                    color: Color(0XB2000000),
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: SvgPicture.asset(
                                    'assets/images/img_group_40293.svg',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  '${property.numberOfBedRooms} Beds',
                                  style: const TextStyle(
                                    color: Color(0XB2000000),
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: SvgPicture.asset(
                                    'assets/images/img_group_1171285375.svg',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  '${property.numberOfBathrooms} Baths',
                                  style: const TextStyle(
                                    color: Color(0XB2000000),
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(1),
                              child: SizedBox(
                                height: 16,
                                width: 16,
                                child: SvgPicture.asset(
                                  'assets/images/img_star_1_16x16.svg',
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                '4.7',
                                style: TextStyle(
                                  color: Color(0XFF000000),
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
