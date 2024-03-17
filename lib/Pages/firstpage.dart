import 'package:flutter/material.dart';
import 'package:trail2/Pages/CalculationPage.dart'; // Import the CalculationPage

class CropDetailsPage extends StatefulWidget {
  @override
  _CropDetailsPageState createState() => _CropDetailsPageState();
}

class _CropDetailsPageState extends State<CropDetailsPage> {
  TextEditingController _cropSpacingController = TextEditingController();
  TextEditingController _rowSpacingController = TextEditingController();
  TextEditingController _dripperDischargeController = TextEditingController();

  String _selectedCrop = '--Select Variety--';
  String _selectedDuration = '--Select Duration--';
  String _selectedWettingArea = '--Select Area Wetting Percentage--';

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.purple[900], // Dark purple background
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text('Crop Details'),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: SingleChildScrollView(
        
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.deepPurple[200], // Light purple background
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDropdownButton(
                'Crop Name',
                _selectedCrop,
                ['--Select Variety--', 'Tomato', 'Cucumber', 'Capsicum'],
                (String? newValue) {
                  setState(() {
                    _selectedCrop = newValue!;
                  });
                },
                'Variety', // Hint text
              ),
              SizedBox(height: 20.0),
              buildDropdownButton(
                'Crop Duration',
                _selectedDuration,
                ['--Select Duration--', '90', '110', '150'],
                (String? newValue) {
                  setState(() {
                    _selectedDuration = newValue!;
                  });
                },
                'Number of days', // Hint text
              ),
              SizedBox(height: 20.0),
              buildDatePickerButton('Sowing Date'),
              SizedBox(height: 20.0),
              buildDropdownButton(
                'Area of Wetting',
                _selectedWettingArea,
                ['--Select Area Wetting Percentage--', '50', '70', '80'],
                (String? newValue) {
                  setState(() {
                    _selectedWettingArea = newValue!;
                  });
                },
                'Percentage', // Hint text
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _rowSpacingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Row Spacing',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _cropSpacingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Crop Spacing',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _dripperDischargeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Dripper Discharge',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to CalculationPage and pass crop details
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalculationPage(
                        selectedCrop: _selectedCrop,
                        selectedDuration: _selectedDuration,
                        selectedDate: _selectedDate,
                        selectedWettingArea: _selectedWettingArea,
                        rowSpacing: _rowSpacingController.text,
                        cropSpacing: _cropSpacingController.text,
                        dripperDischarge: _dripperDischargeController.text,
                      ),
                    ),
                  );
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdownButton(
    String labelText,
    String value,
    List<String> items,
    Function(String?) onChanged,
    String hintText,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            color: Colors.white, // Dropdown background color
          ),
          child: DropdownButton<String>(
            value: value,
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text(hintText),
            isExpanded: true,
            underline: SizedBox(), // Remove the underline
            style: TextStyle(color: Colors.black), // Text color
          ),
        ),
      ],
    );
  }

  Widget buildDatePickerButton(String hintText) {
    String formattedDate =
        '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hintText),
        TextButton(
          onPressed: () {
            _selectDate(context);
          },
          child: Text(
            formattedDate,
            style: TextStyle(color: Colors.black), // Text color
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white), // Background color
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void saveCropDetails() async {
    // Implement saving crop details to Firebase or other storage here
    print('Crop details saved');
  }
}
