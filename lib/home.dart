import 'package:empleados/constants.dart';
import 'package:empleados/models.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Empleado>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getEmpleados();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "Empleados List",
          style: tsH2White,
        ),
        backgroundColor: primaryColor.withOpacity(0.5),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.network("https://picsum.photos/180"),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: FutureBuilder<List<Empleado>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Empleado>? data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return EmpleadoCard(
                        empleado: data![index],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return const CupertinoActivityIndicator(
                color: secondaryColor,
              );
            },
          ),
        ),
      ),
    );
  }
}

class EmpleadoCard extends StatefulWidget {
  final Empleado empleado;
  const EmpleadoCard({Key? key, required this.empleado}) : super(key: key);

  @override
  _EmpleadoCardState createState() => _EmpleadoCardState();
}

class _EmpleadoCardState extends State<EmpleadoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: secondaryColor.withOpacity(0.8),
                      ),
                      child: Text(
                        widget.empleado.id.toString(),
                        style: tsH2White,
                      ),
                    ),
                  ),
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.empleado.nombre +
                          widget.empleado.apellidom +
                          widget.empleado.apellidop,
                      style: tsH3Black,
                    ),
                  ),
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.empleado.area,
                      style: tsH2Blue,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.empleado.fechanac.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: widget.empleado.fechanac.year < 2004
                            ? successColor
                            : dangerColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\$ ${widget.empleado.sueldo.toString()}",
                      style: tsH2Black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
