import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genusian_smart_mobile_app/services/pendidikan_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/pendidikan_model.dart';

part 'pendidikan_event.dart';
part 'pendidikan_state.dart';

class PendidikanBloc extends Bloc<PendidikanEvent, PendidikanState> {
  PendidikanBloc() : super(PendidikanInitial()) {
    on<LoadPendidikanEvent>((event, emit) async {
      SharedPreferences prev = await SharedPreferences.getInstance();
      int? nim = prev.getInt("nim");
      try {
        if (nim != null) {
          List<PendidikanModel>? pendidikan =
              await PendidikanServices.getAllPendidikan(nim);
          if (pendidikan != null) {
            emit(PendidikanLoadState(pendidikan));
          }
        }
      } catch (_) {}
    });
    on<PostPendidikanEvent>((event, emit) async {
      SharedPreferences prev = await SharedPreferences.getInstance();
      int? nim = prev.getInt("nim");
      await PendidikanServices.postPendidikan(
          nim: nim!,
          namaInstansi: event.namaInstansi,
          gelar: event.gelar,
          bidangStudi: event.bidangStudi,
          mulai: event.mulai,
          sampai: event.sampai);
      emit(PendidikanPostState());
    });
    on<PutPendidikanEvent>((event, emit) async {
      await PendidikanServices.putPendidikan(
          id: event.id,
          namaInstansi: event.namaInstansi,
          gelar: event.gelar,
          bidangStudi: event.bidangStudi,
          mulai: event.mulai,
          sampai: event.sampai);
      emit(PendidikanPutState());
    });
    on<DeletePendidikanEvent>((event, emit) async {
      await PendidikanServices.deletPendidikan(event.id);
      emit(PendidikanDeleteState());
    });
  }
}
