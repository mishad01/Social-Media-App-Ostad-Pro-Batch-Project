import 'package:social_media_app/resources/export.dart';

class PostViewSection extends StatelessWidget {
  const PostViewSection({
    super.key,
    required this.img,
  });
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.h),
          Row(
            children: [
              //Image
              Padding(
                padding: EdgeInsets.only(left: 2.5.w),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.5),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          'https://randomuser.me/api/portraits/men/1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kathryn Annee",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "@anny2002",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: SvgPicture.asset(AssetsPath.notificationIcon),
              )
            ],
          ),
          SizedBox(height: 2.h),
          Center(
            child: Container(
              width: 90.0.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                img,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.only(left: 2.5.w),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetsPath.loveFillIcon,
                  color: Colors.red,
                ),
                SizedBox(width: 2.w),
                InkWell(
                  onTap: () {
                    Utils.showCommentBottomSheet();
                  },
                  child: SvgPicture.asset(
                    AssetsPath.commentIcon,
                  ),
                ),
                SizedBox(width: 3.w),
                GestureDetector(
                  onTap: () {
                    Utils.showCommentBottomSheet();
                  },
                  child: Text("20 Comments"),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: SvgPicture.asset(
                    AssetsPath.bookmarkIcon,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
