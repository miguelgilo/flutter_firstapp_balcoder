import 'package:flutter/material.dart';
import 'package:hello_word/ui/provider/provider_form_page.dart';
import '../dashboard_widget.dart';
import 'model/provider_model.dart';

class ProviderList extends StatefulWidget {
  @override
  _ProviderListState createState() => _ProviderListState();
}

class _ProviderListState extends State<ProviderList> {
  int _currentIndex;

  List<ProviderModel> _userList = [];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("LISTA DE PROVEEDORES",
            style: TextStyle(color: Colors.white, fontSize: 24)),
      )),
      body: Container(
          child: Column(
        children: [
          Center(
              child:
                  DashboardWidget(count: _userList.length, title: "USUARIOS")),
          Container(
            width: _width * 0.4,
            height: _height * 0.4,
            child: ListView.builder(
                itemCount: _userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      setState(() {
                        _currentIndex = index;
                      });
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (_) {
                        return ProviderForm(
                            userList: _userList, currentIndex: _currentIndex);
                      }));
                      setState(() {
                        _currentIndex = null;
                      });
                    },
                    leading: Icon(Icons.person),
                    title: Text(_userList[index].key),
                    subtitle: Text(_userList[index].cashAmount.toString()),
                    trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            _userList.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete)),
                  );
                }),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ProviderForm(
              userList: _userList,
            );
          }));
          setState(() {});
          print("presione el boton");
        },
      ),
    );
  }
}
