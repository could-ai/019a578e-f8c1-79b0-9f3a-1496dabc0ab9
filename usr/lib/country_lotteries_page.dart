import "package:flutter/material.dart";
import "models/country.dart";
import "models/lottery.dart";
import "data/lottery_data.dart";
import "lottery_details_page.dart";

class CountryLotteriesPage extends StatelessWidget {
  final Country country;

  const CountryLotteriesPage({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    // Get lotteries for this country from the data file
    final Map<String, List<Lottery>> allLotteries = LotteryData.getLotteriesByCountry();
    final List<Lottery> lotteries = allLotteries[country.name] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text("Loterías de ${country.name}"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: lotteries.isEmpty
          ? const Center(
              child: Text(
                "No hay loterías disponibles para este país",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: lotteries.length,
              itemBuilder: (context, index) {
                final lottery = lotteries[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      lottery.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                lottery.drawTimes.join(", "),
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                LotteryData.getDaysOfWeekString(lottery.daysOfWeek),
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LotteryDetailsPage(
                            lottery: lottery,
                            country: country,
                          ),
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
