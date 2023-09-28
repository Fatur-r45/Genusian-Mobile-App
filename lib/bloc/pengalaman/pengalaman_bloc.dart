import 'package:bloc/bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/pengalaman/pengalaman_event.dart';
import 'package:genusian_smart_mobile_app/bloc/pengalaman/pengalaman_state.dart';
import 'package:genusian_smart_mobile_app/services/pengalaman_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/pengalaman.dart';

class PengalamanBloc extends Bloc<PengalamanEvent, PengalamanState> {
  PengalamanBloc() : super(PengalamanInitial()) {
    on<LoadPengalaman>((event, emit) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      int? nim = pref.getInt("nim");
      try {
        if (nim != null) {
          List<PengalamanModel>? pengalaman =
              await PengalamanServices.getAllPengalaman(nim);
          if (pengalaman != null) {
            emit(PengalamanLoadState(pengalaman));
          }
        }
      } catch (e) {
        print(e);
      }
    });
    on<PostPengalaman>((event, emit) async {
      try {
        SharedPreferences pref = await SharedPreferences.getInstance();
        int? nim = pref.getInt("nim");
        await PengalamanServices.postPengalaman(
            nim!,
            event.posisiPekerjaan,
            event.jenisPekerjaan,
            event.namaPerusahaan,
            event.mulai,
            event.sampai);
        emit(PengalamanPostState());
      } catch (_) {}
    });
    on<PutPengalaman>((event, emit) async {
      try {
        await PengalamanServices.putPengalaman(
            event.id,
            event.posisiPekerjaan,
            event.jenisPekerjaan,
            event.namaPerusahaan,
            event.mulai,
            event.sampai);
        emit(PengalamanPutState());
      } catch (_) {}
    });

    on<DeletPengalaman>((event, emit) async {
      await PengalamanServices.deletPengalaman(event.id);
      emit(PengalamanDelet());
    });
  }
}
