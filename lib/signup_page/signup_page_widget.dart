import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../todo_fire_store/todo_fire_store_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPageWidget extends StatefulWidget {
  const SignupPageWidget({Key key}) : super(key: key);

  @override
  _SignupPageWidgetState createState() => _SignupPageWidgetState();
}

class _SignupPageWidgetState extends State<SignupPageWidget> {
  TextEditingController confirmPasswordController;
  bool confirmPasswordVisibility;
  TextEditingController signupEmailFieldController;
  TextEditingController userNameTextfieldController;
  TextEditingController signupPasswordFieldController;
  bool signupPasswordFieldVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    confirmPasswordController = TextEditingController();
    confirmPasswordVisibility = false;
    signupEmailFieldController = TextEditingController();
    userNameTextfieldController = TextEditingController();
    signupPasswordFieldController = TextEditingController();
    signupPasswordFieldVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 72, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'We are  happy that you found us,\nlets get started',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                    child: TextFormField(
                      onChanged: (_) => EasyDebounce.debounce(
                        'userNameTextfieldController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      controller: userNameTextfieldController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Sam awesome',
                        hintStyle: FlutterFlowTheme.subtitle2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: userNameTextfieldController.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => userNameTextfieldController.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.subtitle2,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                    child: TextFormField(
                      onChanged: (_) => EasyDebounce.debounce(
                        'signupEmailFieldController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      controller: signupEmailFieldController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'example@email.com',
                        hintStyle: FlutterFlowTheme.subtitle2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: signupEmailFieldController.text.isNotEmpty
                            ? InkWell(
                                onTap: () => setState(
                                  () => signupEmailFieldController.clear(),
                                ),
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.subtitle2,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                    child: TextFormField(
                      controller: signupPasswordFieldController,
                      obscureText: !signupPasswordFieldVisibility,
                      decoration: InputDecoration(
                        hintText: 'atleast 8 characters',
                        hintStyle: FlutterFlowTheme.subtitle2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => signupPasswordFieldVisibility =
                                !signupPasswordFieldVisibility,
                          ),
                          child: Icon(
                            signupPasswordFieldVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.subtitle2,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: !confirmPasswordVisibility,
                      decoration: InputDecoration(
                        hintText: 'atleast 8 characters',
                        hintStyle: FlutterFlowTheme.subtitle2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => confirmPasswordVisibility =
                                !confirmPasswordVisibility,
                          ),
                          child: Icon(
                            confirmPasswordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.subtitle2,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                    child: Text(
                      'Recover Password',
                      style: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      if (signupPasswordFieldController.text !=
                          confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Passwords don't match!",
                            ),
                          ),
                        );
                        return;
                      }

                      final user = await createAccountWithEmail(
                        context,
                        signupEmailFieldController.text,
                        signupPasswordFieldController.text,
                      );
                      if (user == null) {
                        return;
                      }

                      final usersCreateData = createUsersRecordData(
                        email: '',
                        displayName: '',
                      );
                      await UsersRecord.collection
                          .doc(user.uid)
                          .update(usersCreateData);

                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodoFireStoreWidget(),
                        ),
                      );
                    },
                    text: 'Sign up',
                    options: FFButtonOptions(
                      width: 260,
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color(0xFFA5A5A5),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                    child: Text(
                      'or continue with',
                      style: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color(0xFFA5A5A5),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 230,
                      height: 44,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final user = await signInWithGoogle(context);
                                if (user == null) {
                                  return;
                                }
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TodoFireStoreWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Sign in with Google',
                              icon: Icon(
                                Icons.add,
                                color: Colors.transparent,
                                size: 20,
                              ),
                              options: FFButtonOptions(
                                width: 230,
                                height: 44,
                                color: Colors.white,
                                textStyle: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Color(0xFF606060),
                                  fontSize: 17,
                                ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 0,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.83, 0),
                            child: Container(
                              width: 22,
                              height: 22,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Already Registered ?',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPageWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    child: Text(
                      'Log In ',
                      style: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.secondaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
