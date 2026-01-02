class DateFormatter {
  static String formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return 'HOJE';
    }
    
    try {
      final date = DateTime.parse(dateString);
      final day = date.day.toString().padLeft(2, '0');
      
      // Month abbreviations in Portuguese
      final months = ['JAN', 'FEV', 'MAR', 'ABR', 'MAI', 'JUN', 'JUL', 'AGO', 'SET', 'OUT', 'NOV', 'DEZ'];
      final month = months[date.month - 1];
      
      final year = date.year.toString();
      
      return '$day $month $year';
    } catch (e) {
      return 'HOJE';
    }
  }
}
