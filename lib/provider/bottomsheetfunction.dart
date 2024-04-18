import 'package:flutter/cupertino.dart';

class ButtonState extends ChangeNotifier {
  bool _isVisible = false;
  String _selectedImagePath2 = 'assets/add-button 1 (1).png';

  bool get isVisible => _isVisible;
  String get selectedImagePath2 => _selectedImagePath2;

  void toggleVisibility() {
    _isVisible = !_isVisible;
    if (_isVisible) {
      _selectedImagePath2 = 'assets/add-button 1 (3).png';
      // Call the function related to the Third icon
    } else {
      _selectedImagePath2 = 'assets/add-button 1 (1).png';
    }
    notifyListeners();
  }

  void closeFunction() {
    // Add logic to close the function associated with the selected option
    // This could involve resetting some state or performing any cleanup
    _isVisible = false; // Hide the button
    notifyListeners();
  }
}
