import 'package:atividade3/atividade3.dart' as atividade3;
import 'dart:io';
import 'dart:math';

class Funcionario{
  late int _id;
  late String _nome, _cargo;
  late double _salario;
  bool salariosetado = false;

  Random random = Random();

  Funcionario();

  int get getId => _id;
  String get getNome => _nome;
  String get getCargo => _cargo;
  double get getSalario => _salario;

  void setId(){
     int id = random.nextInt(50); 
    _id = id;
  }
  void setNome(String nome){
    _nome = nome;
  }
  void setCargo(String cargo){
    _cargo = cargo;
  }
  void setSalario(double valor){
    salariosetado = true;
    _salario = valor;
  }

  void aumentarSalario(double percentual){
    _salario = _salario * (percentual + 1);
  }

  void exibirInformacoes(){
    print("Id: $getId");
    print("Nome $getNome");
    print("Cargo: $getCargo");
    if(salariosetado){
      print("Salário: $getSalario \n");
    }
    print("-----");
  }
}

class Empresa{
  late final int id;
  late List<Funcionario> idList = [];

  Empresa(this.id);

  adicionarFuncionario(Funcionario funcionario){
    idList.add(funcionario);
  }

  removerFuncionario(int id){
    idList.remove(idList[id]);
  }

  listarFuncionario(){
    print("Funcionarios: ");
    for(var i = 0; i < idList.length; i++){
      idList[i].exibirInformacoes();
    }
  }
}
void main() {
  
  Funcionario funcionario = Funcionario();
  

  Funcionario f1 = Funcionario();
  f1.setId();
  f1.setNome('Clara');
  f1.setCargo('TI');
  f1.setSalario(3000);
  Funcionario f2 = Funcionario();
  f2.setId();
  f2.setNome('Maria');
  f2.setCargo('TI');
  f2.setSalario(3000);
  Funcionario f3 = Funcionario();
  f3.setId();
  f2.setNome('Ferreira');
  f3.setCargo('TI');
  f3.setSalario(3000);

  Empresa empresa = Empresa(funcionario.getId);

  
  empresa.adicionarFuncionario(f1);
  empresa.adicionarFuncionario(f2);
  empresa.adicionarFuncionario(f3);


  print('Funcionários cadastrados:');
  empresa.listarFuncionario();

 
  print('\nAplicando aumento de 10% no salário de Clara...');
  f1.aumentarSalario(10);

  print('\nAplicando aumento de 5% no salário de Maria...');
  f2.aumentarSalario(5);

  
  print('\nDados atualizados dos funcionários:');
  empresa.listarFuncionario();


  print('\nRemovendo o funcionário com ID 2 (Maria)...');
  empresa.removerFuncionario(2);

  print('\nLista de funcionários após remoção:');
  empresa.listarFuncionario();
}
