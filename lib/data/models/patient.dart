// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

Patient? patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient? data) => json.encode(data!.toJson());

class Patient {
    Patient({
        this.record,
        this.metadata,
    });

    List<Record?>? record;
    Metadata? metadata;

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        record: json["record"] == null ? [] : List<Record?>.from(json["record"]!.map((x) => Record.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
    );

    Map<String, dynamic> toJson() => {
        "record": record == null ? [] : List<dynamic>.from(record!.map((x) => x!.toJson())),
        "metadata": metadata!.toJson(),
    };
}

class Metadata {
    Metadata({
        this.id,
        this.private,
        this.createdAt,
        this.collectionId,
        this.name,
    });

    String? id;
    bool? private;
    DateTime? createdAt;
    String? collectionId;
    String? name;

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        id: json["id"],
        private: json["private"],
        createdAt: DateTime.parse(json["createdAt"]),
        collectionId: json["collectionId"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "private": private,
        "createdAt": createdAt?.toIso8601String(),
        "collectionId": collectionId,
        "name": name,
    };
}

class Record {
    Record({
        this.uuid,
        this.tenantId,
        this.organizationId,
        this.document,
        this.documentType,
        this.documentVersion,
        this.createdby,
        this.created,
        this.updatedby,
        this.updated,
    });

    String? uuid;
    String? tenantId;
    String? organizationId;
    Document? document;
    String? documentType;
    String? documentVersion;
    String? createdby;
    DateTime? created;
    String? updatedby;
    DateTime? updated;

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        uuid: json["UUID"],
        tenantId: json["tenantId"],
        organizationId: json["organizationId"],
        document: Document.fromJson(json["document"]),
        documentType: json["documentType"],
        documentVersion: json["documentVersion"],
        createdby: json["createdby"],
        created: DateTime.parse(json["created"]),
        updatedby: json["updatedby"],
        updated: DateTime.parse(json["updated"]),
    );

    Map<String, dynamic> toJson() => {
        "UUID": uuid,
        "tenantId": tenantId,
        "organizationId": organizationId,
        "document": document!.toJson(),
        "documentType": documentType,
        "documentVersion": documentVersion,
        "createdby": createdby,
        "created": created?.toIso8601String(),
        "updatedby": updatedby,
        "updated": updated?.toIso8601String(),
    };
}

class Document {
    Document({
        this.id,
        this.name,
        this.partyType,
        this.customAttribute,
    });

    String? id;
    String? name;
    String? partyType;
    CustomAttribute? customAttribute;

    factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["id"],
        name: json["name"],
        partyType: json["partyType"],
        customAttribute: CustomAttribute.fromJson(json["customAttribute"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "partyType": partyType,
        "customAttribute": customAttribute!.toJson(),
    };
}

class CustomAttribute {
    CustomAttribute({
        this.spesialisasi,
        this.lokasi,
        this.tahunLamaBekerja,
        this.tempatPraktek,
        this.profilePicture,
    });

    Spesialisasi? spesialisasi;
    String? lokasi;
    String? tahunLamaBekerja;
    Spesialisasi? tempatPraktek;
    String? profilePicture;

    factory CustomAttribute.fromJson(Map<String, dynamic> json) => CustomAttribute(
        spesialisasi: Spesialisasi.fromJson(json["spesialisasi"]),
        lokasi: json["lokasi"],
        tahunLamaBekerja: json["tahunLamaBekerja"],
        tempatPraktek: Spesialisasi.fromJson(json["tempatPraktek"]),
        profilePicture: json["profilePicture"],
    );

    Map<String, dynamic> toJson() => {
        "spesialisasi": spesialisasi!.toJson(),
        "lokasi": lokasi,
        "tahunLamaBekerja": tahunLamaBekerja,
        "tempatPraktek": tempatPraktek!.toJson(),
        "profilePicture": profilePicture,
    };
}

class Spesialisasi {
    Spesialisasi({
        this.key,
        this.value,
        this.type,
        this.description,
    });

    String? key;
    String? value;
    String? type;
    String? description;

    factory Spesialisasi.fromJson(Map<String, dynamic> json) => Spesialisasi(
        key: json["key"],
        value: json["value"],
        type: json["type"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "type": type,
        "description": description,
    };
}