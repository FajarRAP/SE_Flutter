
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_styles.dart';
import '../../../core/size_config.dart';

class EditBimbinganV2 extends StatelessWidget {
  const EditBimbinganV2({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    final bottomPadding =
        keyboardVisible ? MediaQuery.of(context).viewInsets.bottom : 0.0;
        
    return Scaffold(
      backgroundColor: kWhite,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Container(
      //   decoration: BoxDecoration(
      //     color: kWhite,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.withOpacity(0.5), // Warna dan opasitas shadow
      //         // Jarak penyebaran shadow
      //         blurRadius: 4, // Radius blur shadow
      //         offset: Offset(0, -1),
      //       ) // Posisi shadow (x, y)
      //     ],
      //   ),
      //   padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 3.75),
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     style: ElevatedButton.styleFrom(
      //         backgroundColor: kBlue,
      //         fixedSize: Size(SizeConfig.screenWidth!, 48),
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(10),
      //         )),
      //     child: Text(
      //       'Edit Bimbingan',
      //       style: kPoppinsMedium.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 3.75),
      //     ),
      //   ),
      // ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: bottomPadding,
        ),
        child: BottomAppBar(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              color: kBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Edit Bimbingan',
                style: TextStyle(
                  color: kWhite,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.75,
                  fontFamily: 'Poopins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 2.35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/icons/arrow-left.svg')),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 5.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: SizeConfig.blockSizeHorizontal! * 1.87),
                      width: SizeConfig.blockSizeHorizontal! * 4.25,
                      height: SizeConfig.blockSizeHorizontal! * 4.25,
                      decoration: BoxDecoration(
                          color: kBlue,
                          borderRadius:
                              BorderRadiusDirectional.circular(SizeConfig.blockSizeHorizontal! * 1)),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 3.75,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sunting Bimbingan',
                          style: kPoppinsMedium.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 5.5, color: kBlack),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 1,
                        ),
                        Text(
                          'Ponco SA',
                          style: kNunitoRegular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.75, color: kNeutral80),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 7.5,
              ),
              Container(
                height: 8,
                color: Color(0xFFF6F7F9),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 5.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                child: PilihPerwalian(),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 3.75,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                child: MyTextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PilihPerwalian extends StatefulWidget {
  @override
  State<PilihPerwalian> createState() => _PilihPerwalianState();
}

class _PilihPerwalianState extends State<PilihPerwalian> {
  String _selectedItem = 'Bimbingan sebelum UTS';

  final List<String> _dropdownItems = [
    'Bimbingan sebelum UTS',
    'Bimbingan setelah UTS',
    'Bimbingan sebelum UAS',
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 3.75),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Atur shapeborder di sini
      ),
      elevation: 4,
      shadowColor: kLightGrey,
      itemBuilder: (BuildContext context) {
        return _dropdownItems.map((String item) {
          return PopupMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: kPoppinsRegular.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 3.75, color: kBlack),
            ),
          );
        }).toList();
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            child: Text(
              _selectedItem,
              style: kPoppinsMedium.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 4.675, color: kBlue),
            ),
          ),
          SvgPicture.asset('assets/icons/arrow-down.svg'),
        ],
      ),
      onSelected: (String selectedItem) {
        setState(() {
          _selectedItem = selectedItem;
        });
      },
    );
  }
}

class MyTextField extends StatelessWidget {
  TextEditingController _controller = TextEditingController(
      text:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.");

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: kNunitoRegular.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 3.75, color: kNeutral90),
      maxLines: null,
      decoration: InputDecoration(
        isDense: true,
        // hintStyle:
        //     kNunitoRegular.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 3.75, color: kNeutral70),
        contentPadding: EdgeInsets.all(0), // Menghilangkan padding
        border: InputBorder.none, // Menghilangkan border
      ),
    );
  }
}
