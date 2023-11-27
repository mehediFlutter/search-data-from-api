import 'package:flutter/material.dart';

class DetailsVehicle extends StatefulWidget {
  final String? imageName;
  final String? VehicleName;
  final String? VehiceId;
  const DetailsVehicle(
      {super.key, this.imageName, this.VehicleName, this.VehiceId});

  @override
  State<DetailsVehicle> createState() => _DetailsVehicleState();
}

class _DetailsVehicleState extends State<DetailsVehicle> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                widget.VehicleName.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Image.network(
                  "https://pilotbazar.com/storage/vehicles/${widget.imageName}"),
              Text(widget.VehiceId.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
