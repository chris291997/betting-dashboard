part of '../../di/dashboard_service_locator.dart';

class DashboardOutput extends Equatable {
  const DashboardOutput({
    required this.id,
    required this.fightNumber,
    required this.meronId,
    required this.walaId,
    required this.winnerId,
    required this.winner,
    required this.status,
    required this.totalMeronBet,
    required this.totalWalaBet,
    required this.isDraw,
    required this.isCanceled,
    required this.bettingStatus,
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
    required this.betMultiplier,
  });

  final String id;
  final int fightNumber;
  final String meronId;
  final String walaId;
  final String winnerId;
  final String winner;
  final FightStatus status;
  final double totalMeronBet;
  final double totalWalaBet;
  final bool isDraw;
  final bool isCanceled;
  final String bettingStatus;
  final String eventName;
  final String eventDate;
  final String eventLocation;
  final double betMultiplier;

  static const empty = DashboardOutput(
    id: '',
    fightNumber: 0,
    meronId: '',
    walaId: '',
    winnerId: '',
    winner: '',
    status: FightStatus.notStarted,
    totalMeronBet: 0,
    totalWalaBet: 0,
    isDraw: false,
    isCanceled: false,
    bettingStatus: '',
    eventName: '',
    eventDate: '',
    eventLocation: '',
    betMultiplier: 0.00,
  );

  bool get isEmpty => this == DashboardOutput.empty;
  bool get isNotEmpty => this != DashboardOutput.empty;

  DashboardOutput copyWith({
    String? id,
    int? fightNumber,
    String? meronId,
    String? walaId,
    String? winnerId,
    String? winner,
    FightStatus? status,
    double? totalMeronBet,
    double? totalWalaBet,
    bool? isDraw,
    bool? isCanceled,
    String? bettingStatus,
    String? eventName,
    String? eventDate,
    String? eventLocation,
    double? betMultiplier,
  }) {
    return DashboardOutput(
      id: id ?? this.id,
      fightNumber: fightNumber ?? this.fightNumber,
      meronId: meronId ?? this.meronId,
      walaId: walaId ?? this.walaId,
      winnerId: winnerId ?? this.winnerId,
      winner: winner ?? this.winner,
      status: status ?? this.status,
      totalMeronBet: totalMeronBet ?? this.totalMeronBet,
      totalWalaBet: totalWalaBet ?? this.totalWalaBet,
      isDraw: isDraw ?? this.isDraw,
      isCanceled: isCanceled ?? this.isCanceled,
      bettingStatus: bettingStatus ?? this.bettingStatus,
      eventName: eventName ?? this.eventName,
      eventDate: eventDate ?? this.eventDate,
      eventLocation: eventLocation ?? this.eventLocation,
      betMultiplier: betMultiplier ?? this.betMultiplier,
    );
  }

  factory DashboardOutput.fromJson(Map<String, dynamic> json) {
    return DashboardOutput(
      id: json.parseString('id'),
      fightNumber: json.parseInt('fightNumber'),
      meronId: json.parseString('meronId'),
      walaId: json.parseString('walaId'),
      winnerId: json.parseString('winnerId'),
      winner: json.parseString('winner'),
      status: FightStatus.parse(json.parseString('status')),
      totalMeronBet: json.parseDouble('totalMeronBet'),
      totalWalaBet: json.parseDouble('totalWalaBet'),
      isDraw: json.parseBool('isDraw'),
      isCanceled: json.parseBool('isCanceled'),
      bettingStatus: json.parseString('bettingStatus'),
      eventName: json.parseString('eventName'),
      eventDate: json.parseString('eventDate'),
      eventLocation: json.parseString('eventLocation'),
      betMultiplier: 0.00,
    );
  }

  @override
  List<Object> get props => [
        id,
        fightNumber,
        meronId,
        walaId,
        winnerId,
        winner,
        status,
        totalMeronBet,
        totalWalaBet,
        isDraw,
        isCanceled,
        bettingStatus,
        eventName,
        eventDate,
        eventLocation,
        betMultiplier,
      ];
}
