import 'package:bloc/bloc.dart';
import 'package:genusian_smart_mobile_app/bloc/sertifikat/sertifikat_event.dart';
import 'package:genusian_smart_mobile_app/bloc/sertifikat/sertifikat_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/sertitifikat.dart';
import '../../services/sertifikat_services.dart';

class SertifikatBloc extends Bloc<SertifikatEvent, SertifikatState> {
  SertifikatBloc() : super(SertifikatInitial()) {
    on<LoadSertifikatEvent>((event, emit) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      int? nim = pref.getInt("nim");
      try {
        List<SertifikatModel> sertifikat =
            await SertifikatServices.getSertifikat(nim!);
        emit(SertifikatLoadstate(sertifikat));
      } catch (_) {}
    });
    on<PostSertifikatEvent>((event, emit) async {
      try {
        await SertifikatServices.postSertifikat(
            penghargaan: event.penghargaan,
            kategori: event.kategori,
            penerbit: event.penerbit,
            fileName: event.fileName,
            filePath: event.filePath,
            tanggalDapat: event.tanggalDapat,
            point: event.point);
        emit(SertifikatPostState());
      } catch (_) {}
    });
    on<PutSertifikatEvent>((event, emit) async {
      try {
        await SertifikatServices.putSertifikat(
          id: event.id,
          penghargaan: event.penghargaan,
          kategori: event.kategori,
          penerbit: event.penerbit,
          fileName: event.fileName,
          filePath: event.filePath,
          tanggalDapat: event.tanggalDapat,
        );
        emit(SertifikatPutState());
      } catch (_) {}
    });
    on<DeleteSertifikatEvent>((event, emit) async {
      await SertifikatServices.deletSertifikat(event.id);
      emit(SertifikatDeleteState());
    });
  }
}
