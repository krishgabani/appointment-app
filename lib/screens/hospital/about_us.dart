import 'package:flutter/material.dart';
import 'package:proj/data/onboarding_content.dart';
import '../../../../size_config.dart';
import 'package:intl/intl.dart';

import '../../size_config.dart';

class AboutUs extends StatefulWidget {
  AboutUs({
    Key? key,
    required this.content,
  }) : super(key: key);
  Map<String, dynamic> content;

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final deviceWidth = SizeConfig.screenW;
    final deviceHeight = SizeConfig.screenH;
    var keys = (widget.content['time'] as Map<String, dynamic>).keys.toList();
    return Container(
      //850,700
      margin: const EdgeInsets.only(top: 8, left: 10, right: 10),
      height: _expanded
          ? 340.0 + (widget.content['doctorList'].length * 85)
          : 200.0 + (widget.content['doctorList'].length * 85),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              height: 40,
              child: Row(
                children: [
                  Text(
                    'Time:  ',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 40,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            widget.content['time']
                                [DateFormat('EEEE').format(DateTime.now())],
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontFamily: 'Mulish'),
                          ),
                        ),
                        IconButton(
                          icon: _expanded
                              ? const Icon(Icons.expand_less)
                              : const Icon(Icons.expand_more),
                          onPressed: () {
                            setState(() {
                              _expanded = !_expanded;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_expanded)
            Container(
              height: deviceHeight! * 0.2,
              child: Row(
                children: [
                  Container(
                    width: deviceWidth! * 0.22,
                    child: ListView.builder(
                      itemCount: keys.length,
                      itemBuilder: (ctx, index) {
                        return Text(
                          keys[index],
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 15),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 20,
                    child: ListView.builder(
                      itemCount: keys.length,
                      itemBuilder: (ctx, index) {
                        return Text(
                          ':',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 15),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: deviceWidth * 0.5,
                    child: ListView.builder(
                      itemCount: keys.length,
                      itemBuilder: (ctx, index) {
                        return Text(
                          widget.content['time'][keys[index]],
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 15),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          const Divider(),
          Text(
            'Service',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.content['service'],
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const Divider(),
          Text(
            'Doctors',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 80.0 * (widget.content['doctorList'] as List).length,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: (widget.content['doctorList'] as List).length,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        (widget.content['doctorList'] as List)[index]['img']),
                  ),
                  title: Text(
                    (widget.content['doctorList'] as List)[index]['name'],
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    (widget.content['doctorList'] as List)[index]['edu'],
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 14),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
