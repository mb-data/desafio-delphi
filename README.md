# Desafio Backend | Delphi

Olá, candidato! Se você está interessado em se juntar à nossa equipe como Desenvolvedor Delphi Sênior, temos um desafio que ajudará a demonstrar suas habilidades e criatividade. Esperamos que você se divirta com esse projeto!

## 🚀 Objetivo:

Desenvolver uma aplicação em Delphi que simule um sistema de gerenciamento de estoque para uma loja, com foco em operações CRUD (Criar, Ler, Atualizar, Deletar) e integração com banco de dados.

## 📜 Requisitos:

### 1. Tecnologias:

- Delphi 10+
- FireDAC ou similar para acesso a banco de dados
- Banco de dados de sua escolha (Interbase, Firebird, MySQL, PostgreSQL, etc.)
- Testes automatizados

### 2. Gerenciamento de Produtos:
- Criar, listar, atualizar e deletar produtos.
- Cada produto deve ter um identificador, nome, preço, quantidade em estoque e uma categoria (eletrônicos, vestuário, alimentos, etc.)

### 3. Gerenciamento de Estoque
- Funcionalidade para entrada e saída de produtos.
- Atualizar automaticamente a quantidade em estoque à medida que produtos são adicionados ou vendidos.

### 4. Interação com Banco de Dados
- Configurar e utilizar um banco de dados para armazenar informações de produtos e transações de estoque.
- Demonstrar o uso de transações e consultas SQL.

### 5. Interface Gráfica
- Desenvolver uma interface gráfica amigável e intuitiva para interação com o sistema.
- Implementar validações de entrada de dados na interface.

### 6. Autenticação
- Implementar um sistema de login para acesso à aplicação.

### 7. Testes
- Escrever testes para validar as funcionalidades principais.

### 8. Documentação
- Documentar o design da aplicação, estrutura de banco de dados e instruções de uso.

## 🥇 Diferenciais:

- Uso de padrões de design (MVC, MVVM, etc.).
- Recursos de segurança (criptografia, proteção contra SQL Injection, etc.).
- Relatórios e análises de dados.
- Uso de componentes de terceiros para melhorar a UI/UX.

## 🗳️ Instruções de Submissão:

1. Crie um repositório no GitHub para o seu projeto.
2. Faça commits e pushes das suas mudanças para esse repositório.
3. Envie um e-mail para [pedro.miotti@khipo.com.br] com o link do repositório.

## 🧪 Avaliação:

- Estrutura do código e organização.
- Uso adequado das ferramentas e tecnologias Delphi.
- Implementação dos requisitos e lógica de negócios.
- Qualidade da interface gráfica e experiência do usuário.
- Testes e documentação.

Boa sorte com o desafio! Estamos animados para ver o que você pode criar.


----------------------------------------------------------------------------

## - Solução proposta:

Foi desenvolvido um sistema para entrada e saida de produtos

Fluxograma da solução

![Diagramas técnicos](https://github.com/winaba/desafio-delphi/assets/17182623/9d1b9d47-60ef-4746-9d3c-27ed1d01973f)


Composto por:
- telas de Login, 
- cadastro de usuario, 
- entrada e saida de produtos, 
- cadastro de produtos

Ao abrir o sistema é apresentado a tela de login:

![Captura de tela 2024-03-09 031242](https://github.com/winaba/desafio-delphi/assets/17182623/e37e77fd-d421-472f-9c55-d029268fbd6e)


Caso não possua usuario, é necessario cadastra-lo no botão 'Cadastrar'

![Captura de tela 2024-03-09 031328](https://github.com/winaba/desafio-delphi/assets/17182623/33e715f1-b734-4fc4-93e8-8e8d57a22e24)


Depois de possuir o cadastro e se logar, será apresentado a tela de entrada e saída de prdoutos

![Captura de tela 2024-03-09 031959](https://github.com/winaba/desafio-delphi/assets/17182623/4ec5fbcb-7ecf-4557-afba-34bc86bdc4f5)

Caso no momento do cadastro da movimentação o produto não esteja disponivel, clique no botão '+'

![Captura de tela 2024-03-09 032032](https://github.com/winaba/desafio-delphi/assets/17182623/46ddf955-c97c-406a-b624-931e8849ed45)


Configuração

Para rodar a aplicação é necerio tem um arquivo ini ```config.ini``` configurado no mesmo diretório que o exe

Exemplo:

```
[base]
path=E:\estudos\delphi\desafio_khipo2\desafio-delphi\src\database\desafio_delphi.db
```
Banco de dados

O banco de dados utilizado nesta aplicação foi o SQLite

há exemplos de banco de dados em 'src/database'


