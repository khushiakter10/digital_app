import 'dart:math';
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class UserDirectionScreen extends StatefulWidget {
  final double destinationLat;
  final double destinationLng;

  const UserDirectionScreen({
    required this.destinationLat,
    required this.destinationLng,
    Key? key,
  }) : super(key: key);

  @override
  State<UserDirectionScreen> createState() => _UserDirectionScreenState();
}

class _UserDirectionScreenState extends State<UserDirectionScreen> {
  late GoogleMapController _mapController;
  LatLng? _currentPosition;
  final Set<Polyline> _polylines = {};
  bool _isLoading = true;
  String _errorMessage = '';
  final List<LatLng> _polylineCoordinates = [];
  BitmapDescriptor? _currentLocationIcon;
  String _duration = '';
  String _distance = '';
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadCustomMarkerIcon();
    _getCurrentLocation();
  }

  Future<void> _loadCustomMarkerIcon() async {
    try {
      // For proper sizing (48x48 logical pixels)
      final ImageConfiguration imageConfig = ImageConfiguration(
        size: Size(48, 48),
        devicePixelRatio: MediaQuery.of(context).devicePixelRatio,
      );

      _currentLocationIcon = await BitmapDescriptor.fromAssetImage(
        imageConfig,
        'assets/images/locationPinImage.png',
        mipmaps: true,
      );
    } catch (e) {
      debugPrint('Error loading custom marker: $e');
      _currentLocationIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Location services are disabled.';
        });
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _isLoading = false;
            _errorMessage = 'Location permissions are denied';
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Location permissions are permanently denied';
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });

      await _getPolyline();
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error getting location: ${e.toString()}';
      });
    }
  }

  Future<void> _getPolyline() async {
    try {
      final polylinePoints = PolylinePoints();
      final origin = PointLatLng(_currentPosition!.latitude, _currentPosition!.longitude);
      final destination = PointLatLng(widget.destinationLat, widget.destinationLng);
      const mode = TravelMode.driving;

      final result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: 'AIzaSyDmNO0nvvAkkxk6rYBDQEfVXVQPB9rKlsk',
        request: PolylineRequest(origin: origin, destination: destination, mode: mode),
      );

      if (result.points.isNotEmpty) {
        // Calculate total distance by summing distances between all points
        double totalDistance = 0;
        for (int i = 0; i < result.points.length - 1; i++) {
          totalDistance += _coordinateDistance(
            result.points[i].latitude,
            result.points[i].longitude,
            result.points[i+1].latitude,
            result.points[i+1].longitude,
          );
        }

        // Calculate time (assuming 50 km/h average speed)
        final distanceInKm = totalDistance / 1000;
        final estimatedHours = distanceInKm / 50;
        final durationMinutes = (estimatedHours * 60).round();

        String formatDistance(double meters) {
          if (meters < 1000) return '${meters.round()} m';
          return '${(meters / 1000).toStringAsFixed(1)} km';
        }

        setState(() {
          _distance = formatDistance(totalDistance);
          _duration = '${durationMinutes} min';

          _polylineCoordinates.clear();
          _polylineCoordinates.addAll(
              result.points.map((point) => LatLng(point.latitude, point.longitude))
          );

          _polylines.clear();
          _polylines.add(
            Polyline(
              polylineId: const PolylineId('route'),
              color: Colors.orange,
              width: 5,
              points: _polylineCoordinates,
            ),
          );

          // Update markers
          _markers.clear();
          _markers.addAll({
            Marker(
              markerId: const MarkerId('current'),
              position: _currentPosition!,
              infoWindow: InfoWindow(
                title: 'Your Location',
                snippet: 'Distance to destination: $_distance',
              ),
              icon: _currentLocationIcon ?? BitmapDescriptor.defaultMarker,
              anchor: const Offset(0.5, 0.5),
            ),
            Marker(
              markerId: const MarkerId('destination'),
              position: LatLng(widget.destinationLat, widget.destinationLng),
              infoWindow: InfoWindow(
                title: 'Destination',
                snippet: 'Estimated time: $_duration',
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            ),
          });
        });

        // Zoom to fit both markers
        _mapController.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(
              southwest: LatLng(
                min(_currentPosition!.latitude, widget.destinationLat),
                min(_currentPosition!.longitude, widget.destinationLng),
              ),
              northeast: LatLng(
                max(_currentPosition!.latitude, widget.destinationLat),
                max(_currentPosition!.longitude, widget.destinationLng),
              ),
            ),
            100,
          ),
        );
      } else {
        setState(() {
          _errorMessage = 'No route found between locations';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error getting directions: ${e.toString()}';
      });
    }
  }

// Helper function to calculate distance between two coordinates in meters
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    const p = 0.017453292519943295;
    final a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)) * 1000; // Returns distance in meters
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Directions',style: TextStyle(color: Colors.white),),
        backgroundColor: AppColors.cFF4800,
      ),
      body: _buildMapContent(),
      bottomNavigationBar: _buildInfoBar(),
    );
  }

  Widget _buildMapContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(color: AppColors.cFF4800));
    }

    if (_errorMessage.isNotEmpty) {
      return Center(
        child: Text(
          _errorMessage,
          style: const TextStyle(color: Colors.red, fontSize: 18),
        ),
      );
    }

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: _currentPosition ?? const LatLng(0, 0),
        zoom: 14,
      ),
      polylines: _polylines,
      markers: _markers,
      onMapCreated: (controller) => _mapController = controller,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }

  Widget _buildInfoBar() {
    if (_isLoading || _errorMessage.isNotEmpty) return const SizedBox.shrink();

    return Container(
      height: 110,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoItem(Icons.directions_car, _duration, 'Time'),
          _buildInfoItem(Icons.straighten, _distance, 'Distance'),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color:AppColors.cFF4800),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}