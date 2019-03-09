% ------------------------------------------------------------------------------- %
%                                    LICENSE   	                                  %
% ------------------------------------------------------------------------------- %
% LaTeX Project Public License v1.3c                                              %
%                                                                                 %
% This work may be distributed and/or modified under the                          %
% conditions of the LaTeX Project Public License, either version 1.3              %
% of this license or (at your option) any later version.                          %
% The latest version of this license is in                                        %
%   http://www.latex-project.org/lppl.txt                                         %
% and version 1.3 or later is part of all distributions of LaTeX                  %
% version 2005/12/01 or later.                                                    %
%                                                                                 %
% Creator and mantainer: Humberto da Silva Neto <humberto.nt4@gmail.com>          %
% Git Repo: https://github.com/hsneto/iftex                                       %
% ------------------------------------------------------------------------------- %

% Normas do IFES ==> https://www.ci.ifes.edu.br/images/stories/2017/biblioteca/caderno_normas_tcc_2017-277_rev_27-11.pdf

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iftex}[18/12/2018 v1.2 Modelo de TCC baseado em abnTeX2]

% ------------------------------------------------------------------------------- %
% PARÂMETROS INICIAIS DO ABNTEX2                                                  %
% ------------------------------------------------------------------------------- %
% Repassa todos os parametros a classe abntex2
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}}

\ProcessOptions\relax
\LoadClass{abntex2}

% ------------------------------------------------------------------------------- %
% PACKAGES                                                                        %
% ------------------------------------------------------------------------------- %
\usepackage{tocloft}
\PassOptionsToClass{titles}{tocloft}

\usepackage{cmap}               % Mapear caracteres especiais no PDF
\usepackage[utf8]{inputenc}     % Codificacao do documento
\usepackage{lastpage}           % Para total de páginas
\usepackage{mathptmx}           % Usa a fonte times
\usepackage[T1]{fontenc}		    % Selecao de codigos de fonte
\usepackage{lastpage}			      % Usado pela Ficha catalográfica
\usepackage{indentfirst}		    % Indenta o primeiro parágrafo de cada seção
\usepackage[dvipsnames]{xcolor} % Controle das cores
\usepackage{graphicx}			      % Inclusão de gráficos
\usepackage{microtype} 			    % para melhorias de justificação

\usepackage[brazilian,hyperpageref]{backref}
\usepackage[abnt-emphasize=bf, alf, abnt-full-initials=yes]{abntex2cite} % Citações padrão ABNT

\usepackage{parskip}			      % espaçamento entre os parágrafos
\usepackage{xcolor}
\usepackage{listings}
\usepackage[caption=false,font=normalsize]{subfig}

\usepackage{xparse}             % Mais de um argumento opcional nos macros

%% Flush captions to left
\hangcaption
\captionstyle[\raggedright]{}

% ------------------------------------------------------------------------------- %
% CONFIGURAÇÕES DO PACOTE BACKREF                                                 %
% ------------------------------------------------------------------------------- %
% Usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{}%

% ------------------------------------------------------------------------------- %
% MARGENS DO DOCUMENTO                                                            %
% ------------------------------------------------------------------------------- %
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout

