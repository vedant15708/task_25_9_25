import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const FilterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

const Color primaryColor = Color(0xFFFDBF00);
const Color unselectedColor = Color(0xFFFFF6DD);
const Color backgroundColor = Color(0xFFFFFBF0);
const Color textColor = Color(0xFF4A4A4A);

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final Set<String> _selectedStoreHours = {'24 Hour Service'};
  final Set<String> _selectedPickupOptions = {'Beach Delivery'};
  final Set<String> _selectedAmenities = {'WIFI'};

  void _onTap(String label, Set<String> selectionSet) {
    setState(() {
      if (selectionSet.contains(label)) {
        selectionSet.remove(label);
      } else {
        selectionSet.add(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textColor),
          onPressed: () {
          },
        ),
        title: const Text(
          'Filter',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Store Hours'),
            _buildGroup(
              options: ['24 Hour Service', 'Open Now'],
              selectionSet: _selectedStoreHours,
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Pickup Options'),
            _buildGroup(
              options: [
                'Store Pickup',
                'Curbside',
                'Beach Delivery',
                'Home Delivery',
                'Table Delivery',
                'Office Delivery',
              ],
              selectionSet: _selectedPickupOptions,
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Amenities'),
            _buildGroup(
              options: ['WIFI', 'Online Ordering', 'Parking'],
              selectionSet: _selectedAmenities,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildConfirmButton(),
    );
  }


  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildGroup({
    required List<String> options,
    required Set<String> selectionSet,
  }) {
    return Wrap(
      spacing: 12.0,
      runSpacing: 12.0,
      children: options.map((option) {
        final bool isSelected = selectionSet.contains(option);
        return FilterWidget(
          label: option,
          isSelected: isSelected,
          onTap: () => _onTap(option, selectionSet),
        );
      }).toList(),
    );
  }

  Widget _buildConfirmButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 0,
        ),
        onPressed: () {
          print('Selected Store Hours: $_selectedStoreHours');
          print('Selected Pickup Options: $_selectedPickupOptions');
          print('Selected Amenities: $_selectedAmenities');
        },
        child: const Text(
          'Confirm',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : unselectedColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black87 : textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}










