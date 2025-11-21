import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AireOutlinedButton extends ConsumerWidget {
  final String label;
  const AireOutlinedButton({super.key, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          /// TODO: Implementar cambio de cita
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Implementar cambio de cita'),
              action: SnackBarAction(label: 'OK', onPressed: () {}),
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.grey[300]!),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
