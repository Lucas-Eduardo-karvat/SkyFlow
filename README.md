# SkyFlow

Sistema de gerenciamento de voos desenvolvido para a disciplina de Banco de Dados utilizando PostgreSQL, MongoDB e Spring Boot.

O projeto simula um sistema de reservas de passagens aéreas, contendo cadastro de voos, aeroportos, aeronaves, passageiros, reservas e avaliações dos voos.

Além do banco relacional, também foi utilizado MongoDB para armazenar as avaliações dos passageiros.

---

# Tecnologias utilizadas

- Java 21
- Spring Boot
- Spring Data JPA
- Spring Data MongoDB
- PostgreSQL
- MongoDB
- Flyway
- Maven
- HTML
- CSS
- JavaScript

---

# Como executar

Primeiramente é necessário possuir PostgreSQL e MongoDB instalados.

Criar um banco chamado:

```
skyflow_db
```

Depois configurar o arquivo:

```
src/main/resources/application.properties
```

com usuário e senha do PostgreSQL e também os dados do MongoDB.

Exemplo:

```
spring.datasource.url=jdbc:postgresql://localhost:5432/skyflow_db
spring.datasource.username=postgres
spring.datasource.password=senha

spring.data.mongodb.uri=mongodb://localhost:27017/skyflow
```

Após isso basta executar a aplicação.

Na primeira execução o Flyway irá criar todas as tabelas automaticamente.

Não é necessário criar nenhuma tabela manualmente.

---

# Estrutura do banco PostgreSQL

O banco foi organizado para representar uma companhia aérea.

As tabelas possuem relacionamento através de chaves estrangeiras.

## companhias_aereas

Armazena as empresas responsáveis pelos voos.

Campos principais:

- id
- nome
- codigo_iata
- pais

---

## aeroportos

Contém os aeroportos utilizados pelos voos.

Campos principais:

- codigo_iata
- cidade
- estado
- país

---

## aeronaves

Representa os aviões cadastrados.

Cada aeronave pertence a uma companhia aérea.

Relacionamento:

```
companhias_aereas
      |
      |
aeronaves
```

---

## voos

Tabela principal do sistema.

Cada voo possui:

- origem
- destino
- aeronave
- data de partida
- data de chegada
- preço
- status

Relacionamentos:

```
aeroportos
      |
      |
      +------ voos ------+
                          |
                          |
                     aeronaves
```

---

## escalas

Guarda as paradas intermediárias de cada voo.

Um voo pode possuir nenhuma ou várias escalas.

---

## classes

Define as categorias dos assentos.

Exemplo:

- Econômica
- Executiva
- Primeira Classe

---

## assentos

Todos os assentos disponíveis para determinado voo.

Cada assento pertence a uma classe.

Também possui um campo indicando disponibilidade.

---

## passageiros

Cadastro dos clientes.

São armazenados:

- nome
- CPF
- email
- telefone

---

## reservas

Responsável por ligar passageiro, voo e assento.

Também registra:

- localizador
- valor pago
- status da reserva

É uma das tabelas mais importantes do projeto.

---

## historico_reservas

Utilizada pelos gatilhos (Triggers).

Sempre que ocorre alteração em uma reserva, uma nova linha é inserida nesta tabela registrando a operação realizada.

---

# Banco MongoDB

O MongoDB foi utilizado para armazenar avaliações dos voos.

Cada documento contém informações como:

- vooId
- nome do passageiro
- nota
- comentário

Esse banco foi escolhido porque avaliações possuem estrutura simples e podem crescer rapidamente sem necessidade de muitos relacionamentos.

---

# Flyway

Todo o banco é criado automaticamente através das migrations.

Arquivos localizados em:

```
src/main/resources/db/migration
```

Cada arquivo possui uma responsabilidade.

```
V1 -> criação das tabelas

V2 até V7 -> inserção dos dados iniciais

V8 -> índices

V9 até V11 -> views

V12 -> materialized views

V13 -> procedures

V14 -> triggers

V15 -> roles e permissões
```

A ordem é executada automaticamente pelo Flyway.

---

# Procedures

O projeto possui procedures implementadas em PostgreSQL.

Entre elas:

- reservar_assento()

Realiza a reserva verificando disponibilidade do assento e atualizando sua situação.

- listar_reservas()

Percorre todas as reservas utilizando cursor e apresenta os registros.

---

# Triggers

Foi criada trigger para registrar alterações das reservas.

Sempre que uma reserva sofre atualização, uma linha é gravada na tabela historico_reservas.

Isso permite manter um histórico das operações realizadas.

---

# Views

Foram criadas views para facilitar consultas frequentes.

Elas unem informações de várias tabelas em uma única consulta.

Também existem materialized views para consultas que exigem melhor desempenho.

---

# Índices

Foram criados índices para acelerar pesquisas realizadas frequentemente pelo sistema.

Principalmente em:

- voos
- reservas
- passageiros

---

# Backend

O backend foi desenvolvido utilizando Spring Boot.

A estrutura segue a divisão tradicional em camadas.

```
Controller

↓

Service

↓

Repository

↓

Banco de Dados
```

## Controller

Recebe as requisições HTTP.

Responsável pelos endpoints da aplicação.

---

## Service

Contém as regras de negócio.

Realiza consultas, monta objetos e integra PostgreSQL com MongoDB.

---

## Repository

Responsável pela comunicação com os bancos.

Existem repositórios JPA para PostgreSQL e MongoRepository para MongoDB.

---

## DTO

Foi utilizado o DTO VooComAvaliacoesDTO para unir informações vindas dos dois bancos.

