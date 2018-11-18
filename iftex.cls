% ------------------------------------------------------------------------------- %
%                                    LICENSE   	                                  %
% ------------------------------------------------------------------------------- %
% MIT License                                                                     %  
%                                                                                 % 
% Copyright (c) 2018 Humberto da Silva Neto                                       %       
%                                                                                 %
% https://github.com/hsneto/iftex											      %
%                                                                                 %
% Permission is hereby granted, free of charge, to any person obtaining a copy    %
% of this software and associated documentation files (the "Software"), to deal   %
% in the Software without restriction, including without limitation the rights    %
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell       %
% copies of the Software, and to permit persons to whom the Software is           %
% furnished to do so, subject to the following conditions:                        %
%                                                                                 %
% The above copyright notice and this permission notice shall be included in all  %
% copies or substantial portions of the Software.                                 %
%                                                                                 %
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR      %
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        %
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     %
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER          %
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   %
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   %
% SOFTWARE.                                                                       %
% ------------------------------------------------------------------------------- %

% Normas do IFES ==> https://www.ci.ifes.edu.br/images/stories/2017/biblioteca/caderno_normas_tcc_2017-277_rev_27-11.pdf

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iftex}[06/09/2018 v1.0.1 Modelo de TCC baseado em abnTeX2]

% --------------------------------------------------- %
% PARÂMETROS INICIAIS DO ABNTEX2 %
% --------------------------------------------------- %

% Repassa todos os parametros a classe abntex2
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}}

\ProcessOptions\relax
\LoadClass{abntex2}

% --------------------------------------------------- %
% PACKAGES %
% --------------------------------------------------- %

\usepackage{cmap}             % Mapear caracteres especiais no PDF
\usepackage[utf8]{inputenc}   % Codificacao do documento
\usepackage{lastpage}         % Para total de páginas

\usepackage{mathptmx}         % Usa a fonte times

\usepackage[T1]{fontenc}		  % Selecao de codigos de fonte
\usepackage{lastpage}			    % Usado pela Ficha catalográfica
\usepackage{indentfirst}		  % Indenta o primeiro parágrafo de cada seção
\usepackage{color}			      % Controle das cores
\usepackage{graphicx}			    % Inclusão de gráficos
\usepackage{microtype} 			  % para melhorias de justificação

\usepackage[brazilian,hyperpageref]{backref}
\usepackage[alf]{abntex2cite} % Citações padrão ABNT

\usepackage{parskip}			    % espaçamento entre os parágrafos
\usepackage{xcolor}
\usepackage{listings}
\usepackage[caption=false,font=normalsize]{subfig}

%% Flush captions to left
\hangcaption
\captionstyle[\raggedright]{}

% --------------------------------------------------- %
% CONFIGURAÇÕES DO PACOTE BACKREF %
% --------------------------------------------------- %

% Usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{
	\ifcase #1 %
		Nenhuma citação no texto.%
	\or
% 		Citado na página #2.%
	\else
		Citado #1 vezes nas páginas #2.%
	\fi}%

% --------------------------------------------------- %
% MARGENS %
% --------------------------------------------------- %

\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout

% --------------------------------------------------- %
% NOVOS COMANDOS %
% --------------------------------------------------- %

