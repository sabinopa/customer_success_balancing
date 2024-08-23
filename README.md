# Customer Success Balancing

Olá equipe RD, agradeço a oportunidade de realizar esse challenge e dividir um pouco do meu trabalho com vocês, aprendi muito nesse processo. Espero que esta solução esteja de acordo com o esperado e fico à disposição para quaisquer dúvidas ou sugestões. :)

## Descrição

O `CustomerSuccessBalancing` é uma classe em Ruby que implementa um sistema de balanceamento de clientes para _Customer Success_ (CS). O objetivo dessa classe é distribuir clientes entre os _Customer Success_ disponíveis, considerando que alguns CS podem estar indisponíveis, e identificar qual CS ficou com a maior carga de clientes. O código leva em conta as pontuações tanto dos clientes quanto dos _Customer Success`para determinar as melhores alocações.

## Resumo da solução

Para resolver esse desafio, implementei na classe `CustomerSuccessBalancing` um método que mapeia a distribuição de clientes entre um time de Customer Success (CS) para identificar o CS com o maior número de clientes. Basicamente, o método executa os seguintes passos:

#### Inicialização (`initialize`):

A classe recebe três parâmetros:
- lista de funcionários de _Customer Success_ (`@customer_success`);
- lista de clientes (`@customers`)
- lista de IDs de funcionários de _Customer Success_ que estão indisponíveis (`@away_customer_success`).

Esses dados são armazenados como variáveis de instância.

#### Execução (`execute`):

Esse método aloca clientes aos funcionários de _Customer Success_ e identifica qual funcionário atendeu o maior número de clientes.

#### Alocação de Clientes (`allocate_customers_to_cs`):

Este método distribui os clientes entre os funcionários de _Customer Success_ que estão disponíveis.
Os funcionários e os clientes são ordenados por suas pontuações (que provavelmente representam habilidades ou experiência para funcionários e necessidades para clientes).
Cada cliente é atribuído a um funcionário de _Customer Success_ até que a pontuação do cliente seja maior do que a do funcionário atual.

#### Ordenação (`sort_by_score`):

Essa função organiza as listas de clientes e funcionários de _Customer Success_ com base nas suas pontuações, em ordem crescente.

#### Disponibilidade de Funcionários (`available_customer_success`):

Retorna uma lista de funcionários de _Customer Success_ que estão disponíveis, ou seja, aqueles que não estão na lista de indisponíveis (`@away_customer_success`).

#### Verificação de Alocação (`more_customers_to_allocate?`):

Verifica se ainda há clientes para serem atribuídos e se o funcionário atual tem uma pontuação maior ou igual à do próximo cliente a ser atribuído.

#### Identificação do Top _Customer Success_ (`identify_top_customer_success`):

Após a alocação, este método identifica qual funcionário atendeu o maior número de clientes.
Se houver empate (mais de um funcionário com o maior número de clientes), ele retorna 0, caso contrário, retorna o ID do funcionário com o maior número de atendimentos.
`
#### Verificação de Empate (`top_cs_draw?`):

Verifica se há empate entre os funcionários em termos de quantidade de clientes atendidos.

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
ruby customer_success_balancing.rb
```
Isso executará os testes automatizados para validar a lógica implementada.



