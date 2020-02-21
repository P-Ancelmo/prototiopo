import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaHome(),
      routes: <String, WidgetBuilder>{
        'TelaMat': (BuildContext context){
          return TelaMat();
        },
        'TelaMed': (BuildContext context){
          return TelaMed();
        }
      }
    );
  }
}

class Base extends StatelessWidget{
  final Widget widget;
  final Widget tituloAppBar;
  final Widget leading;
  
  Base({this.widget, this.tituloAppBar,this.leading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: leading,
        title: tituloAppBar,
        backgroundColor: Colors.deepPurple.shade600,
      ),
      body: Center(
        child: widget,
      ),
    );      
  }
}

class BotaoDoGrid extends StatelessWidget{
  final String nome;
  String caminhoImagem;
  final Widget proximaTela;

  BotaoDoGrid({this.nome, this.proximaTela, this.caminhoImagem});
  @override
  Widget build(BuildContext context) {
    if(caminhoImagem==null){caminhoImagem='assets/jjj.bmp';};
    return Center(
      child: FlatButton(
          onPressed: (){
            if(proximaTela!=null){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return proximaTela;
                  }
                )
              );
            }
          },          
          child: SizedBox(
            width: 150,
            height: 200,
            child: Column(              
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(image: AssetImage('$caminhoImagem'), 
                    width: 150.0,height: 100.0,
                    fit: BoxFit.fill,                
                  ),
                ),
                Text('$nome', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
              ],
            ),
          ),
        ),
      
    );
  }
}

class BotaoDaLista extends StatelessWidget{
  final Widget titulo;
  final Widget subtitulo;
  final Widget proximaTela;

  BotaoDaLista({this.titulo, this.subtitulo, this.proximaTela});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        if(proximaTela!=null){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context){
                return proximaTela;
              }
            )
          );
        }
      },
      child: ListTile(
        title: titulo,
        subtitle: subtitulo,
      ),
    );
  }

}

class BotaoVolta extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed:() {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back, color: Colors.white,)
    );
  }

}

class Grid extends StatelessWidget{
  final String nomeBotao;
  final List<Widget> filhos;
  Grid({this.nomeBotao, this.filhos});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: filhos,
    );
  }
}

class Lista extends StatelessWidget{
  final List<Widget> corpo;

  Lista({this.corpo});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: corpo,
    );
  }
}

class CardBotao extends StatelessWidget{
  final String titulo;
  final String subtitulo;
  final Widget proximaTela;

  CardBotao({@required this.titulo, @required this.subtitulo, this.proximaTela});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[600],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
        color: Colors.blueGrey[600],
        onPressed: (){
          if(proximaTela!=null){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context){
                  return proximaTela;
                }
              )
            );
          }
        },
        child: ListTile(
         title: Text('$titulo', 
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('$subtitulo', 
              style: TextStyle(color: Colors.white
            ),
          ),
       ),
      ),
    );
  }

}

class TelaHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Base(
      tituloAppBar: Text('Minerva Short'),
      widget: Grid(
        filhos: <Widget>[
          BotaoDoGrid(nome: 'Matemática',caminhoImagem: 'assets/matematica.png' ,proximaTela: TelaMat(),),
          BotaoDoGrid(nome: 'Saúde',caminhoImagem: 'assets/saude.png', proximaTela: TelaMed(),)
        ],
      ),
    );
  }  
}

class TelaMat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Base(
      leading: BotaoVolta(),
      tituloAppBar: Text('Matemática'),
      widget: Grid(
        filhos: <Widget>[
          BotaoDoGrid(nome: 'Cálculo',caminhoImagem:'assets/calculo.png' ,proximaTela: TelaCalculo(),)
        ],
      ),
    );
  }
}

class TelaMed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Base(
      leading: BotaoVolta(),
      tituloAppBar: Text('Saúde'),
      widget: Grid(
        filhos: <Widget>[
          BotaoDoGrid(nome: 'Anatomia',caminhoImagem:'assets/anatomia.png' ,proximaTela: TelaAnatomia(),)
        ],
      ),
    );
  }
}

