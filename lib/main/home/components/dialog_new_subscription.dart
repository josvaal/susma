import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final frequentlies = [
  'Mes',
  'Año',
];

class DialogNewSubscription extends StatelessWidget {
  const DialogNewSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text("Nueva subscripción"),
      description:
          Text("Completa los campos para añadir una nueva subscripción"),
      actions: [
        ShadButton(child: Text('Añadir')),
      ],
      child: Container(
        width: 375,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ShadDatePickerFormField(
              placeholder: Text("Última fecha de pago"),
            ),
            ShadInput(
              prefix: LineIcon.paragraph(
                size: 20,
                color: Theme.of(context).colorScheme.onSurface.withValues(
                      alpha: 0.6,
                    ),
              ),
              initialValue: "",
              placeholder: Text("Nombre de la subscripción"),
            ),
            ShadInput(
              prefix: LineIcon.coins(
                size: 20,
                color: Theme.of(context).colorScheme.onSurface.withValues(
                      alpha: 0.6,
                    ),
              ),
              initialValue: "",
              placeholder: Text("Monto que pagas"),
              keyboardType: TextInputType.number,
            ),
            ShadInput(
              prefix: LineIcon.dollarSign(
                size: 20,
                color: Theme.of(context).colorScheme.onSurface.withValues(
                      alpha: 0.6,
                    ),
              ),
              initialValue: "",
              placeholder: Text("Tu moneda local (USD, etc..)"),
            ),
            ShadSelectFormField<String>(
              minWidth: 350,
              initialValue: null,
              options: frequentlies
                  .map((value) => ShadOption(value: value, child: Text(value)))
                  .toList(),
              selectedOptionBuilder: (context, value) => value == 'none'
                  ? const Text("Selecciona la frecuencia")
                  : Row(
                      spacing: 8,
                      children: [
                        LineIcon.tasks(
                          size: 20,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(
                                alpha: 0.6,
                              ),
                        ),
                        Text(value),
                      ],
                    ),
              placeholder: Row(
                spacing: 8,
                children: [
                  LineIcon.tasks(
                    size: 20,
                    color: Theme.of(context).colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                  ),
                  Text(
                    'Selecciona la frecuencia',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
