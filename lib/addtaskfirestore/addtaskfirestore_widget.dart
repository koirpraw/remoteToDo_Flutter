import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../todo_fire_store/todo_fire_store_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class AddtaskfirestoreWidget extends StatefulWidget {
  const AddtaskfirestoreWidget({
    Key key,
    this.taskmanager,
  }) : super(key: key);

  final DocumentReference taskmanager;

  @override
  _AddtaskfirestoreWidgetState createState() => _AddtaskfirestoreWidgetState();
}

class _AddtaskfirestoreWidgetState extends State<AddtaskfirestoreWidget> {
  DateTime datePicked;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Add Task',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: FlutterFlowTheme.tertiaryColor,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
            child: Icon(
              Icons.close,
              color: Color(0xFFF5F5F5),
              size: 36,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Add Tasks',
                    style: FlutterFlowTheme.title2,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Enter your task details below',
                  style: FlutterFlowTheme.subtitle1.override(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 8, 0),
              child: TextFormField(
                controller: textController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'yourTasks',
                  labelStyle: FlutterFlowTheme.bodyText1,
                  hintText: '[Some hint text...]',
                  hintStyle: FlutterFlowTheme.bodyText1,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Color(0x522D2D2D),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                ),
                style: FlutterFlowTheme.bodyText1,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: InkWell(
                onTap: () async {
                  await DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    onConfirm: (date) {
                      setState(() => datePicked = date);
                    },
                    currentTime: getCurrentTimestamp,
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Text(
                      dateTimeFormat('d/M h:m a', datePicked),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0xFFF5F5F5),
                        textStyle: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final myTasksCreateData = createMyTasksRecordData(
                          time: datePicked,
                          taskName: textController.text,
                        );
                        await MyTasksRecord.collection
                            .doc()
                            .set(myTasksCreateData);
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TodoFireStoreWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      text: 'Add',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
