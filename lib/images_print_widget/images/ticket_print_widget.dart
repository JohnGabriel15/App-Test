// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TicketPrintWidget extends StatelessWidget {
  const TicketPrintWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget spacer = const SizedBox(
      height: 20,
    );
    Widget divider = Divider(
      height: 1,
      thickness: 2,
      color: Theme.of(context).colorScheme.primary,
    );

    return Material(
      child: Wrap(
        children: List.generate(5, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spacer,
              Center(
                child: Text(
                  'Loja de Teste',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              spacer,
              Center(
                child: Text(
                  '14/03/2015 as 15:47',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              spacer,
              Container(
                color: Colors.black,
                height: 120,
                width: double.maxFinite,
                child: Center(
                  child: Text(
                    'Produto teste coquinha',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              spacer,
              Center(
                child: Text(
                  'R\$ 150.33',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                ),
              ),
              spacer,
              Center(
                child: Text(
                  'Identificador 14',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                ),
              ),
              spacer,
              Center(
                child: Text(
                  'Ficha',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                ),
              ),
              spacer,
              divider,
            ],
          );
        }),
      ),
    );
  }
}
