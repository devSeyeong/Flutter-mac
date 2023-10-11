class SubwayArrival {
  final int _rowNum;
  final String _subwayId;
  final String _trainLineNm;
  final String _arvlMsg2;

  SubwayArrival(this._rowNum, this._subwayId, this._trainLineNm,
      this._arvlMsg2);

  int get rowNum => _rowNum;

  String get subwayId => _subwayId;

  String get trainLineNm => _trainLineNm;

  String get arvlMsg2 => _arvlMsg2;
}