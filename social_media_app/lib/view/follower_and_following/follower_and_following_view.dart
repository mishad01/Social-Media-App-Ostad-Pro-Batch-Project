import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_media_app/utils/utils.dart';
import 'package:social_media_app/view/follower_and_following/widgets/follower_list.dart';
import 'package:social_media_app/view/follower_and_following/widgets/following_list.dart';

class FollowerAndFollowingView extends StatefulWidget {
  const FollowerAndFollowingView({super.key});

  @override
  State<FollowerAndFollowingView> createState() =>
      _FollowerAndFollowingViewState();
}

class _FollowerAndFollowingViewState extends State<FollowerAndFollowingView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Utils.customAppBar('ostad_app'),
      body: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        child: Column(
          children: [
            Row(
              children: [
                _buildTabItem("Following", 1),
                SizedBox(
                  width: 2.w,
                ),
                _buildTabItem("Follower", 0),
              ],
            ),
            Divider(
              color: Colors.grey.withOpacity(0.2),
            ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  hintText: "Search",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  prefixIcon: Icon(Icons.search)),
            ),
            SizedBox(height: 2.h),
            _selectedIndex == 0 ? FollowersList() : FollowingList()
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.grey : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
