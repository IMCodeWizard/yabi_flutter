


import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yabi_test/core/data_models/built_server_result_model/built_server_result.dart';

import '../data_models/built_guest_model/built_guest.dart';
import '../services/guest_service/guest_api_service.dart';


class GuestDataManager {

  // Singleton instance & factory method to access
  static final GuestDataManager _instance = GuestDataManager._();
  factory GuestDataManager() => _instance;
  GuestDataManager._();


  //RxDart configs & data notifier
  final _myListSubject = BehaviorSubject<List<BuiltGuest>>.seeded([]);
  Stream<List<BuiltGuest>> get collectionDataStream => _myListSubject.stream;

  void deleteItem(BuiltGuest itemToDelete) {
    final newList = List.of(_myListSubject.value)..remove(itemToDelete);
    _myListSubject.add(newList);
  }

  void updateItem(BuiltGuest updatedItem) {
    final newList = List.of(_myListSubject.value);
    final index = newList.indexWhere((item) => item.id == updatedItem.id);
    newList[index] = updatedItem;
    _myListSubject.add(newList);
  }

  void createItem(BuiltGuest guest) {
    final newList = List.of(_myListSubject.value)..add(guest);
    _myListSubject.add(newList);
  }


  //Remote data methods
  GuestApiService guestApiService = GuestApiService.create();
  BuiltList<BuiltGuest> collectionData = BuiltList();
  bool inProcess = false;

  void prepareDataCollection() async {
    inProcess = true;
    Response<BuiltList<BuiltGuest>> guestList = await guestApiService.getGuests();
    inProcess = false;

    collectionData = guestList.body ?? BuiltList();
    _myListSubject.add(collectionData.asList());
  }

  Future<void> createRemoteGuestData(BuiltGuest guest) async {
    inProcess = true;
    ///Note: It's can be more efficient if result will contains the guest data. In that case I will can not call the get method for all data
    Response<BuiltServerResult> createResponse = await guestApiService.createGuest(guest);
    inProcess = false;

    //Calling GET to receive updated collection from remote
    prepareDataCollection();
  }


  Future<void> updateRemoteGuestData(BuiltGuest guest) async {
    inProcess = true;
    Response<BuiltServerResult> updateResponse = await guestApiService.updateGuest(guest);
    inProcess = false;

    updateItem(guest);
  }

  Future<void> deleteRemoteGuestData(BuiltGuest guest) async {
    inProcess = true;

    Response<BuiltServerResult> updateResponse = await guestApiService.deleteGuest(guest);
    inProcess = false;

    deleteItem(guest);
  }
}