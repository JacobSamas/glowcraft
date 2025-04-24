import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _service;
  String? _stylist;
  DateTime? _date;
  TimeOfDay? _time;
  final _notesController = TextEditingController();

  final _services = [
    'Hair Styling',
    'Facials',
    'Nail Art',
    'Spa Therapy',
    'Makeup',
    'Massage',
  ];
  final _stylists = [
    'Ava Lee',
    'Maya Patel',
    'Liam Chen',
    'Sofia Rossi',
    'Noah Kim',
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 180)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.dark(
            primary: const Color(0xFF88FFFF),
            onPrimary: Colors.black,
            surface: const Color(0xFF2A3A6C),
            onSurface: Colors.white,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.dark(
            primary: const Color(0xFF88FFFF),
            onPrimary: Colors.black,
            surface: const Color(0xFF2A3A6C),
            onSurface: Colors.white,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _time = picked);
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _date != null && _time != null) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Appointment booked!'),
          backgroundColor: const Color(0xFF88FFFF),
          behavior: SnackBarBehavior.floating,
        ),
      );
      // Reset form or navigate if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A2C),
      body: Stack(
        children: [
          // Animated glowing header
          Positioned(
            top: 32,
            left: 0,
            right: 0,
            child: Animate(
              effects: [FadeEffect(duration: 800.ms), SlideEffect(begin: Offset(0, -0.1))],
              child: Column(
                children: [
                  Text(
                    'Book Your Appointment',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFB2FFFF),
                      shadows: [
                        Shadow(
                          blurRadius: 18,
                          color: const Color(0xFF88FFFF).withOpacity(0.5),
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    height: 5,
                    width: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF88FFFF), Color(0xFF2A3A6C)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF88FFFF).withOpacity(0.3),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Booking form
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, left: 18, right: 18, bottom: 18),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Animate(
                        effects: [FadeEffect(duration: 700.ms)],
                        child: _GlassField(
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: _inputDecoration('Name', Icons.person),
                            validator: (v) => v == null || v.isEmpty ? 'Enter your name' : null,
                            onSaved: (v) => _name = v,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Animate(
                        effects: [FadeEffect(duration: 800.ms)],
                        child: _GlassField(
                          child: DropdownButtonFormField<String>(
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: const Color(0xFF2A3A6C),
                            decoration: _inputDecoration('Service', Icons.spa),
                            items: _services
                                .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                                .toList(),
                            onChanged: (v) => setState(() => _service = v),
                            validator: (v) => v == null ? 'Select a service' : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Animate(
                        effects: [FadeEffect(duration: 900.ms)],
                        child: _GlassField(
                          child: DropdownButtonFormField<String>(
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: const Color(0xFF2A3A6C),
                            decoration: _inputDecoration('Stylist', Icons.people),
                            items: _stylists
                                .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                                .toList(),
                            onChanged: (v) => setState(() => _stylist = v),
                            validator: (v) => v == null ? 'Select a stylist' : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(
                            child: Animate(
                              effects: [FadeEffect(duration: 1000.ms)],
                              child: _GlassField(
                                child: InkWell(
                                  onTap: _pickDate,
                                  child: InputDecorator(
                                    decoration: _inputDecoration('Date', Icons.calendar_today),
                                    child: Text(
                                      _date == null
                                          ? 'Select date'
                                          : '${_date!.day}/${_date!.month}/${_date!.year}',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Animate(
                              effects: [FadeEffect(duration: 1100.ms)],
                              child: _GlassField(
                                child: InkWell(
                                  onTap: _pickTime,
                                  child: InputDecorator(
                                    decoration: _inputDecoration('Time', Icons.access_time),
                                    child: Text(
                                      _time == null
                                          ? 'Select time'
                                          : _time!.format(context),
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Animate(
                        effects: [FadeEffect(duration: 1200.ms)],
                        child: _GlassField(
                          child: TextFormField(
                            controller: _notesController,
                            style: const TextStyle(color: Colors.white),
                            decoration: _inputDecoration('Notes (optional)', Icons.edit_note),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Animate(
                        effects: [FadeEffect(duration: 1300.ms), ScaleEffect()],
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF88FFFF),
                              foregroundColor: const Color(0xFF2A3A6C),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              elevation: 10,
                            ),
                            onPressed: _submit,
                            child: Text(
                              'Book Now',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xFFB2FFFF)),
      prefixIcon: Icon(icon, color: const Color(0xFFB2FFFF)),
      filled: true,
      fillColor: Colors.white.withOpacity(0.08),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xFF88FFFF), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xFFB2FFFF), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
    );
  }
}

class _GlassField extends StatelessWidget {
  final Widget child;
  const _GlassField({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(0.07),
        border: Border.all(color: const Color(0xFF88FFFF).withOpacity(0.22), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF88FFFF).withOpacity(0.07),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
