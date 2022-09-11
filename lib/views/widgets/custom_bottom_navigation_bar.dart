/* import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry/views/utils/AppColor.dart';

// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  int selectedIndex;
  Function onItemTapped;
  CustomBottomNavigationBar(
      {@required this.selectedIndex, @required this.onItemTapped});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0, bottom: 0),
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            backgroundColor: Colors.red,
            currentIndex: widget.selectedIndex,
            onTap: widget.onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: [
              (widget.selectedIndex == 0)
                  ? BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/home-filled.svg',
                          color: AppColor.primary),
                      label: '')
                  : BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/home.svg',
                          color: Colors.grey[600]),
                      label: ''),
              (widget.selectedIndex == 1)
                  ? BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/discover-filled.svg',
                          color: AppColor.primary, height: 28, width: 26),
                      label: '')
                  : BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/discover.svg',
                          color: Colors.grey[600], height: 28, width: 26),
                      label: ''),
              (widget.selectedIndex == 2)
                  ? BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/bookmark-filled.svg',
                          color: AppColor.primary),
                      label: '')
                  : BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/bookmark.svg',
                          color: Colors.grey[600]),
                      label: ''),
              (widget.selectedIndex == 3)
                  ? BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/user-filled.svg',
                          color: AppColor.primary),
                      label: '')
                  : BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/userr.svg',
                          color: Colors.grey[600]),
                      label: ''),
            ],
          ),
        ),
      ),
    );
  }
}
 */