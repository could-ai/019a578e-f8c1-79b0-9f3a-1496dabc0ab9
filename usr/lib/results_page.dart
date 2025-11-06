import "package:flutter/material.dart";
import "models/lottery_result.dart";
import "data/lottery_data.dart";

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedCountry;
  String? _selectedLottery;
  String? _selectedTime;

  // TODO: This will be replaced with actual database queries
  List<LotteryResult> _getMockResults() {
    // Return empty list for now - will be populated from database
    return [];
  }

  List<String> _getCountries() {
    return LotteryData.getLotteriesByCountry().keys.toList();
  }

  List<String> _getLotteriesForCountry(String? country) {
    if (country == null) return [];
    final lotteries = LotteryData.getLotteriesByCountry()[country] ?? [];
    return lotteries.map((l) => l.name).toList();
  }

  List<String> _getTimesForLottery(String? country, String? lottery) {
    if (country == null || lottery == null) return [];
    final lotteries = LotteryData.getLotteriesByCountry()[country] ?? [];
    final selectedLottery = lotteries.firstWhere(
      (l) => l.name == lottery,
      orElse: () => lotteries.first,
    );
    return selectedLottery.drawTimes;
  }

  void _resetFilters() {
    setState(() {
      _selectedDate = DateTime.now();
      _selectedCountry = null;
      _selectedLottery = null;
      _selectedTime = null;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      locale: const Locale('es', 'ES'),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final results = _getMockResults();
    final countries = _getCountries();
    final lotteries = _getLotteriesForCountry(_selectedCountry);
    final times = _getTimesForLottery(_selectedCountry, _selectedLottery);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultados del Día"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetFilters,
            tooltip: "Limpiar Filtros",
          ),
        ],
      ),
      body: Column(
        children: [
          // Filters Section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Filtros",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                // Date Filter
                InkWell(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 20),
                        const SizedBox(width: 12),
                        Text(
                          "${_selectedDate.day.toString().padLeft(2, '0')}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Country Filter
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "País",
                    prefixIcon: const Icon(Icons.flag),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedCountry,
                  items: [
                    const DropdownMenuItem(
                      value: null,
                      child: Text("Todos los países"),
                    ),
                    ...countries.map((country) => DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        )),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCountry = value;
                      _selectedLottery = null;
                      _selectedTime = null;
                    });
                  },
                ),
                const SizedBox(height: 12),
                // Lottery Filter
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Lotería",
                    prefixIcon: const Icon(Icons.confirmation_number),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedLottery,
                  items: [
                    const DropdownMenuItem(
                      value: null,
                      child: Text("Todas las loterías"),
                    ),
                    ...lotteries.map((lottery) => DropdownMenuItem(
                          value: lottery,
                          child: Text(lottery),
                        )),
                  ],
                  onChanged: _selectedCountry == null
                      ? null
                      : (value) {
                          setState(() {
                            _selectedLottery = value;
                            _selectedTime = null;
                          });
                        },
                ),
                const SizedBox(height: 12),
                // Time Filter
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Hora del Sorteo",
                    prefixIcon: const Icon(Icons.access_time),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedTime,
                  items: [
                    const DropdownMenuItem(
                      value: null,
                      child: Text("Todas las horas"),
                    ),
                    ...times.map((time) => DropdownMenuItem(
                          value: time,
                          child: Text(time),
                        )),
                  ],
                  onChanged: _selectedLottery == null
                      ? null
                      : (value) {
                          setState(() {
                            _selectedTime = value;
                          });
                        },
                ),
              ],
            ),
          ),
          // Results Section
          Expanded(
            child: results.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inbox_outlined,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "No hay resultados disponibles",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Los resultados aparecerán aquí\ncuando se actualice la base de datos",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final result = results[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      result.lotteryName,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      result.drawTime,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                result.countryName,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Resultado: ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      result.numbers,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}