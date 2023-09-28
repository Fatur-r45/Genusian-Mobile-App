import 'package:bloc/bloc.dart';
import 'package:genusian_smart_mobile_app/model/get_all_data_from_mahasiswa.dart';
import 'package:genusian_smart_mobile_app/services/mahasiswaServices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/mahasiswa.dart';
import 'mahasiswa_event.dart';
import 'mahasiswa_state.dart';

class MahasiswaBloc extends Bloc<MahasiswaEvent, MahasiswaState> {
  MahasiswaBloc() : super(MahasiswaInitial()) {
    on<LoadMahasiswa>((event, emit) async {
      try {
        emit(MahasiswaLoadingState());
        SharedPreferences pref = await SharedPreferences.getInstance();
        int? nim = pref.getInt("nim");
        if (nim != null) {
          Mahasiswa? mahasiswa = await MahasiswaServices.getMahasiswa(nim);
          List<Mahasiswa>? allMahasiswa = await Mahasiswa.getAllMahasiswa();
          if (mahasiswa != null && allMahasiswa != null) {
            emit(MahasiswaLoadState(mahasiswa, allMahasiswa));
          }
        }
      } catch (_) {}
    });
    on<UpdateAboutMe>((event, emit) async {
      try {
        await MahasiswaServices.putAboutMe(event.aboutMe);
        emit(MahasiswaAboutState());
      } catch (_) {}
    });
    on<EditMahasiswa>((event, emit) async {
      try {
        await MahasiswaServices.putMahasiswa(
            event.nama, event.jurusan, event.tempatLahir, event.tanggalLahir);
        emit(MahasiswaEditState());
      } catch (_) {}
    });
    on<SearchMahasiswaEvent>((event, emit) async {
      try {
        List<AllDataMahasiswa>? mahasiswaSearch =
            await MahasiswaServices.getMahasiswaBySearch(event.input);
        if (mahasiswaSearch != null) {
          emit(MahasiswaSearchState(mahasiswaSearch));
        }
      } catch (_) {}
    });
  }
}
