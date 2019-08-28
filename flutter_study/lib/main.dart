import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to ListView',
      theme: ThemeData(
          primaryColor: Colors.white,
        ),
      home : RandomWords(),
    );
  }
}
/*
home에는 Widget이 들어가야한다.
RandomWords는 StatefulWidget 타입을 반환하고 있다.
 */

/*
RandomWordState는 Scaffold를 반환하고있다. ( 하나의 위젯으로 보임 )
결국 home에 들어가는 것은 Scaffold가 되고 있다.
 */
class RandomWordsState extends State<RandomWords> {
  final List<WordPair> words = <WordPair>[];
  final Set<WordPair> saved = Set<WordPair>();
  final fontSize18 = const TextStyle(fontSize: 18.0);

  void pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = saved.map(
              (WordPair pair) {
                return ListTile(
                  title: Text(
                    pair.asPascalCase,
                    style: fontSize18,
                  ),
                );
              }
          );
          final List<Widget> divided = ListTile.divideTiles(
              context: context,
              tiles: tiles,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text("Saved suggestions"),
            ),
            body: ListView(children: divided),
          );

        }
      )

    );
  }

  /*
  AppBar 쪽에 IconButton을 추가해 선택된 리스트들만을 뷰로 뿌려줄 수 있도록 세팅
  onPressed 쪽으로 fuction 호출을 하고 있음 ( void 형 )
  opPressed로 호출된 메소드는 다른 페이지로 뷰를 넘겨주는 Navigator 객체를 사용함.
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('infinite random listView'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: pushSaved),
        ],
      ),
      body: randomListview(),
    );


  }
  /*
  itemBuilder는 리스트뷰 다음 요소들이 필요할 때 호출되어
  그 다음 element들을 준비하게 한다.

  아래 예제는 odd -> 분리선 , even -> 랜덤 워드
  순서로 리스트 뷰를 뿌려주고 있고,
  새로운 단어를 어레이에 추가할 때는 정확히
  저장된 단어수와 현재 index 값이 같을 때 10개씩 추가한다.
   */
  Widget randomListview() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/2 ;
        if(index >= words.length) {
          words.addAll(generateWordPairs().take(10));
        }
        debugPrint(i.toString() +"th");
        debugPrint("length : "+words.length.toString());
        return listViewRow(words[index]);
      }
    );
  }

  /*
  simple ListTile이지만 UI가 뛰어나다

   */
  Widget listViewRow(WordPair pair){
    final bool alreadySaved = saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asCamelCase,
        style: fontSize18,
      ),
      trailing: Icon(
        alreadySaved? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            saved.remove(pair);
          }
          else {
            saved.add(pair);
          }
        });
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();

}
