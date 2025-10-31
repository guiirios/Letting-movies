**# 🎬 LettingMovies – Banco de Dados Relacional de Filmes e Avaliações**

Este repositório contém o **modelo relacional completo** do banco de dados **LettingMovies**, desenvolvido no **MySQL Workbench**.  
O objetivo é permitir que usuários avaliem e explorem filmes, diretores, gêneros e atores — inspirado na plataforma **Letterboxd**.

---

## 📁 Estrutura do Repositório

| Arquivo | Descrição |
|----------|------------|
| **LettingMovies.mwb** | Modelo visual criado no *MySQL Workbench* (contém o diagrama e relacionamentos) |
| **lettingmovies.sql** | Script SQL exportado a partir do modelo, usado para criar o banco no MySQL |
| **README.md** | Documentação do projeto |

---


🧱 Estrutura das Tabelas
Tabela	Descrição
Users	Dados dos usuários (nome, e-mail, senha, imagem, data de nascimento)
Movies	Informações sobre os filmes (título, sinopse, data de lançamento, pôster)
Director	Lista dos diretores
Movies_Director	Relação N:N entre filmes e diretores
Genre	Gêneros de filmes
Genre_Movies	Relação N:N entre gêneros e filmes
Actors	Dados dos atores (nome, nacionalidade, bio, nascimento)
Rating	Avaliações e notas dos usuários (1 a 5 estrelas)

💻 Tecnologias Utilizadas
🗄️ MySQL

🧰 MySQL Workbench (modelagem e diagrama)

⚙️ SQL Relacional (DDL + DML + Constraints)

🔄 Git e GitHub (versionamento)
