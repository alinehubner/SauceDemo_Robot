# Projeto de Automação - SauceDemo (Robot Framework)

## 📌 Descrição
Projeto criado como parte de desafio técnico para automação no site [SauceDemo](https://www.saucedemo.com/).

Fluxos validados:
- Login
- Adicionar itens ao carrinho
- Checkout completo


## 🚀 Tecnologias utilizadas
- Robot Framework
- SeleniumLibrary
- JSONLibrary
- WebDriver Manager


## 📂 Estrutura de pastas
```
SauceDemo_Robot/
├── tests/        # Cenários de teste: arquivos .robot
├── resources/    # Page objects: locators e keywords reutilizáveis
├── data/         # Massa de dados
├── reports/      # Relatórios e prints de execução (não versionados no GitHub)
├── requirements.txt  # Lista de dependências do projeto
├── .gitignore        # Arquivos/pastas ignorados pelo Git
└── README.md         # Documentação do projeto
```

## ▶️ Como rodar o projeto
```
1. Clonar repositório

    git clone https://github.com/alinehubner/SauceDemo_Robot.git
    cd SauceDemo_Robot

2. Criar ambiente virtual

    python -m venv .venv

Ativar o ambiente no Windows (PowerShell ou CMD):
    venv\Scripts\activate

3. Instalar dependências
    pip install -r requirements.txt

4. Executar todos os testes
    robot tests/

5. Executar um teste específico
    robot tests/login.robot
```

## 📊 Relatórios de execução
Após rodar os testes, o Robot Framework gera automaticamente:

- report.html → visão geral da execução
- log.html → logs detalhados com passos e prints (se configurados)
- output.xml → saída em XML (útil para CI/CD)

Esses arquivos ficam na raiz do projeto, mas não são versionados no GitHub (estão listados no .gitignore).


## ✅ Cenários implementados
```
1 - Login válido com usuário e senha corretos.
2 - Adicionar itens ao carrinho e validar o total.
3 - Checkout completo até a tela de confirmação.
```

## 🤝 Contribuições

Este projeto é voltado para estudo, prática e avaliação técnica.
Sugestões de melhorias são bem-vindas via Pull Requests.