O objeto contém:

- dados do voo (PostgreSQL)
- avaliações (MongoDB)

permitindo enviar tudo em uma única resposta para o frontend.

---

# Frontend

O frontend foi desenvolvido utilizando HTML, CSS e JavaScript.

A comunicação ocorre através da API REST do Spring Boot utilizando fetch().

O sistema possui duas páginas principais.

## index.html

Lista todos os voos cadastrados.

Permite visualizar informações básicas e acessar os detalhes.

---

## detalhes.html

Exibe informações completas do voo juntamente com as avaliações armazenadas no MongoDB.

---

# Estrutura do projeto

```
backup/
```

Scripts utilizados para backup e restauração do banco.

---

```
mongo/
```

Arquivos utilizados para inserção de avaliações e consultas no MongoDB.

---

```
sql/
```

Scripts auxiliares para consultas, transações e testes.

---

```
src/main/java
```

Código principal da aplicação.

---

```
controller/
```

Controladores REST.

---

```
service/
```

Implementação das regras de negócio.

---

```
repository/
```

Comunicação com PostgreSQL.

---

```
mongo/repository/
```

Comunicação com MongoDB.

---

```
model/
```

Entidades do PostgreSQL.

---

```
mongo/model/
```

Documentos do MongoDB.

---

```
dto/
```

Objetos utilizados para transportar dados entre backend e frontend.

---

```
resources/db/migration
```

Scripts do Flyway responsáveis pela criação automática do banco.

---

```
resources/static
```

Arquivos do frontend.

Contém HTML, CSS, JavaScript e imagens.

---

# Considerações finais

O SkyFlow foi desenvolvido com o objetivo de aplicar os principais conceitos estudados na disciplina de Banco de Dados.

Durante o desenvolvimento foram utilizados relacionamentos, índices, views, materialized views, procedures, triggers, roles, transações e integração entre PostgreSQL e MongoDB através de uma aplicação Spring Boot.

O sistema também possui uma interface web simples para consulta dos voos e visualização das avaliações armazenadas no banco NoSQL.
# Banco de Dados MongoDB

Além do PostgreSQL, o projeto utiliza o MongoDB para armazenar avaliações dos voos.

A utilização de um banco NoSQL permite armazenar informações flexíveis, sem necessidade de relacionamentos complexos, tornando o armazenamento de comentários e avaliações mais simples.

## Estrutura

Coleção utilizada:

```
avaliacoes
```

Exemplo de documento:

```json
{
    "_id": ObjectId("..."),
    "vooId": 1,
    "nomeCliente": "Lucas",
    "nota": 5,
    "comentario": "Excelente voo, equipe muito atenciosa.",
    "data": "2026-06-20"
}
```

Cada documento representa uma avaliação realizada por um cliente para determinado voo.

O relacionamento entre MongoDB e PostgreSQL acontece através do campo **vooId**, que corresponde ao **id** da tabela `voos` do PostgreSQL.

---

# Configuração do MongoDB

É necessário possuir o MongoDB instalado e em execução.

A conexão é configurada no arquivo:

```
src/main/resources/application.properties
```

Exemplo:

```properties
spring.data.mongodb.uri=mongodb://localhost:27017/skyflow
```

Neste projeto é utilizada uma única coleção chamada **avaliacoes**.

---

# Inserção dos dados

Na pasta:

```
mongo/
```

existem dois arquivos.

## insert_avaliacoes.js

Responsável por inserir avaliações de exemplo na coleção.

Executar:

```bash
mongosh skyflow < mongo/insert_avaliacoes.js
```

Após a execução, a coleção será criada automaticamente caso ainda não exista.

---

## aggregation.js

Contém exemplos de consultas utilizando o Aggregation Framework do MongoDB.

As agregações demonstram operações como:

- média de notas por voo;
- quantidade de avaliações;
- agrupamentos;
- estatísticas das avaliações.

---

# Integração entre PostgreSQL e MongoDB

A aplicação busca os dados do voo no PostgreSQL utilizando o Spring Data JPA.

Em seguida, consulta as avaliações correspondentes no MongoDB através do Spring Data MongoDB.

Os dois resultados são unidos na classe:

```
VooComAvaliacoesDTO
```

Essa classe possui dois atributos:

- voo (dados vindos do PostgreSQL);
- avaliacoes (dados vindos do MongoDB).

Dessa forma, o sistema consegue exibir em uma única tela todas as informações do voo juntamente com suas avaliações.

---

# Estrutura MongoDB

```
mongo
├── aggregation.js
└── insert_avaliacoes.js

src/main/java/com/projeto_reserva/SkyFlow/mongo
├── model
│   └── Avaliacao.java
└── repository
    └── AvaliacaoRepository.java
```

## Avaliacao.java

Representa o documento armazenado na coleção **avaliacoes**.

Mapeia os campos do MongoDB para objetos Java.

## AvaliacaoRepository.java

Responsável pelas consultas na coleção utilizando Spring Data MongoDB.

Permite localizar avaliações de um voo específico através do campo **vooId**.

---

# Funcionamento

1. O usuário pesquisa um voo.

2. O backend consulta o PostgreSQL e retorna os dados do voo.

3. O sistema consulta o MongoDB utilizando o id do voo.

4. As avaliações encontradas são adicionadas ao DTO.

5. O frontend recebe um único objeto contendo informações do voo e suas avaliações.

Esse modelo demonstra a integração entre um banco relacional (PostgreSQL) e um banco NoSQL (MongoDB), utilizando cada tecnologia para o tipo de dado mais adequado.