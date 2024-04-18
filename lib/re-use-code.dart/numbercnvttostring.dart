String convertToWords(int number) {
  if (number == 0) return 'zero';
  if (number < 0) return 'minus ${convertToWords(-number)}';

  String result = '';
  List<String> units = [
    '',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];
  List<String> teens = [
    'ten',
    'eleven',
    'twelve',
    'thirteen',
    'fourteen',
    'fifteen',
    'sixteen',
    'seventeen',
    'eighteen',
    'nineteen'
  ];
  List<String> tens = [
    '',
    '',
    'twenty',
    'thirty',
    'forty',
    'fifty',
    'sixty',
    'seventy',
    'eighty',
    'ninety'
  ];

  if (number < 10) {
    result = units[number];
  } else if (number < 20) {
    result = teens[number - 10];
  } else if (number < 100) {
    result = tens[number ~/ 10] +
        ((number % 10 != 0) ? '-' : '') +
        units[number % 10];
  } else if (number < 1000) {
    result =
        '${units[number ~/ 100]} hundred${(number % 100 != 0) ? ' ' : ''}${convertToWords(number % 100)}';
  } else if (number < 1000000) {
    result =
        '${convertToWords(number ~/ 1000)} thousand${(number % 1000 != 0) ? ' ' : ''}${convertToWords(number % 1000)}';
  } else if (number < 1000000000) {
    result =
        '${convertToWords(number ~/ 1000000)} million${(number % 1000000 != 0) ? ' ' : ''}${convertToWords(number % 1000000)}';
  } else {
    result =
        '${convertToWords(number ~/ 1000000000)} billion${(number % 1000000000 != 0) ? ' ' : ''}${convertToWords(number % 1000000000)}';
  }

  return result;
}

void main() {
  int amount = -12464;
  String amountString = convertToWords(amount);
  print(
      amountString); // Output: "minus twelve thousand four hundred sixty-four"
}
