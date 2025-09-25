import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intern_task_tracker/utils/app_theme.dart';
import 'package:intern_task_tracker/widgets/gradient_button.dart';
import 'package:intern_task_tracker/widgets/custom_text_field.dart';

class CreateEditTaskScreen extends StatefulWidget {
  const CreateEditTaskScreen({super.key});

  @override
  State<CreateEditTaskScreen> createState() => _CreateEditTaskScreenState();
}

class _CreateEditTaskScreenState extends State<CreateEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String _priority = 'Medium';
  String _assignee = 'Sarah Johnson';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Task')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                labelText: 'Task Title *',
                hintText: 'Enter task title',
                validator: (value) => value!.isEmpty ? 'This field is required' : null,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Description *',
                hintText: 'Enter description',
                maxLines: 4,
                validator: (value) => value!.isEmpty ? 'This field is required' : null,
              ),
              const SizedBox(height: 20),
              _buildDateField(context),
              const SizedBox(height: 20),
              _buildDropdownField(
                label: 'Priority',
                value: _priority,
                items: ['High', 'Medium', 'Low'],
                onChanged: (value) => setState(() => _priority = value!),
              ),
              const SizedBox(height: 20),
              _buildDropdownField(
                label: 'Assign to *',
                value: _assignee,
                items: ['Sarah Johnson', 'John Doe', 'Mike Chen'],
                onChanged: (value) => setState(() => _assignee = value!),
              ),
              const SizedBox(height: 40),
              GradientButton(
                text: 'Save Task',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Deadline *', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextFormField(
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: _selectedDate == null
                ? 'Select a date'
                : DateFormat.yMMMd().format(_selectedDate!),
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          validator: (value) => _selectedDate == null ? 'Please select a date' : null,
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: const InputDecoration(),
        ),
      ],
    );
  }
}