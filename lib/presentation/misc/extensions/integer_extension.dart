extension IntExtension on int {
  String toIDRCurrencyFormat() {
    return 'IDR ${toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }
}
