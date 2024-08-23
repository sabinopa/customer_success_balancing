# Customer Success Balancing

Olá equipe RD, queria agradecer a oportunidade de realizar esse challenge e de poder compartilhar um pouco do meu trabalho com vocês. Eu aprendi muito nesse processo, e espero que a solução que desenvolvi esteja alinhada com o que vocês esperavam. Fico à disposição para qualquer dúvida ou sugestão. :)

## Descrição

A classe `CustomerSuccessBalancing` foi criada em **Ruby** para resolver o desafio de balancear a distribuição de clientes entre os _Customer Success_ (CS) disponíveis. O objetivo é identificar qual CS ficou com a maior carga de clientes, levando em consideração que alguns CS podem estar indisponíveis. O código utiliza as pontuações (_scores_) dos clientes e dos CS para determinar a melhor forma de distribuição.

## Resumo da solução

Para resolver o desafio, desenvolvi métodos na classe `CustomerSuccessBalancing` que organiza os clientes entre a equipe de CS e identifica qual deles ficou responsável por atender o maior número de clientes. O processo segue estes passos:

#### 1. Ordena as listas de clientes e de CSs pelo score em ordem.

#### 2. Aloca CSs para atender clientes de nível igual ou inferior.

A lista de CSs e a lista de clientes são percorridas. Cada cliente é atribuído ao CS disponível com a maior pontuação que ainda esteja disponível. Quando um CS é associado a um grupo de clientes, esses clientes são removidos da lista daqueles que ainda precisam ser atendidos. Assim, cada CS só cuida dos clientes que ainda não foram alocados.

#### 3. Retorna o ID do CS com o maior número de clientes.

Após distribuir os clientes, o algoritmo identifica qual CS ficou com a maior quantidade de clientes. Se houver um empate ou se nenhum CS estiver disponível, o método retorna 0. Caso contrário, retorna o ID do CS que atendeu mais clientes.

## Como executar o código

### Pré-requisitos

Ter a linguagem [Ruby versão 3.3.0](https://www.ruby-lang.org/pt/) instalada na sua máquina.

Caso ainda não tenha a gem minitest instalada, você pode instalar rodando o seguinte comando no terminal:

```
gem install minitest
```

### Como executar a aplicação

- Clone este repositório
```
git clone git@github.com:sabinopa/customer_success_balancing.git
```

- Abra o diretório pelo terminal
```
cd challenge
```

### Execute os testes.

Caso não tenha a gem **minitest** instalada, rode o comando abaixo

```
gem install minitest
```

```
ruby customer_success_balancing_test.rb
```
Isso executará os testes automatizados para validar a lógica implementada.



