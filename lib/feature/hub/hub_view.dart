import 'package:flutter/material.dart';

class HubView extends StatelessWidget {
  const HubView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CostumRow(),
        CostumRow(),
        CostumRow(),
      ],
    );
  }
}

class CostumRow extends StatelessWidget {
  const CostumRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
                height: 100,
                child: const Center(child: Text('Container 1')),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
                height: 100,
                child: const Center(child: Text('Container 1')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
