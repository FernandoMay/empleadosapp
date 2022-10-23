import 'package:empleados/constants.dart';
import 'package:empleados/home.dart';
import 'package:empleados/models.dart';
import 'package:flutter/cupertino.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  bool topico = false;

  late Empleado nuevo;

  @override
  void initState() {
    super.initState();
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
        middle: Image.asset("assets/pdn-logo.png"),
      ),
      // resizeToAvoidBottomInset: true,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: topico ? 0 : 90),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80.0, vertical: 32.0),
                  child: const Text(
                    "Agregar empleado",
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
                    "Ingrese nombre",
                    style: tsH1Black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CupertinoTextField(
                    padding: const EdgeInsets.all(12.0),
                    onChanged: (value) => nuevo.nombre = value,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.text,
                    placeholder: "Nombre",
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
                    "Ingrese apellido paterno",
                    style: tsH1Black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CupertinoTextField(
                    padding: const EdgeInsets.all(12.0),
                    onChanged: (value) => nuevo.apellidop = value,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.text,
                    placeholder: "Apellido Paterno",
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
                    "Ingrese apellido materno",
                    style: tsH1Black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CupertinoTextField(
                    padding: const EdgeInsets.all(12.0),
                    onChanged: (value) => nuevo.apellidom = value,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.text,
                    placeholder: "Apellido Materno",
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
                    "Ingrese área",
                    style: tsH1Black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CupertinoTextField(
                    padding: const EdgeInsets.all(12.0),
                    onChanged: (value) => nuevo.area = value,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.text,
                    placeholder: "Área",
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
                    "Ingrese fecha de nacimiento",
                    style: tsH1Black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CupertinoTextField(
                    padding: const EdgeInsets.all(12.0),
                    onChanged: (value) => value = nuevo.fechanac.toString(),
                    onTap: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        maximumDate: DateTime.now(),
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() => nuevo.fechanac = newDate);
                        },
                      ),
                    ),
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.datetime,
                    placeholder: "Fecha de Nacimiento",
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
                    "Ingrese sueldo",
                    style: tsH1Black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CupertinoTextField(
                    padding: const EdgeInsets.all(12.0),
                    onChanged: (value) => nuevo.sueldo = value as double,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.number,
                    placeholder: "Sueldo",
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: secondaryColor,
                  // padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                  child: const Text("Agregar empleado"),
                  onPressed: () async {
                    await createEmpleado(nuevo)
                        ? showCupertinoSnackBar(
                            context: context, message: "success")
                        : showCupertinoSnackBar(
                            context: context, message: "error :(");
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showCupertinoSnackBar({
  required BuildContext context,
  required String message,
  int durationMillis = 3000,
}) {
  const animationDurationMillis = 200;
  final overlayEntry = OverlayEntry(
    builder: (context) => _CupertinoSnackBar(
      message: message,
      animationDurationMillis: animationDurationMillis,
      waitDurationMillis: durationMillis,
    ),
  );
  Future.delayed(
    Duration(milliseconds: durationMillis + 2 * animationDurationMillis),
    overlayEntry.remove,
  );
  Overlay.of(Navigator.of(context).context)?.insert(overlayEntry);
}

class _CupertinoSnackBar extends StatefulWidget {
  final String message;
  final int animationDurationMillis;
  final int waitDurationMillis;

  const _CupertinoSnackBar({
    Key? key,
    required this.message,
    required this.animationDurationMillis,
    required this.waitDurationMillis,
  }) : super(key: key);

  @override
  State<_CupertinoSnackBar> createState() => _CupertinoSnackBarState();
}

class _CupertinoSnackBarState extends State<_CupertinoSnackBar> {
  bool _show = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => setState(() => _show = true));
    Future.delayed(
      Duration(
        milliseconds: widget.waitDurationMillis,
      ),
      () {
        if (mounted) {
          setState(() => _show = false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: _show ? 8.0 : -50.0,
      left: 8.0,
      right: 8.0,
      curve: _show ? Curves.linearToEaseOut : Curves.easeInToLinear,
      duration: Duration(milliseconds: widget.animationDurationMillis),
      child: CupertinoPopupSurface(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          child: Text(
            widget.message,
            style: TextStyle(
              fontSize: 14.0,
              color: CupertinoColors.secondaryLabel,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
