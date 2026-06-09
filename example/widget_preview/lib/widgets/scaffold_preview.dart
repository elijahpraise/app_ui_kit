import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/flutter_ui_kit.dart';

class ScaffoldPreview extends StatelessWidget {
  const ScaffoldPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('BaseScaffold: Wraps Scaffold + AnnotatedRegion'),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: BaseScaffold(
            appBar: AppBarV1(hasLeading: false, title: const Text('BaseScaffold')),
            body: const Center(child: Text('BaseScaffold body')),
          ),
        ),
        const SizedBox(height: 16),
        const Text('ScaffoldV1: BaseScaffold + LoadingOverlayV1'),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ScaffoldV1(
            appBar: const AppBarV1(hasLeading: false, title: Text('ScaffoldV1')),
            body: const Center(child: Text('ScaffoldV1 body')),
            isLoading: false,
          ),
        ),
        const SizedBox(height: 16),
        const Text('LoadingOverlayV1 (isLoading=true):'),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: LoadingOverlayV1(
            isLoading: true,
            child: const Center(child: Text('Content underneath')),
          ),
        ),
      ],
    );
  }
}
