import 'package:social_media_app/resources/export.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.prefixImg,
    this.suffixImg,
    required this.hintText,
    required this.hintTextDetails,
  });
  final String prefixImg;
  final String? suffixImg;
  final String hintText;
  final String hintTextDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 1.h),
        Container(
          height: 45,
          width: double.infinity,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintTextDetails,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  prefixImg,
                  width: 16,
                  height: 16,
                ),
              ),
              suffixIcon: suffixImg != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        suffixImg!,
                        width: 16,
                        height: 16,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
