import 'package:flutter/material.dart';
import 'package:hello_word/ui/provider/model/provider_model.dart';
import 'package:hello_word/ui/provider/provider_list_page.dart';

class ProviderForm extends StatefulWidget {
  ProviderForm({this.userList, this.currentIndex});
  List<ProviderModel> userList;
  int currentIndex;
  @override
  _ProviderFormState createState() => _ProviderFormState();
}

class _ProviderFormState extends State<ProviderForm> {
  TextEditingController _cKey = TextEditingController();
  TextEditingController _cCashAccount = TextEditingController();
  TextEditingController _cProvider = TextEditingController();
  TextEditingController _cCompany = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.currentIndex != null) {
      _cKey.text = widget.userList[widget.currentIndex].key;
      _cCashAccount.text =
          widget.userList[widget.currentIndex].cashAmount.toString();
      _cProvider.text = widget.userList[widget.currentIndex].providerName;
      _cCompany.text = widget.userList[widget.currentIndex].companyName;
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    ProviderModel _providerModel = new ProviderModel();

    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 12.0, right: 12.0, bottom: 12.0),
              child: TextFormField(
                controller: _cKey,
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key), hintText: "INGRESE EL KEY"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 12.0, right: 12.0, bottom: 12.0),
              child: TextFormField(
                controller: _cCashAccount,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    icon: Icon(Icons.attach_money),
                    hintText: "INGRESE EL DINERO QUE HAY EN LA CUENTA"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 12.0, right: 12.0, bottom: 12.0),
              child: TextFormField(
                controller: _cProvider,
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "INGRESE EL NOMBRE DEL PROVEEDOR"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 12.0, right: 12.0, bottom: 12.0),
              child: TextFormField(
                controller: _cCompany,
                decoration: InputDecoration(
                    icon: Icon(Icons.business_center),
                    hintText: "INGRESE EL NOMBRE DE LA EMPRESA"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, MaterialPageRoute(builder: (_) {
                    return ProviderList();
                  }));
                  setState(() {});
                  print("presione el boton");

                  print(_cKey.text);
                  print(_cProvider.text);
                  print(_cCashAccount.text);
                  print(_cCompany.text);

                  _providerModel.key = _cKey.text;
                  _providerModel.cashAmount = int.parse(_cCashAccount.text);
                  _providerModel.providerName = _cProvider.text;
                  _providerModel.companyName = _cCompany.text;

                  print(_providerModel.key);
                  print(_providerModel.cashAmount);
                  print(_providerModel.providerName);
                  print(_providerModel.companyName);

                  if (widget.currentIndex != null) {
                    setState(() {
                      widget.userList[widget.currentIndex] =
                          _providerModel; /* que hace esta logica */
                    });
                  } else {
                    setState(() {
                      widget.userList.add(_providerModel);
                    });
                  }
                  _cKey.text = "";
                  _cProvider.text = "";
                  _cCashAccount.text = "";
                  _cCompany.text = "";

                  _providerModel = new ProviderModel();
                  widget.currentIndex = null;
                },
                child: Container(
                  height: _height * 0.05,
                  width: _width * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Center(
                    child: Text(
                        widget.currentIndex != null ? "ACTUALIZAR" : "GUARDAR",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
