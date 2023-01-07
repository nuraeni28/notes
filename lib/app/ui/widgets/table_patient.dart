import 'package:flutter/material.dart';
import 'package:notes/app/ui/widgets/paginated_table/data_table.dart';
import 'package:notes/app/ui/widgets/paginated_table/data_table_source.dart';
import 'package:notes/app/ui/widgets/paginated_table/paginated_table.dart';
import 'package:notes/shared/theme.dart';
import 'package:notes/source/patient.dart';

class TablePatient extends StatefulWidget {
  const TablePatient({super.key});

  @override
  State<TablePatient> createState() => _TablePatientState();
}

class PatientDataSource extends DataTableSourceCustom {
  late List<Patient> selectedPatient;
  late final List<Patient> _patients = Patient.getPatient();
  bool selected = false;
  int _selectedCount = 0;

  @override
  int get rowCount => _patients.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRowCustom getRows(int index) {
    final Patient patients = _patients[index];
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
          DataCellCustom(Text(patients.name)),
          DataCellCustom(Text(patients.gender)),
          DataCellCustom(Text(patients.numberRM.toString())),
          DataCellCustom(Text(patients.cityOB)),
          DataCellCustom(Text(patients.dateOB)),
          DataCellCustom(Text(patients.address)),
          DataCellCustom(Text(patients.numberPhone))
        ]);
  }
}

class _TablePatientState extends State<TablePatient> {
  final PatientDataSource _patientDataSource = PatientDataSource();
  late List<Patient> patients;
  late List<Patient> selectedPatient;

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
      source: _patientDataSource,
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
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: dataBody()),
              ),
            ],
          ),
        ));
  }
}
