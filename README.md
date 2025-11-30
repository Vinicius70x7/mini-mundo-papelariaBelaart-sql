# mini-mundo-papelaria Belaarte - Projeto SQL

## Descrição
Este projeto implementa um banco de dados relacional para uma papelaria, baseado em um modelo lógico que inclui clientes, produtos, fornecedores, funcionários, vendas e compras.  
Foram criadas as tabelas com suas chaves primárias e estrangeiras, além de scripts para inserção, consulta, atualização e exclusão de dados.

## Estrutura do Projeto
- `create_tables.sql` - Script para criação das tabelas e relacionamentos  
- `insert_data.sql` - Script para inserir dados iniciais nas tabelas  
- `select_queries.sql` - Consultas SQL de exemplo para análise de dados  
- `update_delete.sql` - Comandos para atualização e exclusão de registros  

## Instruções para execução
1. Abra o MySQL Workbench ou outra ferramenta de sua preferência.  
2. Crie o banco de dados com:
    ```sql
    CREATE DATABASE papelaria;
    USE papelaria;
    ```
3. Execute os scripts na ordem:
   - `create_tables.sql`
   - `insert_data.sql`
   - `select_queries.sql`
   - `update_delete.sql`
4. Os scripts são independentes e podem ser adaptados conforme necessidade.

## Ferramentas utilizadas
- MySQL 8.x  
- MySQL Workbench  

---

# Mini-mundo e Modelo Lógico

O banco foi estruturado para atender as seguintes entidades e relacionamentos:

- Cliente (Pessoa física ou jurídica)  
- Produto (com categorias)  
- Fornecedor  
- Funcionário (vendedor, gerente)  
- Venda (com itens de venda e forma de pagamento)  
- Compra (com itens de compra)Gestão eficiente de estoque, vendas e fornecedores, garantindo organização e  agilidade nas operações.
