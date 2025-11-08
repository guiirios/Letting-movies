# **🎬 LettingMovies – Banco de Dados Relacional de Filmes e Avaliações**

![SQL](https://img.shields.io/badge/SQL-fff?style=for-the-badge&logo=mysql&logoColor=blue)


Este repositório contém o **modelo relacional completo** do banco de dados **LettingMovies**, desenvolvido no **MySQL Workbench**.  
O objetivo é permitir que usuários avaliem e explorem filmes, diretores, gêneros e atores — inspirado na plataforma **Letterboxd**.

---

## 📁 Estrutura do Repositório

| Arquivo | Descrição |
|----------|------------|
| **lettingmovies.mwb** | Modelo visual criado no *MySQL Workbench* (contém o diagrama e relacionamentos) |
| **lettingmovies.sql** | Script SQL exportado a partir do modelo, usado para criar o banco no MySQL |
| **README.md** | Documentação do projeto |

---


## 🧱 Estrutura das Tabelas

| 🗂️ **Tabela** | 📖 **Descrição** |
|----------------|------------------|
| **Users** 👤 | Armazena dados dos usuários, incluindo **nome**, **e-mail**, **senha**, **foto de perfil** e **data de nascimento**. |
| **Movies** 🎬 | Contém informações sobre os **filmes**, como **título**, **sinopse**, **data de lançamento** e **pôster**. |
| **Director** 🎥 | Registra os **diretores** dos filmes. |
| **Movies_Director** 🔁 | Cria a **relação N:N** entre **filmes e diretores**. |
| **Genre** 🏷️ | Define os **gêneros cinematográficos** (Ação, Drama, Comédia, etc.). |
| **Genre_Movies** 🎭 | Cria a **relação N:N** entre **gêneros e filmes**. |
| **Actors** ⭐ | Armazena dados dos **atores**, como **nome**, **nacionalidade**, **biografia** e **data de nascimento**. |
| **Rating** ⭐📊 | Guarda as **avaliações dos usuários**, permitindo notas de **1 a 5** para cada filme. |

---

✨ Cada tabela foi criada com **chaves primárias, estrangeiras e constraints** para garantir a integridade e consistência dos dados.

- Avaliações e notas dos usuários (1 a 5 estrelas)

💻 Tecnologias Utilizadas
🗄️ MySQL

🧰 MySQL Workbench (modelagem e diagrama)

⚙️ SQL Relacional (DDL + DML + Constraints)

🔄 Git e GitHub (versionamento)
