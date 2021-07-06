import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const List<String> _title = [
    '제목 1',
    '제목 2',
    '제목 3',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _topItem(),
                Container(
                  margin: EdgeInsets.only(top: 45, left: 20),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_alert_rounded),
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                height: 1.0,
                width: size.width,
                color: Colors.black26,
              ),
            ),
            _todayDate(),
            _menuForm(size),
            _RealTimePopularPostsForm(size),
            _itemOfEducation(size),
            _addForm(),
          ],
        ),
      ),
    );
  }

  Widget _todayDate() {
    return Text(
      "2021년 7월 5일",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black26,
      ),
    );
  }

  Widget _menuForm(Size size) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.school),
                  iconSize: size.width*0.1,
                  onPressed: () {
                  },
                ),
                Text('학교 홈'),
              ],
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  iconSize: size.width*0.1,
                  onPressed: () {
                  },
                ),
                Text('과외신청'),
              ],
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.recent_actors),
                  iconSize: size.width*0.1,
                  onPressed: () {
                  },
                ),
                Text('랭킹'),
              ],
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.people),
                  iconSize: size.width*0.1,
                  onPressed: () {
                  },
                ),
                Text('친구초대'),
              ],
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.cleaning_services),
                  iconSize: size.width*0.1,
                  onPressed: () {
                  },
                ),
                Text('봉사활동')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _addForm() {
    return Card(
      // 아래 위젯들을 카드 틀에 맞추기
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 1,
      child: Column(
        children: <Widget>[Image(image: AssetImage('assets/add.png'))],
      ),
    );
  }

  Widget _RealTimePopularPostsForm(Size size) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "실시간 인기글",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black26,
                    ))
              ],
            ),
            _popularList(size),
          ],
        )),
      ),
    );
  }

  Widget _popularList(Size size) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _title.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _title[index],
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.remove_red_eye,
                  color: Colors.black26,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "11",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.chat,
                  color: Colors.black26,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "23",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }

  Widget _itemOfEducation(Size size) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add_alert_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "교육부 자가진단 바로가기",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black26,
                    ))
              ],
            ),
            Container(
              height: 8,
            ),
          ],
        )),
      ),
    );
  }

  Widget _topItem() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              '동인천고등학교',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.change_circle_outlined,
                color: Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
