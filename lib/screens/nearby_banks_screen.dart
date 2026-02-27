import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NearbyBanksScreen extends StatefulWidget {
  const NearbyBanksScreen({super.key});

  @override
  State<NearbyBanksScreen> createState() => _NearbyBanksScreenState();
}

class _NearbyBanksScreenState extends State<NearbyBanksScreen> {

  List banks = [];
  bool isLoading = true;

  final String apiKey = "YOUR API KEY";

  @override
  void initState() {
    super.initState();
    fetchNearbyBanks();
  }

  Future<void> fetchNearbyBanks() async {
    try {
      // 🔹 Get Current Position
      LocationPermission permission =
      await Geolocator.requestPermission();

      Position position =
      await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      double lat = position.latitude;
      double lng = position.longitude;

      // 🔹 Google Places API URL
      String url =
          "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
          "?location=$lat,$lng"
          "&radius=3000"
          "&type=bank"
          "&key=$apiKey";

      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);

      setState(() {
        banks = data["results"];
        isLoading = false;
      });

    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> openMap(double lat, double lng) async {
    final Uri mapUrl = Uri.parse(
      "https://www.google.com/maps/dir/?api=1"
          "&destination=$lat,$lng"
          "&travelmode=driving",
    );

    await launchUrl(mapUrl, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Banks"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : banks.isEmpty
          ? const Center(child: Text("No banks found"))
          : ListView.builder(
        itemCount: banks.length,
        itemBuilder: (context, index) {

          final bank = banks[index];
          final name = bank["name"];
          final lat = bank["geometry"]["location"]["lat"];
          final lng = bank["geometry"]["location"]["lng"];

          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              leading: const Icon(Icons.account_balance),
              title: Text(name),
              subtitle: const Text("Tap for directions"),
              trailing:
              const Icon(Icons.arrow_forward_ios),
              onTap: () => openMap(lat, lng),
            ),
          );
        },
      ),
    );
  }
}