% ------------------------------------------------------------------------------- %
% LIDANDO COM WARNINGS                                                            %
% ------------------------------------------------------------------------------- %
% Remover warning: Token not allowed in a PDF string (PDFDocEncoding): (hyperref) removing `\uppercase' 
\pdfstringdefDisableCommands{\let\uppercase\relax}

% Remover warning: underfull hboxes
\hbadness=10000
% Remover warning: overfull \hbox
\hfuzz=500pt 

% ------------------------------------------------------------------------------- %
% NOVOS COMANDOS                                                                  %
% ------------------------------------------------------------------------------- %
% Legendas
\newcommand{\source}[1][Elaborado pelo autor (\imprimirdata)]{\begin{flushleft}\footnotesize Fonte: #1\end{flushleft}}
\renewcommand{\legend}[1]{\begin{flushleft}\footnotesize Fonte: #1\end{flushleft}}

% Títulos 
\renewcommand{\ABNTEXchapterfont}{\rmfamily\bfseries}

\renewcommand*{\chapnumfont}{\normalfont\normalsize\bfseries}
\renewcommand*{\chaptitlefont}{\normalfont\normalsize\bfseries}

\setsecheadstyle{\normalfont\normalsize\MakeUppercase}
\renewcommand\cftsectionfont{\normalfont\normalsize\Capitalize}

\setsubsecheadstyle{\normalfont\normalsize\bfseries}
\renewcommand\cftsubsectionfont{\normalfont\normalsize\bfseries}

\setsubsubsecheadstyle{\normalfont\normalsize}
\renewcommand\cftsubsubsectionfont{\normalfont\normalsize}

\setsubsubsubsecheadstyle{\normalfont\itshape}
\renewcommand\cftparagraphfont{\normalfont\normalsize\itshape} 

% Curso
\providecommand{\imprimircurso}{}
\newcommand{\curso}[1]{\renewcommand{\imprimircurso}{#1}}

% Data de aprovação
\providecommand{\imprimirapprovaldate}{}
\newcommand{\approvaldate}[3]{\renewcommand{\imprimirapprovaldate}{Aprovado em #1 de #2 de #3}}

% Palavras chave
\providecommand{\palavrachaveum}{}
\providecommand{\palavrachavedois}{}
\providecommand{\palavrachavetres}{}
\providecommand{\palavrachavequatro}{}
\providecommand{\palavrachavecinco}{}
\providecommand{\palavrachaveseis}{}
\NewDocumentCommand{\palavraschave}{m O{} O{} O{} O{} O{}}{
  \renewcommand{\palavrachaveum}{#1}
  \renewcommand{\palavrachavedois}{#2}
  \renewcommand{\palavrachavetres}{#3}
  \renewcommand{\palavrachavequatro}{#4}
  \renewcommand{\palavrachavecinco}{#5}
  \renewcommand{\palavrachaveseis}{#6}
}

\newcommand{\palavraschaveemlinha}{
  \ifthenelse{\equal{\palavrachaveum}{}}{}{\palavrachaveum.\ }
  \ifthenelse{\equal{\palavrachavedois}{}}{}{\palavrachavedois.\ }
  \ifthenelse{\equal{\palavrachavetres}{}}{}{\palavrachavetres.\ }
  \ifthenelse{\equal{\palavrachavequatro}{}}{}{\palavrachavequatro.\ }
  \ifthenelse{\equal{\palavrachavecinco}{}}{}{\palavrachavecinco.\ }
  \ifthenelse{\equal{\palavrachaveseis}{}}{}{\palavrachaveseis.\ }
}

\newcommand{\palavraschaveemitens}{
  \ifthenelse{\equal{\palavrachaveum}{}}{}{1. \palavrachaveum\ }
  \ifthenelse{\equal{\palavrachavedois}{}}{}{2. \palavrachavedois\ }
  \ifthenelse{\equal{\palavrachavetres}{}}{}{3. \palavrachavetres\ }
  \ifthenelse{\equal{\palavrachavequatro}{}}{}{4. \palavrachavequatro\ }
  \ifthenelse{\equal{\palavrachavecinco}{}}{}{5. \palavrachavecinco\ }
  \ifthenelse{\equal{\palavrachaveseis}{}}{}{6. \palavrachaveseis\ }
}

% Keywords
\providecommand{\keywordone}{}
\providecommand{\keywordtwo}{}
\providecommand{\keywordthree}{}
\providecommand{\keywordfour}{}
\providecommand{\keywordfive}{}
\providecommand{\keywordsix}{}
\NewDocumentCommand{\keywords}{m O{} O{} O{} O{} O{}}{
  \renewcommand{\keywordone}{#1}
  \renewcommand{\keywordtwo}{#2}
  \renewcommand{\keywordthree}{#3}
  \renewcommand{\keywordfour}{#4}
  \renewcommand{\keywordfive}{#5}
  \renewcommand{\keywordsix}{#6}
}

\newcommand{\inlinekeywords}{
  \ifthenelse{\equal{\keywordone}{}}{}{\keywordone.\ }
  \ifthenelse{\equal{\keywordtwo}{}}{}{\keywordtwo.\ }
  \ifthenelse{\equal{\keywordthree}{}}{}{\keywordthree.\ }
  \ifthenelse{\equal{\keywordfour}{}}{}{\keywordfour.\ }
  \ifthenelse{\equal{\keywordfive}{}}{}{\keywordfive.\ }
  \ifthenelse{\equal{\keywordsix}{}}{}{\keywordsix.\ }
}

% Cutter e CDD
\providecommand{\imprimircutter}{X999x}
\newcommand{\cutter}[1]{\renewcommand{\imprimircutter}{#1}}

\providecommand{\imprimircdd}{999.99}
\newcommand{\cdd}[1]{\renewcommand{\imprimircdd}{#1}}

% Assinaturas de orientadores examinadores
\RenewDocumentCommand{\orientador}{O{Orientador} O{} m O{} m}{
  \ifthenelse{\equal{#1}{}}{
    \renewcommand{\imprimirorientador}{#2 #3 #4}
    \newcommand{\imprimirorientadorsemtitulo}{#3 #4}
    \newcommand{\assinaturaorientador}{\textbf{#2 #3 #4}\\ #5 \\ \vspace*{\fill}}
  }{
    \renewcommand{\imprimirorientador}{#1: #2 #3 #4}
    \newcommand{\imprimirorientadorsemtitulo}{#1: #3 #4}
    \newcommand{\assinaturaorientador}{
      \textbf{#2 #3 #4}\\ #5 \\ #1\\ \vspace*{\fill}}
  }
  
  \ifthenelse{\equal{#4}{}}{
    \newcommand{\imprimirorientadorcitacao}{#3}
  }{
    \newcommand{\imprimirorientadorcitacao}{#4, #3}
  }
}

\RenewDocumentCommand{\coorientador}{O{Coorientador} O{} m O{} m}{
  \ifthenelse{\equal{#1}{}}{
    \renewcommand{\imprimircoorientador}{#2 #3 #4}
    \newcommand{\assinaturacoorientador}{
      \textbf{#2 #3 #4}\\ #5 \\ \vspace*{\fill}}
  }{
    \renewcommand{\imprimircoorientador}{#1: #2 #3 #4}
    \newcommand{\assinaturacoorientador}{
      \textbf{#2 #3 #4}\\ #5 \\ #1\\ \vspace*{\fill}}
  }
}

\providecommand{\assinaturaexaminadori}{}
\newcommand{\examinadori}[3]{\renewcommand{\assinaturaexaminadori}{\textbf{#1} \\ #2 \\ #3\\ \vspace*{\fill}}}

\providecommand{\assinaturaexaminadorii}{}
\newcommand{\examinadorii}[3]{\renewcommand{\assinaturaexaminadorii}{\textbf{#1} \\ #2 \\ #3\\ \vspace*{\fill}}}

\providecommand{\assinaturaexaminadoriii}{}
\newcommand{\examinadoriii}[3]{\renewcommand{\assinaturaexaminadoriii}{\textbf{#1} \\ #2 \\ #3\\ \vspace*{\fill}}}

% Referencias
\renewcommand{\bibname}{Referências}

% ------------------------------------------------------------------------------- %
% CAPA                                                                            %
% ------------------------------------------------------------------------------- %
\renewcommand{\imprimircapa}{

  \begin{center}
    \MakeUppercase\imprimirinstituicao\\
    \MakeUppercase\imprimircurso
    \vspace*{3.0cm}

    \textbf{\MakeUppercase\imprimirautor}
    \vspace*{3.5cm}

    \textbf{\MakeUppercase\imprimirtitulo}
    \vfill
  
    \imprimirlocal\\
    \imprimirdata
  \end{center}


  \cleardoublepage
}

% ------------------------------------------------------------------------------- %
% FOLHA DE ROSTO                                                                  %
% ------------------------------------------------------------------------------- %
\renewcommand{\imprimirfolhaderosto}{  
  \begin{center}
    \vspace*{2.0cm}

    \MakeUppercase\imprimirautor
    \vspace*{2.5cm}

    \textbf{\MakeUppercase\imprimirtitulo}
    \vspace*{\fill}
  \end{center}

  % Se o preâmbulo não estiver vazio, crie uma minipage alinhada à direita
  % para a sua impressão.

  \begin{flushright}
    \begin{minipage}{8cm}
      \scriptsize
      \SingleSpacing
      \ifthenelse{\equal{\imprimirpreambulo}{}}{}{\imprimirpreambulo\\}
      
      \imprimirorientador\\

      % Se existir coorientador imprima seu nome.
      \ifthenelse{\equal{\imprimircoorientador}{}}{}{\imprimircoorientador}
    \end{minipage}
  \end{flushright}

  \vfill
  
  \begin{center}
    \imprimirlocal\\
    \imprimirdata
  \end{center}

  \newpage
}

% ------------------------------------------------------------------------------- %
% FICHA CATALOGRÁFICA                                                             %
% ------------------------------------------------------------------------------- %
\providecommand{\imprimirfichacatalografica}{

  \vspace*{\fill}

  \fbox{
    \begin{minipage}[c][]{15 cm}

      \vspace{12pt}
      \small{\imprimircutter~\imprimirautor}\\

      \centering\begin{minipage}[c][]{13 cm}

        \setlength{\parindent}{0.5cm}
        \small
        
        \imprimirtitulo  / \imprimirautor. --
        \imprimirdata.\\

        \pageref{LastPage} f: il; 30 cm.\\
        
        \imprimirorientadorsemtitulo\\

        \imprimirtipotrabalho~--~\imprimirinstituicao,
        \imprimircurso, \imprimirdata.\\

        \hspace{0.5cm}
        \palavraschaveemitens
        I. \imprimirorientadorcitacao\ 
        II. \imprimirinstituicao\ 
        III. \imprimirtitulo

        \flushright{CDD \imprimircdd}
        \vspace{12pt}
      \end{minipage}
    \end{minipage}
  }

  \cleardoublepage
}

% ------------------------------------------------------------------------------- %
% FOLHA DE APROVAÇÃO                                                              %
% ------------------------------------------------------------------------------- %
\providecommand{\imprimiraprovacao}{
  \begin{folhadeaprovacao}
    
    \begin{center}
      \textbf{\MakeUppercase\imprimirautor}
      \vspace*{\fill}

      \linespread{1.6}
      \textbf{\MakeUppercase\imprimirtitulo}
      \vspace*{\fill}
    \end{center}

    \begin{flushright}
      \begin{minipage}{8cm}
        \scriptsize
        \SingleSpacing
        \ifthenelse{\equal{\imprimirpreambulo}{}}{}{\imprimirpreambulo\\}
      \end{minipage}
      \vspace*{\fill}
    \end{flushright}

    
    \begin{center}
      \imprimirapprovaldate
      \vspace*{\fill}
    
      \textbf{\MakeUppercase{comissão examinadora}}
      \vspace*{\fill}
    
      \assinaturaorientador
      \assinaturacoorientador
      \assinaturaexaminadori
      \assinaturaexaminadorii
      \assinaturaexaminadoriii
    \end{center}

  \end{folhadeaprovacao}
}

% ------------------------------------------------------------------------------- %
% DEDICATÓRIA                                                                     %
% ------------------------------------------------------------------------------- %
\providecommand{\imprimirdedicatoria}{}
\newcommand{\editardedicatoria}[1]{
  \renewcommand{\imprimirdedicatoria}{
    \begin{dedicatoria}
      \vspace*{\fill}
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
        #1
      \end{minipage}
      \vspace*{2.0cm}
    \end{dedicatoria}
  }
}

% ------------------------------------------------------------------------------- %
% AGRADECIMENTOS                                                                  %
% ------------------------------------------------------------------------------- %
\providecommand{\imprimiragradecimentos}{}
\newcommand{\editaragradecimentos}[1]{
  \renewcommand{\imprimiragradecimentos}{  
    \begin{agradecimentos}
      #1
    \end{agradecimentos}
  }
}

% ------------------------------------------------------------------------------- %
% EPÍGRAFE                                                                        %
% ------------------------------------------------------------------------------- %
\providecommand{\imprimirepigrafe}{}
\newcommand{\editarepigrafe}[1]{
  \renewcommand{\imprimirepigrafe}{
    \begin{epigrafe}
      \vspace*{\fill}
      \begin{center}
        #1
      \end{center}
      \vspace*{3cm}
    \end{epigrafe}
  }
}

% ------------------------------------------------------------------------------- %
% LISTA DE FIGURAS                                                                %
% ------------------------------------------------------------------------------- %
\renewcommand{\listfigurename}{Lista de figuras}
\newcommand{\imprimirlistafiguras}{
  \pdfbookmark[0]{\listfigurename}{lof}
  \listoffigures*
  \cleardoublepage
}

% ------------------------------------------------------------------------------- %
% LISTA DE TABELAS                                                                %
% ------------------------------------------------------------------------------- %
\newcommand{\imprimirlistatabelas}{
  \pdfbookmark[0]{\listtablename}{lot}
  \listoftables*
  \cleardoublepage
}

% ------------------------------------------------------------------------------- %  
% LISTA DE QUADROS                                                                %
% ------------------------------------------------------------------------------- %
\newcommand{\quadroname}{Quadro}
\newcommand{\listofquadrosname}{Lista de Quadros}

\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space} 
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}
\newcommand{\imprimirlistaquadros}{
  \pdfbookmark[0]{\listofquadrosname}{loq}
  \listofquadros*
  \cleardoublepage
}

% ------------------------------------------------------------------------------- %
% LISTA DE ABREVIATUAS E SIGLAS                                                   %
% ------------------------------------------------------------------------------- %
\providecommand{\imprimirlistasiglas}{}
\renewcommand{\listadesiglasname}{Lista de Siglas}
\newcommand{\editarlistasiglas}[1]{
  \renewcommand{\imprimirlistasiglas}{#1}
}

% ------------------------------------------------------------------------------- %
% LISTA DE SÍMBOLOS                                                               %
% ------------------------------------------------------------------------------- %
\providecommand{\imprimirlistasimbolos}{}
\newcommand{\editarlistasimbolos}[1]{
  \renewcommand{\imprimirlistasimbolos}{#1}
}

% ------------------------------------------------------------------------------- %
% SUMÁRIO                                                                         %
% ------------------------------------------------------------------------------- %
\newcommand{\imprimirsumario}{
  \pdfbookmark[0]{\contentsname}{toc}
  \tableofcontents*
  \cleardoublepage
}

% ------------------------------------------------------------------------------- %
% CONFIGURAÇÕES DO ASPECTO FINAL DO PDF                                           %
% ------------------------------------------------------------------------------- %
\makeatletter
\hypersetup{
  % pagebackref=true,
  pdftitle={\@title}, 
  pdfauthor={\@author},
  pdfsubject={\imprimirpreambulo},
  pdfcreator={LaTeX with iftex},
  pdfkeywords={}, 
  colorlinks=true,    % false: boxed links; true: colored links
  linkcolor=black,    % color of internal links
  citecolor=black,    % color of links to bibliography
  filecolor=magenta,  % color of file links
  urlcolor=black,
  bookmarksdepth=4
}
\makeatother

% ------------------------------------------------------------------------------- %
% CONFIGURAÇÃO DO LISTINGS                                                        %
% ------------------------------------------------------------------------------- %
\definecolor{backcolour}{RGB}{255,255,255}
\definecolor{commentcolour}{RGB}{0,128,0}
\definecolor{keywordcolour}{RGB}{249,38,114}
\definecolor{stringcolour}{RGB}{255,102,0}

\renewcommand\lstlistingname{Algoritimo} 
\lstdefinestyle{mystyle}{
  backgroundcolor=\color{backcolour},   
  commentstyle=\color{commentcolour},
  keywordstyle=\color{keywordcolour}\bfseries,
  numberstyle=\tiny\color{black},
  stringstyle=\color{stringcolour},
  emphstyle=\color{red},
  basicstyle=\footnotesize,
  breakatwhitespace=false,         
  breaklines=true,                 
  captionpos=t,                    
  keepspaces=true,                 
  numbers=left,                    
  numbersep=5pt,                  
  showspaces=false,                
  showstringspaces=false,
  showtabs=false,                  
  tabsize=4,
  linewidth=79em
}
 
\lstset{style=mystyle}

% ------------------------------------------------------------------------------- %
% ESPAÇAMENTOS ENTRE LINHAS E PARAGRÁFOS                                          %
% ------------------------------------------------------------------------------- %
\setlength{\parindent}{0cm}
\setlength{\parskip}{15pt}

\renewcommand{\baselinestretch}{1.5} % Espaço entre linhas do texto
\renewcommand{\arraystretch}{1.5} 	 % Espaço entre linhas da tabela

% Sumário
\setlength{\cftbeforechapterskip}{0pt plus 0pt}
\setlength{\cftbeforepartskip}{0pt}

% Chapter
\setlength{\afterchapskip}{0pt}
% \setlength{\beforechapskip}{15pt}

% Section
\setlength{\aftersecskip}{15pt}
% \setlength{\beforesecskip}{0pt}

% Subsection
\setlength{\aftersubsecskip}{15pt}
% \setlength{\beforesubsecskip}{15pt}

% Subsubsection
\setlength{\aftersubsubsecskip}{15pt}
% \setlength{\beforesubsubsecskip}{15pt}

% Adiciona hspace depois de titulos
\addtocontents{toc}{\vspace{15pt}}
\addtocontents{lof}{\vspace{15pt}}
\addtocontents{lot}{\vspace{15pt}}
\addtocontents{loq}{\vspace{15pt}}

% ------------------------------------------------------------------------------- %
% NUMERAÇÂO DAS PÁGINAS                                                           %
% ------------------------------------------------------------------------------- %
% Cria um novo estilo de cabeçalhos e rodapés para as capas.
\makepagestyle{ifes_capas}

% Cabeçalhos de Páginas Par e Ímpar (Esquerda, Centro e Direita)
\makeevenhead{ifes_capas}{}{}{}
\makeoddhead{ifes_capas}{}{}{}

% Cria a macro capa para numeração romana das capas.
\newcommand{\capas}{
  \pagenumbering{roman}
  \aliaspagestyle{chapter}{ifes_capas}
  \pagestyle{ifes_capas}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{ifes_capas}
}

% Cria um novo estilo de cabeçalhos e rodapés para os elementos pré-textuais
\makepagestyle{ifes_pretextual}

% Cabeçalhos de Páginas Par e Ímpar (Esquerda, Centro e Direita)
\makeevenhead{ifes_pretextual}{}{}{}
\makeoddhead{ifes_pretextual}{}{}{}

% Customiza a macro pretextual
\renewcommand{\pretextual}{
  \pagenumbering{arabic}
  \aliaspagestyle{chapter}{ifes_pretextual}
  \pagestyle{ifes_pretextual}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{ifes_pretextual}
  \setcounter{page}{2}
}

% Cria um novo estilo de cabeçalhos e rodapés para os elementos textuais.
\makepagestyle{ifes_textual}

% Cabeçalhos de Páginas Par e Ímpar (Esquerda, Centro e Direita)
\makeevenhead{ifes_textual}{\ABNTEXfontereduzida\thepage}{}{}
\makeoddhead{ifes_textual}{}{}{\ABNTEXfontereduzida\thepage}

% Ajusta a marca textual para refletir os ajustes.
\let\oldtextual\textual
\renewcommand{\textual}{
  \oldtextual
  \aliaspagestyle{chapter}{ifes_textual}
  \pagestyle{ifes_textual}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{ifes_textual}
}

% ------------------------------------------------------------------------------- %
% COMPILA O ÍNDICE                                                                %
% ------------------------------------------------------------------------------- %
\makeindex