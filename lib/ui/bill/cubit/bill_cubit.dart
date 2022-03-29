import 'package:bloc/bloc.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:equatable/equatable.dart';

part 'bill_state.dart';

class BillCubit extends Cubit<BillState> {
  
  BillCubit() : super(BillInitial());

  // BluetoothPrint bluetoothPrint = BluetoothPrint.instance;

  // print() async {
  //   bluetoothPrint.startScan(timeout: const Duration(seconds: 4));
  //   await bluetoothPrint.connect(await bluetoothPrint.scanResults.first.);
  // }
}
