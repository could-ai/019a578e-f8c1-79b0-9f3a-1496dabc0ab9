import '../models/lottery.dart';

class LotteryData {
  static Map<String, List<Lottery>> getLotteriesByCountry() {
    return {
      "Costa Rica": [
        Lottery(
          name: "TICA",
          drawTimes: ["12:55 PM", "4:30 PM", "7:30 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "REVENTADOS",
          drawTimes: ["12:55 PM", "4:30 PM", "7:30 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "MONAZO",
          drawTimes: ["12:55 PM", "4:30 PM", "7:30 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "PREMIO MAYOR",
          drawTimes: ["11:00 AM", "10:30 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "PAPA CALIENTE",
          drawTimes: ["4:00 PM", "11:30 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "PAPA CALIENTE TRIPLETA",
          drawTimes: ["4:00 PM", "11:30 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "LOTTO",
          drawTimes: ["7:30 PM"],
          daysOfWeek: [1, 3, 6], // Monday, Wednesday, Saturday
        ),
        Lottery(
          name: "LOTTO REVANCHA",
          drawTimes: ["7:30 PM"],
          daysOfWeek: [1, 3, 6], // Monday, Wednesday, Saturday
        ),
      ],
      "Nicaragua": [
        Lottery(
          name: "LOTTO",
          drawTimes: ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "FECHAS",
          drawTimes: ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "MULTI X",
          drawTimes: ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "JUEGA 3",
          drawTimes: ["12:00 PM", "3:00 PM", "6:00 PM", "9:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
      ],
      "Colombia": [
        Lottery(
          name: "ANTIOQUEÑA",
          drawTimes: ["9:00 AM", "3:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
      ],
      "República Dominicana": [
        Lottery(
          name: "ANGUILA",
          drawTimes: [
            "6:00 AM",
            "7:00 AM",
            "8:00 AM",
            "9:00 AM",
            "10:00 AM",
            "11:00 AM",
            "12:00 PM",
            "1:00 PM",
            "2:00 PM",
            "3:00 PM",
            "4:00 PM",
            "5:00 PM",
            "6:00 PM",
            "7:00 PM",
            "8:00 PM"
          ],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "LEIDSA",
          drawTimes: ["7:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "DOMI",
          drawTimes: ["12:30 PM", "7:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "PRIMERA",
          drawTimes: ["10:00 AM", "6:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "QUINIELON",
          drawTimes: ["10:00 AM", "6:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "LOTEKA",
          drawTimes: ["6:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "KING LOTTERY",
          drawTimes: ["10:30 AM", "5:30 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "LA SUERTE",
          drawTimes: ["10:30 AM", "4:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "REAL",
          drawTimes: ["4:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "LOTEDOM",
          drawTimes: ["10:00 AM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
      ],
      "Honduras": [
        Lottery(
          name: "HONDUREÑA",
          drawTimes: ["11:00 AM", "3:00 PM", "9:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
        Lottery(
          name: "JUEGA 3",
          drawTimes: ["11:00 AM", "3:00 PM", "9:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
      ],
      "Panamá": [
        Lottery(
          name: "PANAMEÑA",
          drawTimes: ["2:00 PM"],
          daysOfWeek: [3, 7], // Wednesday and Sunday
        ),
      ],
      "Florida": [
        Lottery(
          name: "FLORIDA",
          drawTimes: ["11:30 AM", "7:30 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
      ],
      "Nueva York": [
        Lottery(
          name: "NEW YORK",
          drawTimes: ["12:30 PM", "8:30 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
      ],
      "El Salvador": [
        Lottery(
          name: "SALVADOREÑA",
          drawTimes: ["11:00 AM", "9:00 PM"],
          daysOfWeek: [1, 2, 3, 4, 5, 6, 7],
        ),
      ],
    };
  }

  static String getDaysOfWeekString(List<int> days) {
    if (days.length == 7) {
      return "Todos los días";
    }
    List<String> dayNames = [];
    for (int day in days) {
      switch (day) {
        case 1:
          dayNames.add("Lun");
          break;
        case 2:
          dayNames.add("Mar");
          break;
        case 3:
          dayNames.add("Mié");
          break;
        case 4:
          dayNames.add("Jue");
          break;
        case 5:
          dayNames.add("Vie");
          break;
        case 6:
          dayNames.add("Sáb");
          break;
        case 7:
          dayNames.add("Dom");
          break;
      }
    }
    return dayNames.join(", ");
  }
}
