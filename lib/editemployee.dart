import 'package:empleados/addemployee.dart';
import 'package:empleados/constants.dart';
import 'package:empleados/home.dart';
import 'package:empleados/models.dart';
import 'package:empleados/services.dart';
import 'package:flutter/cupertino.dart';

class EditEmployee extends StatefulWidget {
  const EditEmployee({super.key, required this.actual});

  final Empleado actual;

  @override
  _EditEmployeeState createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoPController = TextEditingController();
  final TextEditingController apellidoMController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController fechaNacController = TextEditingController();
  int sueldo = 0;
  late int id;
  late DateTime fecha;
  @override
  void initState() {
    super.initState();
    id = widget.actual.id!;
    nombreController.text = widget.actual.nombre;
    apellidoPController.text = widget.actual.apellidop;
    apellidoMController.text = widget.actual.apellidom;
    areaController.text = widget.actual.area;
    fechaNacController.text = widget.actual.fechanac.toString();
    sueldo = widget.actual.sueldo;
    fecha = widget.actual.fechanac;
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding: const EdgeInsetsDirectional.all(4.0),
        leading: CupertinoNavigationBarBackButton(
          color: secondaryColor,
          previousPageTitle: "Home",
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(
                builder: (context) => const Home(),
              ),
              (route) => false),
        ),
        middle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/pdn-logo.png"),
        ),
      ),
      // resizeToAvoidBottomInset: true,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80.0, vertical: 32.0),
                    child: const Text(
                      "Editar Empleado",
                      style: tsH3Blue,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: const Text(
                      "Ingrese Nombre",
                      style: tsH1Black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CupertinoTextField(
                      padding: const EdgeInsets.all(12.0),
                      // onChanged: (value) => nuevo.nombre = value,
                      controller: nombreController,
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.text,
                      placeholder: widget.actual.nombre,
                      prefix: Container(
                          height: 20.0,
                          margin: const EdgeInsets.only(left: 12.0),
                          child: const Icon(CupertinoIcons.person)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: greyLightColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: const Text(
                      "Ingrese Apellido Paterno",
                      style: tsH1Black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CupertinoTextField(
                      padding: const EdgeInsets.all(12.0),
                      // onChanged: (value) => nuevo.apellidop = value,
                      controller: apellidoPController,
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.text,
                      placeholder: widget.actual.apellidop,
                      prefix: Container(
                          height: 20.0,
                          margin: const EdgeInsets.only(left: 12.0),
                          child: const Icon(CupertinoIcons.person_2)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: greyLightColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: const Text(
                      "Ingrese Apellido Materno",
                      style: tsH1Black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CupertinoTextField(
                      padding: const EdgeInsets.all(12.0),
                      // onChanged: (value) => nuevo.apellidom = value,
                      controller: apellidoMController,
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.text,
                      placeholder: widget.actual.apellidom,
                      prefix: Container(
                          height: 20.0,
                          margin: const EdgeInsets.only(left: 12.0),
                          child: const Icon(CupertinoIcons.person_3)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: greyLightColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: const Text(
                      "Ingrese Área",
                      style: tsH1Black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CupertinoTextField(
                      padding: const EdgeInsets.all(12.0),
                      // onChanged: (value) => nuevo.area = value,
                      controller: areaController,
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.text,
                      placeholder: widget.actual.area,
                      prefix: Container(
                          height: 20.0,
                          margin: const EdgeInsets.only(left: 12.0),
                          child: const Icon(CupertinoIcons.rays)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: greyLightColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: const Text(
                      "Ingrese Fecha de Nacimiento",
                      style: tsH1Black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CupertinoTextField(
                      padding: const EdgeInsets.all(12.0),
                      // onChanged: (value) => value = nuevo.fechanac.toString(),
                      controller: fechaNacController,
                      maxLength: 23,
                      onTap: () => _showDialog(
                        CupertinoDatePicker(
                          initialDateTime: fecha,
                          mode: CupertinoDatePickerMode.date,
                          use24hFormat: true,
                          maximumDate: DateTime.now(),
                          onDateTimeChanged: (DateTime newDate) {
                            setState(() {
                              fechaNacController.text = newDate.toString();
                              fecha = newDate;
                            });
                          },
                        ),
                      ),
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.datetime,
                      placeholder: widget.actual.fechanac.toString(),
                      prefix: Container(
                          height: 20.0,
                          margin: const EdgeInsets.only(left: 12.0),
                          child: const Icon(CupertinoIcons.clock)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: greyLightColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: const Text(
                      "Ingrese Sueldo",
                      style: tsH1Black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CupertinoTextField(
                      padding: const EdgeInsets.all(12.0),
                      onChanged: (value) => sueldo = int.parse(value),
                      // controller: sueldoController,
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.number,
                      placeholder: widget.actual.sueldo.toString(),
                      prefix: Container(
                          height: 20.0,
                          margin: const EdgeInsets.only(left: 12.0),
                          child: const Icon(CupertinoIcons.money_dollar)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: greyLightColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    color: secondaryColor,
                    // padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                    child: const Text("Actualizar empleado"),
                    onPressed: () async {
                      if (nombreController.text.isEmpty ||
                          apellidoPController.text.isEmpty ||
                          apellidoMController.text.isEmpty ||
                          areaController.text.isEmpty ||
                          fechaNacController.text.isEmpty ||
                          sueldo == 0) {
                        showCupertinoSnackBar(
                            context: context,
                            message: "Ingrese todos los datos");
                      } else {
                        Empleado actual = Empleado(
                            id: widget.actual.id,
                            nombre: nombreController.text,
                            apellidop: apellidoPController.text,
                            apellidom: apellidoMController.text,
                            area: areaController.text,
                            fechanac: fecha,
                            sueldo: sueldo);
                        await updateEmpleado(actual)
                            ? Navigator.of(context).pushAndRemoveUntil(
                                CupertinoPageRoute(
                                  builder: (context) => const Home(),
                                ),
                                (route) => false)
                            : showCupertinoSnackBar(
                                context: context, message: "error :(");
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
