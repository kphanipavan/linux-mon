import 'dart:convert';

DataParser dataParserFromJson(String str) => DataParser.fromJson(json.decode(str));

String dataParserToJson(DataParser data) => json.encode(data.toJson());

class DataParser {
    DataParser({
        this.user,
        this.cpuFreq,
        this.ramData,
        this.diskData,
        this.sensorTemperatures,
        this.batteryPercentage,
        this.plugged,
        this.approxSecLeft,
    });

    String user;
    List<double> cpuFreq;
    RamData ramData;
    DiskData diskData;
    SensorTemperatures sensorTemperatures;
    double batteryPercentage;
    bool plugged;
    int approxSecLeft;

    factory DataParser.fromJson(Map<String, dynamic> json) => DataParser(
        user: json["user"],
        cpuFreq: List<double>.from(json["cpu_freq"].map((x) => x.toDouble())),
        ramData: RamData.fromJson(json["ram_data"]),
        diskData: DiskData.fromJson(json["disk_data"]),
        sensorTemperatures: SensorTemperatures.fromJson(json["sensor_temperatures"]),
        batteryPercentage: json["battery_percentage"].toDouble(),
        plugged: json["plugged"],
        approxSecLeft: json["approx_sec_left"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "cpu_freq": List<dynamic>.from(cpuFreq.map((x) => x)),
        "ram_data": ramData.toJson(),
        "disk_data": diskData.toJson(),
        "sensor_temperatures": sensorTemperatures.toJson(),
        "battery_percentage": batteryPercentage,
        "plugged": plugged,
        "approx_sec_left": approxSecLeft,
    };
}

class DiskData {
    DiskData({
        this.percentageUsed,
        this.total,
        this.free,
    });

    double percentageUsed;
    int total;
    int free;

    factory DiskData.fromJson(Map<String, dynamic> json) => DiskData(
        percentageUsed: json["percentage_used"].toDouble(),
        total: json["total"],
        free: json["free"],
    );

    Map<String, dynamic> toJson() => {
        "percentage_used": percentageUsed,
        "total": total,
        "free": free,
    };
}

class RamData {
    RamData({
        this.percentageUsed,
        this.total,
        this.available,
    });

    double percentageUsed;
    int total;
    int available;

    factory RamData.fromJson(Map<String, dynamic> json) => RamData(
        percentageUsed: json["percentage_used"].toDouble(),
        total: json["total"],
        available: json["available"],
    );

    Map<String, dynamic> toJson() => {
        "percentage_used": percentageUsed,
        "total": total,
        "available": available,
    };
}

class SensorTemperatures {
    SensorTemperatures({
        this.acpitz,
        this.pchSkylake,
        this.coretemp,
    });

    List<List<dynamic>> acpitz;
    List<List<dynamic>> pchSkylake;
    List<List<dynamic>> coretemp;

    factory SensorTemperatures.fromJson(Map<String, dynamic> json) => SensorTemperatures(
        acpitz: List<List<dynamic>>.from(json["acpitz"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        pchSkylake: List<List<dynamic>>.from(json["pch_skylake"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        coretemp: List<List<dynamic>>.from(json["coretemp"].map((x) => List<dynamic>.from(x.map((x) => x)))),
    );

    Map<String, dynamic> toJson() => {
        "acpitz": List<dynamic>.from(acpitz.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "pch_skylake": List<dynamic>.from(pchSkylake.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "coretemp": List<dynamic>.from(coretemp.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}