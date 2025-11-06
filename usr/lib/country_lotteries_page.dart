import "package:flutter/material.dart";
import "models/country.dart";
import "models/lottery.dart";

class CountryLotteriesPage extends StatelessWidget {
  final Country country;

  const CountryLotteriesPage({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    // Mock data for lotteries, this will be replaced with real data later
    final List<Lottery> lotteries = [
      Lottery(name: "Lotería Nacional"),
      Lottery(name: "Tiempos"),
      Lottery(name: "Monazos"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Loterías de ${country.name}"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView.builder(
        itemCount: lotteries.length,
        itemBuilder: (context, index) {
          final lottery = lotteries[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(lottery.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: const Text("Toque para ver resultados"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to lottery details page
              },
            ),
          );
        },
      ),
    );
  }
}
