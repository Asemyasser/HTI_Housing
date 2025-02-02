import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../api/LoginResponseModel.dart';
import '../api/api_service.dart';
import 'forget_pass.dart';
import '../homescreen/home_female.dart';
import '../homescreen/home_male.dart';
import 'superviser_profile.dart';

class Login extends StatefulWidget {
  static const String routeName = '/Login';
  final int? index;

  const Login({Key? key, this.index}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = LoginRequestModel(email: '', password: ''); // Default values
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildBackIcon(),
              const SizedBox(height: 120),
              _buildWelcomeText(),
              _buildLoginForm(),
              const SizedBox(height: 20),
              _buildFooterButtons(),
              const SizedBox(height: 30),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 60),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: SvgPicture.asset(
          'assets/image/backIcon.svg',
          width: 25.0,
          height: 25.0,
          color: const Color(0XFF60636C),
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: const Text(
          "Welcome Back!",
          style: TextStyle(
              color: Color(0xFF1C2833),
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: globalFormKey,
        child: Center(
          child: Column(
            children: <Widget>[
              buildInputField(
                label: "Email",
                hint: "Enter Your Email",
                onSave: (input) => requestModel.email = input,
              ),
              buildInputField(
                label: "Password",
                hint: "",
                suffixIcon: const Icon(Icons.visibility_off_rounded),
                onSave: (input) => requestModel.password = input,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterButtons() {
    return Row(
      children: [
        const SizedBox(width: 30),
        const Icon(Icons.check_box_outline_blank, color: Colors.grey),
        const Text(
          "Remember me",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF1C2833),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 60),
        MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgetPass()),
            );
          },
          child: const Text(
            "Forget password?",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFEEA1B3),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 70),
      child: MaterialButton(
        onPressed: _handleLogin,
        height: 50,
        color: const Color(0xFF1A2A4D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildInputField({
    required String label,
    required String hint,
    Widget? suffixIcon,
    required Function(String) onSave,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 3.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF1C2833),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          height: 61,
          width: 343,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(),
              suffixIcon: suffixIcon,
            ),
            onSaved: (input) {
              onSave(input!);
            },
            validator: (input) => input == null || input.isEmpty
                ? "This field cannot be empty"
                : null,
          ),
        ),
      ],
    );
  }

  void _handleLogin() async {
    if (validateAndSave()) {
      APIService apiService = APIService();
      LoginResponseModel response = await apiService.login(requestModel);

      if (response.token != null) {
        _navigateToHome();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.error ?? 'Login failed')),
        );
      }
    }
  }

  void _navigateToHome() {
    if (widget.index == 11) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomemaleStudent()),
      );
    } else if (widget.index == 22) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeFemaleStudent()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuperviseProfile()),
      );
    }
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
    }
}