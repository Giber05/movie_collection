part of 'default_button.dart';
class _ButtonWrapper extends StatelessWidget {
  final Widget child;
  final bool isFillParent;
  const _ButtonWrapper({required this.child, required this.isFillParent});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: isFillParent ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Expanded(
          flex: isFillParent ? 1 : 0,
          child: child,
        )
      ],
    );
  }
}