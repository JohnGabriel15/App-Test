// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class ProductionPrintWidget extends StatelessWidget {
  const ProductionPrintWidget({
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ' Loja Teste',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          spacer,
          Container(
            color: Colors.black,
            height: 100,
            width: double.maxFinite,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mesa 14',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'VIA DE PRODUÇÃO',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
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
          divider,
          Row(
            children: [
              Expanded(
                  child: Text(
                'QTD',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              )),
              Expanded(
                  child: Text(
                'ITEM',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              )),
              Expanded(
                  child: Text(
                '',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              )),
              Expanded(
                  child: Text(
                '',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              )),
            ],
          ),
          divider,
          Wrap(
            children: List.generate(
              8,
              (indexOrder) => Wrap(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        spacer,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '5 UN',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                            ),
                            Text(
                              ' Coca Cola',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                            ),
                          ],
                        ),
                        spacer,
                        divider,
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          spacer,
          Text(
            'Identificador 350',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
