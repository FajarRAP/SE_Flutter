
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_styles.dart';
import '../../../core/size_config.dart';

class TambahPerwalian extends StatelessWidget {
  const TambahPerwalian({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Warna dan opasitas shadow
              // Jarak penyebaran shadow
              blurRadius: 4, // Radius blur shadow
              offset: Offset(0, -1),
            ) // Posisi shadow (x, y)
          ],
        ),
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 3.75),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kBlue,
              fixedSize: Size(SizeConfig.screenWidth!, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Text(
            'Tambah Perwalian',
            style: kPoppinsMedium.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 3.75),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeHorizontal! * 5.5,
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
                        borderRadius: BorderRadiusDirectional.circular(SizeConfig.blockSizeHorizontal! * 1)),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 3.75,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tambah Perwalian',
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
    );
  }
}

class PilihPerwalian extends StatefulWidget {
  @override
  State<PilihPerwalian> createState() => _PilihPerwalianState();
}

class _PilihPerwalianState extends State<PilihPerwalian> {
  String _selectedItem = 'Subjek Perwalian';

  final List<String> _dropdownItems = [
    'Perwalian sebelum UTS',
    'Perwalian setelah UTS',
    'Perwalian sebelum UAS',
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
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: kNunitoRegular.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 3.75, color: kNeutral90),
      decoration: InputDecoration(
        isDense: true,
        hintStyle:
            kNunitoRegular.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 3.75, color: kNeutral70),
        contentPadding: EdgeInsets.all(0), // Menghilangkan padding
        border: InputBorder.none, // Menghilangkan border
        hintText: 'Tulis materi perwalian',
      ),
    );
  }
}



// class MyDropdownButton extends StatefulWidget {
//   @override
//   _MyDropdownButtonState createState() => _MyDropdownButtonState();
// }

// class _MyDropdownButtonState extends State<MyDropdownButton> {
//   String _selectedItem = 'Sebelum UTS';

//   List<String> _dropdownItems = [
//     'Sebelum UTS',
//     'Setelah UTS',
//     'Sebelum UAS',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       icon: SvgPicture.asset('assets/icons/arrow-down.svg'),
//       elevation: 2,
//       underline: Container(),
//       borderRadius: BorderRadius.circular(8),
//       value: _selectedItem,
//       style: kPoppinsMedium.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 4.675, color: kBlue),
//       items: _dropdownItems.map(
//         (String item) {
//           return DropdownMenuItem<String>(
//             value: item,
//             child: Text(item),
//           );
//         },
//       ).toList(),
//       onChanged: (String? selectedItem) {
//         setState(() {
//           _selectedItem = selectedItem!;
//         });
//       },
//     );
//   }
// }