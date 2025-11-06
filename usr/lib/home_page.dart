import "package:flutter/material.dart";
import "models/country.dart";
import "country_lotteries_page.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Country> countries = [
      Country(name: "Costa Rica", flag: "🇨🇷"),
      Country(name: "Nicaragua", flag: "🇳🇮"),
      Country(name: "Honduras", flag: "🇭🇳"),
      Country(name: "El Salvador", flag: "🇸🇻"),
      Country(name: "Florida", flag: "🇺🇸"),
      Country(name: "Nueva York", flag: "🇺🇸"),
      Country(name: "República Dominicana", flag: "🇩🇴"),
      Country(name: "Colombia", flag: "🇨🇴"),
      Country(name: "Panamá", flag: "🇵🇦"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Loterías por País"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Text(country.flag, style: const TextStyle(fontSize: 32)),
              title: Text(country.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CountryLotteriesPage(country: country),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
