import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'my_tasks_record.g.dart';

abstract class MyTasksRecord
    implements Built<MyTasksRecord, MyTasksRecordBuilder> {
  static Serializer<MyTasksRecord> get serializer => _$myTasksRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Time')
  DateTime get time;

  @nullable
  bool get isDone;

  @nullable
  String get taskName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MyTasksRecordBuilder builder) => builder
    ..isDone = false
    ..taskName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('myTasks');

  static Stream<MyTasksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MyTasksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MyTasksRecord._();
  factory MyTasksRecord([void Function(MyTasksRecordBuilder) updates]) =
      _$MyTasksRecord;

  static MyTasksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMyTasksRecordData({
  DateTime time,
  bool isDone,
  String taskName,
}) =>
    serializers.toFirestore(
        MyTasksRecord.serializer,
        MyTasksRecord((m) => m
          ..time = time
          ..isDone = isDone
          ..taskName = taskName));
