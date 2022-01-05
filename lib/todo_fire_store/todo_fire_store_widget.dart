import '../addtaskfirestore/addtaskfirestore_widget.dart';
import '../backend/backend.dart';
import '../completed_tasks_firestore/completed_tasks_firestore_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoFireStoreWidget extends StatefulWidget {
  const TodoFireStoreWidget({Key key}) : super(key: key);

  @override
  _TodoFireStoreWidgetState createState() => _TodoFireStoreWidgetState();
}

class _TodoFireStoreWidgetState extends State<TodoFireStoreWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'My Task Manager',
          style: FlutterFlowTheme.title2.override(
            fontFamily: 'Poppins',
            color: Color(0xFFF5F5F5),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddtaskfirestoreWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(
          Icons.add,
          color: FlutterFlowTheme.tertiaryColor,
          size: 36,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<List<MyTasksRecord>>(
              stream: queryMyTasksRecord(
                queryBuilder: (myTasksRecord) => myTasksRecord.orderBy('Time'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                  );
                }
                List<MyTasksRecord> columnMyTasksRecordList = snapshot.data;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(columnMyTasksRecordList.length,
                      (columnIndex) {
                    final columnMyTasksRecord =
                        columnMyTasksRecordList[columnIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: CompletedTasksFirestoreWidget(),
                            ),
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  columnMyTasksRecord.taskName,
                                                  style: FlutterFlowTheme.title3
                                                      .override(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          dateTimeFormat(
                                              'M/d h:m a', getCurrentTimestamp),
                                          style: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ToggleIcon(
                                        onPressed: () async {
                                          final myTasksUpdateData =
                                              createMyTasksRecordData(
                                            isDone: !columnMyTasksRecord.isDone,
                                          );
                                          await columnMyTasksRecord.reference
                                              .update(myTasksUpdateData);
                                        },
                                        value: columnMyTasksRecord.isDone,
                                        onIcon: Icon(
                                          Icons.check_box,
                                          color: Color(0xFF047725),
                                          size: 25,
                                        ),
                                        offIcon: Icon(
                                          Icons.check_box_outline_blank,
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