class TelaCalculo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Base(
      tituloAppBar: Text('Cálculo'),
      widget: Column(
        children: <Widget>[
          CardBotao(
            titulo: 'Derivada',
            subtitulo: 'Definição',
          ),

          CardBotao(          
            titulo: 'Integral',
            subtitulo: 'Definição, integral por partes, por substituição e funçoes parciais',
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Integral'),
              telaTeoria: TelaTeoria(
                <TextoTeoria>[
                  TextoTeoria(
                    titulo: 'Integral',
                    descricao: 'É o inverso da derivada, dessa forma, ao ver integral de *alguma coisa*, deve-se pensar qual a função cuja derivada seja essa *alguma coisa*',
                  ),
                  /*TextoTeoria(
                    titulo: 'Integral por substituição',
                    descricao: '',
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TelaAnatomia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Base(
      tituloAppBar: Text('Anatomia'),
      widget: Column(
        children: <Widget>[
          CardBotao(
            titulo: 'Sistema articular',
            subtitulo: '',
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema articular'),
              //telaTeoria: TelaTeoria(),
            ),
          ),

          CardBotao(
            titulo: 'Sistema circulatório',
            subtitulo: '',
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema circulatório'),
            ),
          ),

          CardBotao(
            titulo: 'Sistema digestório',
            subtitulo: '',
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema digestório'),
            ),
          ),

          CardBotao(
            titulo: 'Sistema excretor',
            subtitulo: '',
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema excretor'),
            ),
          ),

          CardBotao(
            titulo: 'Sistema muscular',
            subtitulo: '',
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema muscular'),
            ),
          ),

          CardBotao(
            titulo: 'Sistema respiratório',
            subtitulo: '',
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema respiratório'),
            ),
          ),
        ],
      ),
    );
  }
}

class TelaQuestionario extends StatelessWidget{
  final Widget tituloAppBar;
  final Widget telaTeoria;
  final Widget telaQuestionarioAle;
  final Widget telaQuestionarioTop;
  final Widget telaQuestionarioTemp;
  
  TelaQuestionario({this.tituloAppBar,this.telaTeoria, this.telaQuestionarioAle, this.telaQuestionarioTop, this.telaQuestionarioTemp});
  
  @override
  Widget build(BuildContext context) {
    return Base(
      tituloAppBar: tituloAppBar,
      widget: Grid(
        filhos: <Widget>[
          BotaoDoGrid(nome: 'Teoria',caminhoImagem:'assets/teoria.png',proximaTela: telaTeoria,),
          BotaoDoGrid(nome: 'Questionario aleatório',caminhoImagem:'assets/questionario.png' ,proximaTela: telaQuestionarioAle,),
          BotaoDoGrid(nome: 'Questionario por tópico',caminhoImagem:'assets/questionario.png' ,proximaTela: telaQuestionarioTop),
          BotaoDoGrid(nome: 'Questionario c/ Tempo',caminhoImagem:'assets/questionario.png' ,proximaTela: telaQuestionarioTemp),
        ],
      ),
    );
  }
}

class TelaTeoria extends StatelessWidget{
  
  final List<TextoTeoria> textos;

  TelaTeoria(this.textos);

  @override
  Widget build(BuildContext context) {
    return Base(
      tituloAppBar: Text('Teoria'),
      widget: Column(
        children: textos,
      ),
    ); 
  }
}


class TextoTeoria extends StatelessWidget{
  
  final String titulo;
  final String descricao;

  TextoTeoria({@required this.titulo, @required this.descricao});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox( height: 16.0,),
        Text('$titulo', 
          style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox( height: 8.0,),
        Divider(color: Colors.blueGrey[600]),
        const SizedBox( height: 8.0,),
        Text('$descricao',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox( height: 16.0,),
        //Divider(color: Colors.blueGrey[600]),
      ],
    );
  }
}

class Descricao extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox( height: 32.0,),
        Text('titulo', 
          style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
          const SizedBox( height: 8.0,),
        Text('descricao',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox( height: 16.0,),
        Divider(color: Colors.blueGrey[600]),
      ],
    );
  }
}