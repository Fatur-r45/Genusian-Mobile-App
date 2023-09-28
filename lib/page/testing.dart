import 'dart:io';
import 'package:flutter/material.dart';
import 'package:genusian_smart_mobile_app/model/get_all_data_from_mahasiswa.dart';
import 'package:genusian_smart_mobile_app/services/mahasiswaServices.dart';
import 'package:genusian_smart_mobile_app/services/serviceFile.dart';
import 'package:google_fonts/google_fonts.dart';

class Testing extends StatefulWidget {
  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  String? _image;
  String? aboutMe;

  void updateImage() async {
    ServiceFile? path = await ServiceFile.uploadFile();
    if (path != null) {
      setState(() {
        _image = path.fileName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              aboutMe != null ? aboutMe! : "",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              "Testing",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            OutlinedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1999),
                  lastDate: DateTime(2050),
                ).then((value) => print(value));
              },
              child: Text("Calender"),
            ),
            _image != null
                ? SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.file(
                      File('$_image'),
                      fit: BoxFit.cover,
                    ),
                  )
                : Text(
                    "tidak ada gambar",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                updateImage();
              },
              icon: const Icon(Icons.add_photo_alternate)),
          IconButton(
              onPressed: () async {
                List<AllDataMahasiswa>? mahasiswa =
                    await MahasiswaServices.getMahasiswaBySearch("fatur");
                mahasiswa?.map((e) => print(e.sertifikats[0].title)).toList();
                // List<Mahasiswa> mahasiswa = await Mahasiswa.getAllMahasiswa();
                // print(mahasiswa[0].nama);
                // context.read<PengalamanBloc>().add(LoadPengalaman());
                // var response = await Dio()
                //     .get("http://localhost:5000/mahasiswa/nim/20190050073");
                // var data = response.data["data"];
                // print(data);
                // Mahasiswa? mahasiswa =
                //     await MahasiswaServices.getMahasiswa(20190050073);
                // setState(() {
                //   aboutMe = mahasiswa?.aboutMe;
                // });
              },
              icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
