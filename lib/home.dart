import 'package:empleados/addemployee.dart';
import 'package:empleados/constants.dart';
import 'package:empleados/models.dart';
import 'package:empleados/services.dart';
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
          "Empleados",
          style: tsH2White,
        ),
        backgroundColor: primaryColor.withOpacity(0.5),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network("https://picsum.photos/180"),
          ),
        ),
        trailing: CupertinoButton(
          onPressed: () => Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => AddEmployee(),
            ),
          ),
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.person_add, color: secondaryColor),
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
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: secondaryColor.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                      child: Text(
                        widget.empleado.id.toString(),
                        style: tsH2White,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${widget.empleado.nombre} ${widget.empleado.apellidop} ${widget.empleado.apellidom}",
                      style: tsH1Black,
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
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\$ ${widget.empleado.sueldo.toString()}",
                  style: tsH2Black,
                ),
              ),
              Container(
                //width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${widget.empleado.fechanac.day}-${widget.empleado.fechanac.month}-${widget.empleado.fechanac.year}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: widget.empleado.fechanac.year < 2004
                        ? successColor
                        : dangerColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
