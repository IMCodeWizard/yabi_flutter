import 'package:flutter/material.dart';
import 'package:yabi_test/core/utils/custom_theme_data.dart';

import '../../core/managers/guest_data_manager.dart';
import '../../core/data_models/built_guest_model/built_guest.dart';
import '../../custom_widgets/app_bar.dart';
import '../../custom_widgets/basic_button.dart';
import '../../custom_widgets/hollow_button.dart';

class GuestDetailsScreen extends StatefulWidget {
  final Object? item;

  const GuestDetailsScreen({super.key, required this.item});

  @override
  State<GuestDetailsScreen> createState() => _GuestDetailsScreenState();
}

class _GuestDetailsScreenState extends State<GuestDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final guestDataManager = GuestDataManager();

  final TextEditingController _guestNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();

  bool _formEnabled = true;
  bool _isEditMode = false;


  //Data handling
  void _prepareGuestDetailsIfNeeded() {
    if (widget.item == null) return;

    _formEnabled = false;
    _isEditMode = true;

    final guest = widget.item as BuiltGuest;

    _guestNameController.text = guest.name;
    _phoneNumberController.text = guest.phone;
    _emailAddressController.text = guest.email;
  }

  Future<void> _updateGuestDataAction() async {
    String guestName = _guestNameController.text.trim();
    String phoneNumber = _phoneNumberController.text.trim();
    String emailAddress = _emailAddressController.text.trim();

    final guest = widget.item as BuiltGuest;

    BuiltGuest updatedGuest = guest.rebuild((b) => b
      ..name = guestName
      ..phone = phoneNumber
      ..email = emailAddress);

    await guestDataManager.updateRemoteGuestData(updatedGuest);

    if (context.mounted) Navigator.of(context).pop();
  }

  Future<void> _createGuestDataAction() async {
    String guestName = _guestNameController.text.trim();
    String phoneNumber = _phoneNumberController.text.trim();
    String emailAddress = _emailAddressController.text.trim();

    BuiltGuest newGuest = BuiltGuest((b) => b
      ..name = guestName
      ..phone = phoneNumber
      ..email = emailAddress);

    await GuestDataManager().createRemoteGuestData(newGuest);

    if (context.mounted) Navigator.of(context).pop();
  }

  void _deleteGuestDataAction() {
    final guest = widget.item as BuiltGuest;

    GuestDataManager().deleteRemoteGuestData(guest);

    if (context.mounted) Navigator.of(context).pop();
  }


  //Setup UI Elements
  List<Widget> actions() {
    return _isEditMode == false
        ? []
        : [
      IconButton(
        onPressed: () {
          setState(() {
            _formEnabled = !_formEnabled;
          });
        },
        icon: const Icon(Icons.edit),
      ),
    ];
  }

  InputDecoration inputDecoration() {
    return const InputDecoration(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: YBColors.txtFieldUnderlineInputBorderColor),
      ),
    );
  }

  Widget prepareFromActionButtons() {
    if (_isEditMode) {
      if (_formEnabled) {
        return BasicActionButton(
          title: 'Update',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _updateGuestDataAction();
            }
          },
        );
      } else {
        return HollowActionButton(
          title: 'Delete',
          onPressed: () {
            _showDeleteConfirmation();
          },
        );
      }
    } else {
      return BasicActionButton(
        title: 'Submit!',
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _createGuestDataAction();
          }
        },
      );
    }
  }

  void _showDeleteConfirmation() async {
    bool? shouldDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this guest?'),
          actions: [
            TextButton(
              child: const Text(
                'Cancel',
                style: CustomTextStyle.cancelDialogButtonTextStyle,
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text(
                'Delete',
                style: CustomTextStyle.confirmDialogButtonTextStyle,
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (shouldDelete == true) {
      _deleteGuestDataAction();
    }
  }


  //Lifecycle
  @override
  void initState() {
    _prepareGuestDetailsIfNeeded();
    super.initState();
  }

  @override
  void dispose() {
    _guestNameController.dispose();
    _phoneNumberController.dispose();
    _emailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YBAppBar(
        title: _isEditMode ? 'Details' : 'Invite Guest',
        actions: actions(),
      ),
      backgroundColor: YBColors.mainBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Guest Name',
                style: CustomTextStyle.hintDetailsTextStyle,
              ),
              TextFormField(
                controller: _guestNameController,
                style: CustomTextStyle.valueDetailsTextStyle,
                enabled: _formEnabled,
                decoration: inputDecoration(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a guest name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Phone Number',
                style: CustomTextStyle.hintDetailsTextStyle,
              ),
              TextFormField(
                controller: _phoneNumberController,
                style: CustomTextStyle.valueDetailsTextStyle,
                enabled: _formEnabled,
                decoration: inputDecoration(),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Email Address',
                style: CustomTextStyle.hintDetailsTextStyle,
              ),
              TextFormField(
                controller: _emailAddressController,
                style: CustomTextStyle.valueDetailsTextStyle,
                enabled: _formEnabled,
                decoration: inputDecoration(),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  }
                  else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),
              prepareFromActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
