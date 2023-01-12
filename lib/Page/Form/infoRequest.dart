import 'package:flutter/material.dart';
import 'package:openwrt_manager/Dialog/Dialogs.dart';
import 'package:openwrt_manager/Model/SelectedOverviewItem.dart';
import 'package:openwrt_manager/Model/device.dart';
import 'package:openwrt_manager/Overview/OverviewItemManager.dart';
import 'package:openwrt_manager/settingsUtil.dart';
import 'package:uuid/uuid.dart';
class InfoRequest extends StatefulWidget {
  final Device device;
  final SelectedOverviewItem overviewItem;
  final String title;

  const InfoRequest({Key key, this.overviewItem, this.title, this.device})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    var s = InfoRequestState();
    if (overviewItem != null) {
      s._selectedOverview = overviewItem.overiviewItemGuid;
      s._address.text = device.address;
      s._selectedDevice = SettingsUtil.devices
          .firstWhere((d) => overviewItem.deviceGuid == d.guid);
      s._editedGuid = overviewItem.guid;
    }
    return s;
  }
}

class InfoRequestState extends State<InfoRequest> {
  final _formKey = GlobalKey<FormState>();
  Device _selectedDevice;
  String _selectedOverview;
  String _editedGuid;
  final _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Request'),
            backgroundColor:Color(0x8292E100)
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Cuman',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _address,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent
                    ),
                    child: const Text('Info'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        var d = Device();
                        if (_editedGuid != null)
                          d = SettingsUtil.devices.firstWhere(
                                  (x) => x.guid == _editedGuid);
                        getDevice(d);
                        if (_editedGuid == null) {
                          d.guid = Uuid().v4().toString();
                          SettingsUtil.devices.add(d);
                        }
                        SettingsUtil.saveDevices();
                        Navigator.pop(context);
                      }
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.only(top: 0, bottom: 0)),
                        value: _selectedOverview,
                        validator: (value) {
                          if (value == null) {
                            return 'Overview item is missing';
                          }
                          return null;
                        },
                        items: OverviewItemManager.items.keys
                            .map((k) => DropdownMenuItem(
                          child: Text(
                              OverviewItemManager.items[2].displayName),
                          value: k,
                        ))
                            .toList(),
                        onChanged: (o) {
                          setState(() => _selectedOverview = o);
                        },
                      );

                    },
                  ),
                ),
              ],
            )));
  }
  void getDevice(Device d) {
    d.address = _address.text;
  }
}