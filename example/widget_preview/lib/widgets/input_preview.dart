import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

class InputPreview extends StatelessWidget {
  const InputPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('BaseTextField:'),
        const SizedBox(height: 8),
        BaseTextField(
          hintText: 'Enter text...',
          labelText: 'Label',
        ),
        const SizedBox(height: 12),
        BaseTextField(
          hintText: 'With icon',
          prefixIcon: const Icon(Icons.search),
        ),
        const SizedBox(height: 12),
        BaseTextField(
          hintText: 'Error state',
          errorText: 'This field is required',
        ),
        const SizedBox(height: 16),
        const Text('InputField (label + field):'),
        const SizedBox(height: 8),
        InputField(
          label: 'Email',
          hintText: 'Enter your email',
        ),
        const SizedBox(height: 16),
        const Text('PasswordField:'),
        const SizedBox(height: 8),
        const PasswordField(),
        const SizedBox(height: 16),
        const Text('SearchFeatureField:'),
        const SizedBox(height: 8),
        const SearchFeatureField(),
        const SizedBox(height: 16),
        const Text('SearchInputField (tap to open):'),
        const SizedBox(height: 8),
        SearchInputField<String>(
          items: const [
            InputItem(label: 'Option 1', value: '1'),
            InputItem(label: 'Option 2', value: '2'),
          ],
          onSelected: (item) {},
          hintText: 'Select...',
        ),
      ],
    );
  }
}