% Remover warning: Token not allowed in a PDF string (PDFDocEncoding): (hyperref) removing `\uppercase' 
\pdfstringdefDisableCommands{\let\uppercase\relax}

% Remover warning: underfull hboxes
\hbadness=10000

% Legendas
\newcommand{\source}[1][Produção do próprio autor.]{\begin{flushleft}\footnotesize Fonte: #1\end{flushleft}}

\renewcommand{\legend}[1]{\begin{flushleft}\footnotesize Fonte: #1\end{flushleft}}

% Títulos 
\renewcommand{\ABNTEXchapterfont}{\rmfamily\bfseries}

\renewcommand*{\chapnumfont}{\normalfont\large\bfseries}
\renewcommand*{\chaptitlefont}{\normalfont\large\bfseries}

\setsecheadstyle{\normalfont\large\MakeUppercase}
\renewcommand\cftsectionfont{\normalfont\normalsize\Capitalize}

\setsubsecheadstyle{\normalfont\large\bfseries}
\renewcommand\cftsubsectionfont{\normalfont\normalsize\bfseries}

\setsubsubsecheadstyle{\normalfont\large}
\renewcommand\cftsubsubsectionfont{\normalfont\normalsize}

\setsubsubsubsecheadstyle{\normalfont\itshape}
\renewcommand\cftparagraphfont{\normalfont\normalsize\itshape} 

% Curso
\providecommand{\imprimircurso}{}
\newcommand{\curso}[1]{\renewcommand{\imprimircurso}{#1}}

% Data de aprovação
\providecommand{\imprimirapprovaldate}{}
\newcommand{\approvaldate}[3]{\renewcommand{\imprimirapprovaldate}{Aprovado em #1 de #2 de #3}}

%  Assinaturas de orientadores examinadores
\renewcommand{\orientador}[2]{\renewcommand{\imprimirorientador}{#2: #1}}

\renewcommand{\coorientador}[2]{\renewcommand{\imprimircoorientador}{#2: #1}}

\providecommand{\assinaturaorientador}{}
\newcommand{\orientadori}[3]{\renewcommand{\assinaturaorientador}{\assinatura{\textbf{#1} \\ #2 \\ #3}}}

\providecommand{\assinaturacoorientador}{}
\newcommand{\orientadorii}[3]{\renewcommand{\assinaturacoorientador}{\assinatura{\textbf{#1} \\ #2 \\ #3}}}

\providecommand{\assinaturaexaminadori}{}
\newcommand{\examinadori}[3]{\renewcommand{\assinaturaexaminadori}{\assinatura{\textbf{#1} \\ #2 \\ #3}}}

\providecommand{\assinaturaexaminadorii}{}
\newcommand{\examinadorii}[3]{\renewcommand{\assinaturaexaminadorii}{\assinatura{\textbf{#1} \\ #2 \\ #3}}}

\providecommand{\assinaturaexaminadoriii}{}
\newcommand{\examinadoriii}[3]{\renewcommand{\assinaturaexaminadoriii}{\assinatura{\textbf{#1} \\ #2 \\ #3}}}

% Folha de Aprovação
\providecommand{\imprimiraprovacao}{}

% Lista de Figuras
\renewcommand{\listfigurename}{Lista de figuras}

% Lista de Quadros
\newcommand{\quadroname}{Quadro}
\newcommand{\listofquadrosname}{Lista de Quadros}

\newfloat[chapter]{quadro}{loq}{\quadroname}
\newlistof{listofquadros}{loq}{\listofquadrosname}
\newlistentry{quadro}{loq}{0}

\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space} 
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}

% Referencias
\renewcommand{\bibname}{Referências}

% --------------------------------------------------- %
% CAPA %
% --------------------------------------------------- %
\renewcommand{\imprimircapa}{
  \begin{capa}
    
    \centering  	
	{\MakeUppercase\imprimirinstituicao
    \par
    \MakeUppercase\imprimircurso}
	\vspace*{3.0cm}

    {\bfseries\MakeUppercase\imprimirautor}
    \vspace*{3.5cm}

    {\bfseries\MakeUppercase\imprimirtitulo}
    \vfill
	    
    \imprimirlocal\par\imprimirdata

\end{capa}}

% --------------------------------------------------- %
% FOLHA DE ROSTO %
% --------------------------------------------------- %

\renewcommand{\imprimirfolhaderosto}{
    \begin{folhaderosto}
    \centering  	
    \vspace*{2.0cm}

    {\bfseries\MakeUppercase\imprimirautor}
    \vspace*{3.5cm}

    {\bfseries\MakeUppercase\imprimirtitulo}
    \vspace*{3.0cm}
    
    \abntex@ifnotempty{\imprimirpreambulo}{%
      \hspace{.40\textwidth}
      \begin{minipage}{9cm}
        \footnotesize 
        \SingleSpacing
        \imprimirpreambulo
        \newline\newline
        \imprimirorientador
        \par
        \ifthenelse{\equal{\imprimircoorientador}{}}
        { 
          % Não escreve nada se não tiver coorientador
        }
        {
          \imprimircoorientador
        }
      \end{minipage}}%

    \vfill
    
    \imprimirlocal\par\imprimirdata
    \end{folhaderosto}
}

% --------------------------------------------------- %
% CONFIGURAÇÕES DO ASPECTO FINAL DO PDF %
% --------------------------------------------------- %

\makeatletter
\hypersetup{
  % pagebackref=true,
	pdftitle={\@title}, 
	pdfauthor={\@author},
  pdfsubject={\imprimirpreambulo},
	pdfcreator={LaTeX with abnTeX2},
	pdfkeywords={abnt}{latex}{abntex}{abntex2}{trabalho acadêmico}, 
	colorlinks=true,    % false: boxed links; true: colored links
  linkcolor=black,    % color of internal links
  citecolor=black,    % color of links to bibliography
  filecolor=magenta,  % color of file links
	urlcolor=black,
	bookmarksdepth=4
}
\makeatother

% --------------------------------------------------- %
% CONFIGURAÇÃO DO listings %
% --------------------------------------------------- %

\definecolor{backcolour}{RGB}{245,245,245}
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
    tabsize=2
}
 
\lstset{style=mystyle}

% --------------------------------------------------- %
% ESPAÇAMENTOS ENTRE LINHAS E PARAGRÁFOS %
% --------------------------------------------------- %

\setlength{\parindent}{0cm}
\setlength{\parskip}{15pt}

\renewcommand{\baselinestretch}{1.5} % Espaço entre linhas do texto
\renewcommand{\arraystretch}{1.5} 	 % Espaço entre linhas da tabela

% Sumário
\setlength{\cftbeforechapterskip}{0pt plus 0pt}
\setlength{\cftbeforepartskip}{0pt}

% Chapter
\setlength{\afterchapskip}{15pt}
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

% --------------------------------------------------- %
% CONFIGURAÇÕES DO SUMÁRIO %
% --------------------------------------------------- %

\renewcommand{\cftpartfont}{\bfseries\normalsize}
% 
\renewcommand{\cftchapterfont}{\bfseries\normalsize}
\renewcommand{\cftchapterpagefont}{\cftchapterfont}
% 
\renewcommand{\cftsectionfont}{\mdseries\normalsize}
\renewcommand{\cftsectionpagefont}{\cftsectionfont}
% 
\renewcommand{\cftsubsectionfont}{\bfseries\normalsize}
\renewcommand{\cftsubsectionpagefont}{\mdseries\cftsubsectionfont}
% 
\renewcommand{\cftsubsubsectionfont}{\mdseries\normalsize}
\renewcommand{\cftsubsubsectionpagefont}{\cftsubsubsectionfont}
% 
\renewcommand{\cftparagraphfont}{\itshape\mdseries\normalsize}
\renewcommand{\cftparagraphpagefont}{\cftparagraphfont}
% 
\setlength{\cftbeforechapterskip}{0em}

%% O código a seguir faz com que os títulos das sections fiquem em caixa alta no sumário
% Agradecimentos ao usuário anônimo em:
% https://tex.stackexchange.com/questions/399828/how-to-make-the-table-of-contents-section-title-upper-case-without-messing-with/399861

\makeatletter
\let\oldcontentsline\contentsline
\def\contentsline#1#2{%
\expandafter\ifx\csname l@#1\endcsname\l@section
\expandafter\@firstoftwo
\else
\expandafter\@secondoftwo
\fi
{%
\oldcontentsline{#1}{\MakeTextUppercase{#2}}%
}{%
\oldcontentsline{#1}{#2}%
}%
}
\makeatother

% --------------------------------------------------- %
% COMPILA O ÍNDICE %
% --------------------------------------------------- %
\makeindex
