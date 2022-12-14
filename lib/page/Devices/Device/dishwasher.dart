import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:human_com/page/Devices/devices_main.dart';
import 'package:human_com/page/Devices/widget/device_scaffold.dart';
import 'package:human_com/page/Devices/widget/device_status.dart';
import 'package:human_com/page/Devices/widget/power_button.dart';

class DishWasher extends StatefulWidget {
  const DishWasher(this.room, this.id, {Key key}) : super(key: key);
  final String room;
  final int id;
  @override
  State<DishWasher> createState() => _DishWasherState();
}

class _DishWasherState extends State<DishWasher> {
  int _id;
  String _room;
  String _name;
  bool _status;
  int _index;
  bool _favorite;

  @override
  void initState() {
    super.initState();
    _id = widget.id;
    _room = widget.room;
    _name = listDevice[_room][_id]['name'];
    _status = listDevice[_room][_id]['status'];
    _index = listDevice[_room][_id]['index'];
    _favorite = listDevice[_room][_id]['favorite'];
  }

  List<String> mode = <String>["Normal", "Quick", "Eco"];
  List<int> timer = <int>[150, 30, 185];

  void setFavorite() {
    _favorite = !_favorite;
    listDevice[_room][_id]['favorite'] = _favorite;
  }

  @override
  Widget build(BuildContext context) {
    return DeviceScaffold(
      setFavorite: setFavorite,
      favorite: _favorite,
      title: _name,
      body: Stack(
        children: [
          Positioned(
            right: 50,
            top: 30,
            child: DeviceStatus(
              status: _status,
              icon: FontAwesomeIcons.kitchenSet,
            ),
          ),
          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PowerButton(
                  onpressed: () {
                    setState(() {
                      _status = !_status;
                      listDevice[_room][_id]['status'] = _status;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<CircleBorder>(
                            const CircleBorder(),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFFE9800)),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(120, 120)),
                          shadowColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      onPressed: () {
                        setState(() {
                          _index = (_index - 1) % mode.length;
                          listDevice[_room][_id]['index'] = _index;
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 90,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Column(
                      children: [
                        const Text(
                          "Mode",
                          style: TextStyle(fontSize: 50),
                        ),
                        _status
                            ? Container(
                                width: 290,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(248, 221, 125, 0.45),
                                ),
                                child: Center(
                                  child: Text(
                                    mode[_index],
                                    style: const TextStyle(
                                      fontSize: 70,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : Container(
                                width: 290,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xffD9D9D9),
                                ),
                              ),
                      ],
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<CircleBorder>(
                            const CircleBorder(),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFFE9800)),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(120, 120)),
                          shadowColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      onPressed: () {
                        setState(() {
                          _index = (_index + 1) % mode.length;
                          listDevice[_room][_id]['index'] = _index;
                        });
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 90,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Timer",
                          style: TextStyle(fontSize: 50),
                        ),
                        _status
                            ? Container(
                                width: 205,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(248, 221, 125, 0.45),
                                ),
                                child: Center(
                                  child: Text(
                                    timer[_index].toString(),
                                    style: const TextStyle(
                                      fontSize: 70,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : Container(
                                width: 205,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xffD9D9D9),
                                ),
                              )
                      ],
                    ),
                    const SizedBox(
                      width: 130,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<CircleBorder>(
                            const CircleBorder(),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              _status
                                  ? const Color(0xFFA2D5EB)
                                  : const Color(0xffD9D9D9)),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(120, 120)),
                          shadowColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      onPressed: () {},
                      child: const Text(
                        "Wash",
                        style: TextStyle(fontSize: 35, color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      width: 170,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<CircleBorder>(
                            const CircleBorder(),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xffD9D9D9)),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(120, 120)),
                          shadowColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      onPressed: () {},
                      child: const Text(
                        "Dry",
                        style: TextStyle(fontSize: 35, color: Colors.black),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
