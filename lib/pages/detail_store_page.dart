import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailStorePage extends StatefulWidget {
  var store;

  DetailStorePage(this.store);

  @override
  State<DetailStorePage> createState() => _DetailStorePageState(store);
}

class _DetailStorePageState extends State<DetailStorePage> {
  var store;

  _DetailStorePageState(this.store);

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set<Marker>();

  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(store['name'])),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
              target: LatLng(store['latitude'], store['longitude']),
              zoom: 15,
            ),
            markers: _markers,
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
              // _controller.complete(controller);
              _showMarker();
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 200,
            offset: 50,
          )
        ],
      ),
    );
  }

  void _showMarker() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(store['name']),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(store['latitude'], store['longitude']),
        //   infoWindow: InfoWindow(
        //       title: store['name'], snippet: "Telefono: ${store['phone']}"),
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(store['urlPicture']),
                          fit: BoxFit.fitWidth,
                          filterQuality: FilterQuality.high),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      color: Colors.blue,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Horario: ${store['schedule']}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Dirección: ${store['address']}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Teléfono: ${store['phone']}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10.0),
                    ),
                  ),
                ],
              ),
            ),
            LatLng(store['latitude'], store['longitude']),
          );
        },
      ));
    });
  }
}
