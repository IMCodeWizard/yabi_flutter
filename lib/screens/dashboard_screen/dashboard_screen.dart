import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yabi_test/core/utils/custom_theme_data.dart';
import 'package:yabi_test/custom_widgets/app_bar.dart';

import '../../core/managers/guest_data_manager.dart';
import '../../core/data_models/built_guest_model/built_guest.dart';
import '../../core/utils/routers/app_routes.dart';
import '../../screens/dashboard_screen/guest_card_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<BuiltGuest> _collectionData = List.empty();

  //Manage data
  late StreamSubscription<List<BuiltGuest>> _subscription;
  final guestDataManager = GuestDataManager();

  Future _refreshCollectionData() async {
    _subscription = guestDataManager.collectionDataStream.listen((data) {
      setState(() {
        _collectionData = data;
      });
    });

    guestDataManager.prepareDataCollection();
  }


  //Setup UI
  Row _buildFloatingButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            _refreshCollectionData();
          },
          child: const Icon(Icons.refresh),
        ),
        const SizedBox(width: 8),
        FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.guestDetails,
            );
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildDashboard(BuildContext context, List<BuiltGuest> guests) {
    if (guests.isEmpty) {
      return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 16),
              Icon(Icons.error_outline, size: 60),
              Center(
                child: Text(
                  'No Guests were Invited',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Please Invite new Guests to start working',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Image(
                image: AssetImage('images/404_icon.png'),
              ),
            ],
          ),
      );
    }
    else {
      return Center(
        child: ListView.builder(
          itemCount: guests.length,
          itemBuilder: (context, index) {
            return GuestCard(context, guests[index]);
          },
        ),
      );
    }
  }

  //Lifecycle
  @override
  void initState() {
    super.initState();
    _refreshCollectionData();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const YBAppBar(title: 'Dashboard'),
      backgroundColor: YBColors.mainBackgroundColor,
      body: _buildDashboard(context, _collectionData),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.guestDetails,
          );
        },
        backgroundColor: YBColors.btnBasicBackgroundColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
