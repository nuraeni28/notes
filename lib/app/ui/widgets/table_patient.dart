import 'package:flutter/material.dart';
import 'package:notes/app/ui/widgets/paginated_table/data_table.dart';
import 'package:notes/app/ui/widgets/paginated_table/data_table_source.dart';
import 'package:notes/app/ui/widgets/paginated_table/paginated_table.dart';
import 'package:notes/data/datasources/patient_data_source.dart';
import 'package:notes/shared/theme.dart';
import 'package:notes/data/models/patient.dart';
import 'package:provider/provider.dart';

class TablePatient extends StatefulWidget {
  const TablePatient({super.key});

  @override
  State<TablePatient> createState() => _TablePatientState();
}

class PatientData extends DataTableSourceCustom {
  List<Patient>? _patients;
  List<Document>? _document;

  bool selected = false;
  int _selectedCount = 0;

  @override
  int get rowCount => _patients!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRowCustom getRows(int index) {
    final _patient = _document![index];
    return DataRowCustom.byIndex(
        selected: selected,
        onSelectChanged: (value) {
          if (selected != value) {
            _selectedCount += value! ? 1 : -1;
            assert(_selectedCount >= 0);
            selected = value;
            notifyListeners();
          }
        },
        index: index,
        cells: <DataCellCustom>[
          DataCellCustom(Text(_patient.name.toString())),
        ]);
  }
}

class _TablePatientState extends State<TablePatient> {
  PatientData? _patientDataSource;
  late Future<Patient> _patient;

  @override
  void initState() {
    super.initState();
    _patient = PatientDataSource().getPatient();
  }

  // late List<Patient> patients;
  // late List<Patient> selectedPatient;
  PaginatedDataTableCustom dataBody() {
    return PaginatedDataTableCustom(
      rowsPerPage: 15,
      columns: [
        DataColumnCustom(
            label: Text(
          'Nama Pasien',
          style: textTitleTable,
        )),
        DataColumnCustom(
            label: Text(
          'Jenis Kelamin',
          style: textTitleTable,
        )),
        DataColumnCustom(
            label: Text(
          'No. Rekam Medis',
          style: textTitleTable,
        )),
        DataColumnCustom(
            label: Text(
          'Kota Lahir',
          style: textTitleTable,
        )),
        DataColumnCustom(
            label: Text(
          'Tanggal Lahir',
          style: textTitleTable,
        )),
        DataColumnCustom(
            label: Text(
          'Alamat',
          style: textTitleTable,
        )),
        DataColumnCustom(
            label: Text(
          'No. HP',
          style: textTitleTable,
        ))
      ],
      columnSpacing: 0,
      horizontalMargin: 0,
      source: _patientDataSource!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 112.0, vertical: 36.0),
                  child: FutureBuilder(
                      future: _patient,
                      builder: (context, AsyncSnapshot<Patient> snapshot) {
                        var state = snapshot.connectionState;
                        if (state != ConnectionState.done) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                  
                          if (snapshot.hasData) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                child: dataBody());
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Material(
                                child: Text(snapshot.error.toString()),
                              ),
                            );
                          } else {
                            return const Material(child: Text(''));
                          }
                        }
                      })),
            ],
          ),
        ));
  }
}
