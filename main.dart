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
      //backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        leading: leading,
        title: tituloAppBar,
        backgroundColor: Colors.cyan,
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
            child: GridView.count(
              crossAxisCount: 1,
              
              children: <Widget>[
                Image(image: AssetImage('$caminhoImagem'), 
                  width: 150.0,height: 100.0
                ),
                Text('$nome', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
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

class Expansivel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      children: <ExpansionPanel>[
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool expansivel){
            expansivel = true;
            return ListTile(
              title: Text('teste'),
            );
          },
          body: Text('hehe'),
          isExpanded: true,

        ),
      ],
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
          BotaoDoGrid(nome: 'Mat/Comp',caminhoImagem: 'assets/matematica.png' ,proximaTela: TelaMat(),),
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
          BotaoDoGrid(nome: 'Cálculo',caminhoImagem:'assets/calculo.jpg' ,proximaTela: TelaCalculo(),)
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
      widget: Lista(
        corpo: <Widget>[
          BotaoDaLista(titulo: Text('Binomios')),
          BotaoDaLista(titulo: Text('Derivada')),
          BotaoDaLista(titulo: Text('Funções')),
          BotaoDaLista(titulo: Text('Exponencial')),
          BotaoDaLista(titulo: Text('Integral'),subtitulo: Text('Definição, integral por partes, por substituição e funçoes parciais'),
            proximaTela: TelaQuestionario(tituloAppBar: Text('Integral'),),
          ),
          BotaoDaLista(titulo: Text('Limite'), subtitulo: Text('Definição, L Hospital,inteterminações'),
            proximaTela: TelaQuestionario(tituloAppBar: Text('Limite'),),
          ),
          BotaoDaLista(titulo: Text('Logaritmo')),
          BotaoDaLista(titulo: Text('Pré Cálculo')),          
          
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
      widget: Lista(
        corpo: <Widget>[
          BotaoDaLista(titulo: Text('Sistema articular'),
            subtitulo: Text(''),
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema articular'),
            ),
          ),
          BotaoDaLista(titulo: Text('Sistema circulatório'), 
            subtitulo: Text(''),
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema circulatorio'),
            ),
          ),
          BotaoDaLista(titulo: Text('Sistema digestório'),
            subtitulo: Text(''),
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema digestório'),
            ),
          ),
          BotaoDaLista(titulo: Text('Sistema excretor'),
            subtitulo: Text(''),
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema excretor'),
            ),
          ),
          BotaoDaLista(titulo: Text('Sistema muscular'),
            subtitulo: Text(''),
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema Muscular'),
            ),
          ),
          BotaoDaLista(titulo: Text('Sistema respiratório'),
            subtitulo: Text(''),
            proximaTela: TelaQuestionario(
              tituloAppBar: Text('Sistema respiratorio'),
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
          BotaoDoGrid(nome: 'Teoria',caminhoImagem:'assets/questionario.jpg' ,proximaTela: telaTeoria,),
          BotaoDoGrid(nome: 'Questionario aleatório',caminhoImagem:'assets/questionario.jpg' ,proximaTela: telaQuestionarioAle,),
          BotaoDoGrid(nome: 'Questionario por tópico',caminhoImagem:'assets/questionario.jpg' ,proximaTela: telaQuestionarioTop),
          BotaoDoGrid(nome: 'Questionario c/ Tempo',caminhoImagem:'assets/questionario.jpg' ,proximaTela: telaQuestionarioTemp),
        ],
      ),
    );
  }
}