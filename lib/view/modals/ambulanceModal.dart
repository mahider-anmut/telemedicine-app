import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/themeProvider.dart';
import '../../service/localization.dart';
import '../../utils/themes.dart';
import '../../widgets/customElevatedButton.dart';

class AmbulanceModal extends StatefulWidget {


  const AmbulanceModal({
    super.key,
  });

  @override
  State<AmbulanceModal> createState() => _AmbulanceModalState();
}

class _AmbulanceModalState extends State<AmbulanceModal> {
  late GoogleMapController _mapController;
  LatLng? _currentPosition;
  String _currentAddress = '';
  bool _mapInitialized = false;


  @override
  void initState() {
    super.initState();
    _determinePosition();
  }


  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // You could show a dialog to enable location
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    final position = await Geolocator.getCurrentPosition();

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });

    final placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      setState(() {
        _currentAddress =
        "${place.street}, ${place.locality}, ${place.administrativeArea}";
      });
    }

    if (_mapController != null && !_mapInitialized) {
      _mapController.animateCamera(
        CameraUpdate.newLatLng(_currentPosition!),
      );
      setState(() {
        _mapInitialized = true;
      });
    }
  }


  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;


  }


  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDarkMode = themeProvider.isDarkMode;
    Color backgroundColor = Color(0xFFFFFFFF) ;
    Color textColor = isDarkMode ? Colors.white : Colors.black;

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Stack(
        children: [
          // Google Map covering the entire modal
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
            child: AbsorbPointer(
              absorbing: _currentPosition == null,
              child: GoogleMap(
                onMapCreated: (e) {
                  _onMapCreated(e);
                },
                initialCameraPosition:  CameraPosition(
                  target: _currentPosition ?? const LatLng(11.59777, 37.39587),
                  zoom: 14.0,
                ),
                zoomGesturesEnabled: true,
                scrollGesturesEnabled: true,
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
              ),
            ),
          ),
          // Close button stacked on top of the map
          Positioned(
            top: 16.0,
            right: 16.0,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration:  BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(left: 16.0, top: 16),
                  //   child: Text(
                  //     AppLocalizations.of(context).translate('confirmLocation'),
                  //     style: TextStyle(
                  //       color: textColor,
                  //       fontSize: 20.0,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0, top: 8,right: 8.0),
                    child: Text.rich(
                      TextSpan(
                        text: "Call ambulance to your location at \n",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16.0,
                        ),
                        children: [
                          if (_currentAddress.isNotEmpty)
                            TextSpan(
                              text: _currentAddress,
                              style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.getThemeExtension(context).primaryColor!,
                              ),
                            )
                          else
                            const TextSpan(
                              text: "your current location",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                          const TextSpan(
                            text: " ?",
                          ),
                        ],
                      ),
                    )
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: CustomElevatedButton(
                        label: AppLocalizations.of(context).translate('requestAmbulance'),
                        onPressed: () async {

                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Inner white card

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}