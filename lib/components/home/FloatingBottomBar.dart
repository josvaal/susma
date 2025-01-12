import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FloatingBottomBar extends StatefulWidget {
  final int pageIndex;
  final void Function(int) destinationSelected;
  const FloatingBottomBar(
      {super.key, required this.pageIndex, required this.destinationSelected});

  @override
  State<FloatingBottomBar> createState() => _FloatingBottomBarState();
}

class _FloatingBottomBarState extends State<FloatingBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
          width: 2,
        ),
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(50),
      ),
      child: NavigationBar(
        onDestinationSelected: widget.destinationSelected,
        selectedIndex: widget.pageIndex,
        backgroundColor: Colors.transparent,
        elevation: 0,
        destinations: const <Widget>[
          NavigationDestination(
            icon: ShadImage(LucideIcons.house),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: ShadImage(LucideIcons.chartArea),
            label: 'Reporte',
          ),
          NavigationDestination(
            icon: ShadImage(LucideIcons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
