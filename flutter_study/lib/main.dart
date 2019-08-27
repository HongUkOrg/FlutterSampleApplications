import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to ListView',
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
  final words = <WordPair>[];
  final fontSize18 = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('infinite random listView'),
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
    return ListTile(
      title: Text(
        pair.asCamelCase,
        style: fontSize18,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();

}
