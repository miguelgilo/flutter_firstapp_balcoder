import 'package:flutter/material.dart';
import 'package:hello_word/ui/user/model/user_model.dart';

class UserFormPage extends StatefulWidget {
  UserFormPage({this.title, this.color, this.userList});
  List<UserModel> userList;
  Color color;
  String title;

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  TextEditingController _cName = TextEditingController();
  TextEditingController _cPhoneNumber = TextEditingController();
  UserModel _userModel = new UserModel();

  int _currentIndex;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    print(widget.title);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 12.0, right: 12.0, bottom: 12.0),
              child: TextFormField(
                controller: _cName,
                decoration: InputDecoration(
                    icon: Icon(Icons.person), hintText: "INGRESE SU NOMBRE"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 12.0, right: 12.0, bottom: 12.0),
              child: TextFormField(
                controller: _cPhoneNumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    icon: Icon(Icons.phone), hintText: "INGRESE SU CELULAR"),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: GestureDetector(
                  onTap: () {
                    print("ya lo undieron");

                    print(_cName.text);
                    print(_cPhoneNumber.text);

                    _userModel.name = _cName.text;
                    _userModel.phoneNumber = int.parse(_cPhoneNumber.text);

                    print(_userModel.name);
                    print(_userModel.phoneNumber);
                    if (_currentIndex != null) {
                      setState(() {
                        widget.userList[_currentIndex] = _userModel;
                      });
                    } else {
                      setState(() {
                        widget.userList.add(_userModel); /*?*/
                      });
                    }
                    _cName.text = "";
                    _cPhoneNumber.text = "";
                    _userModel = new UserModel();
                    _currentIndex = null;
                  },
                  child: Container(
                    height: _height * 0.05,
                    width: _width * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text(
                          _currentIndex != null ? "ACTUALIZAR" : "GUARDAR",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                )),
            Container(
              width: _width * 0.4,
              height: _height * 0.4,
              child: ListView.builder(
                  itemCount: widget.userList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                          _cName.text = widget.userList[index].name;
                          _cPhoneNumber.text =
                              widget.userList[index].phoneNumber.toString();
                        });
                      },
                      leading: Icon(Icons.person),
                      title: Text(widget.userList[index].name),
                      subtitle:
                          Text(widget.userList[index].phoneNumber.toString()),
                      trailing: GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.userList.removeAt(index);
                            });
                          },
                          child: Icon(Icons.delete)),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
