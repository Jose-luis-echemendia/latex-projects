% Jose :]
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uci_proyecto}[2025/10/09 Clase para informes técnicos UCI]

\LoadClass[a4paper,12pt]{report}

% ----------------------------------------------------------
% 📦 Paquetes básicos
% ----------------------------------------------------------
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[spanish, provide=*]{babel}
\usepackage{graphicx}
\usepackage{hyperref}
\usepackage{geometry}
\usepackage{fancyhdr}
\usepackage{tocloft}
\usepackage{titlesec}
\usepackage{setspace}
\usepackage{booktabs}
\usepackage{float}
\usepackage{caption}
\usepackage{amsmath, amssymb}
\usepackage{natbib}
\usepackage{xparse}
\usepackage{etoolbox}
\usepackage{xstring}
\usepackage[table,xcdraw]{xcolor}
\usepackage{enumitem}
\usepackage{helvet}  % Fuente Arial (Helvetica es el equivalente)
\usepackage{ragged2e} % Para justificación mejorada
\usepackage[printonlyused]{acronym}  % Para gestión de acrónimos
\usepackage{indentfirst}  % Sangría en el primer párrafo después de títulos
\usepackage{longtable}
\usepackage[edges]{forest}
\usepackage{array}

% ----------------------------------------------------------
% 📄 Márgenes y formato global
% ----------------------------------------------------------
\geometry{top=2.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm,headheight=14pt,headsep=1cm,footskip=1cm}

% Configurar Arial como fuente principal
\renewcommand{\familydefault}{\sfdefault}

% Interlineado de 1.5
\onehalfspacing

% Justificación de texto (por defecto en LaTeX, pero lo especificamos)
\justifying

% Sangría al inicio de cada párrafo (0.5 cm)
\setlength{\parindent}{1cm}

\DeclareUnicodeCharacter{2248}{\ensuremath{\approx}}

% ----------------------------------------------------------
% 📝 Comando para definir el autor (se usará en el pie de página)
% ----------------------------------------------------------
\newcommand{\authorname}[1]{\def\@authorname{#1}}
\newcommand{\@authorname}{} % valor por defecto vacío


% ----------------------------------------------------------
% 📌 Cabeceras y pies
% ----------------------------------------------------------
\pagestyle{fancy}
\fancyhf{} % limpia cabeceras y pies

% Líneas de separación
\renewcommand{\headrulewidth}{0.4pt}  % Línea debajo del header
\renewcommand{\footrulewidth}{0.4pt}  % Línea arriba del footer

% Tamaño de fuente uniforme para header y footer
\newcommand{\headerfooterfont}{\small}  % Puedes cambiar a \footnotesize o \normalsize

% Cabecera derecha: muestra el nombre del capítulo actual (en gris medio)
% Se agrega espacio vertical con \raisebox para separar del línea
\fancyhead[R]{\raisebox{0.2cm}{\headerfooterfont\textcolor{black!60}{\nouppercase{\leftmark}}}}
% Pie de página izquierdo: nombre del autor (en gris medio)
\fancyfoot[L]{\raisebox{0.2cm}{\headerfooterfont\textcolor{black!60}{\@authorname}}}
% Pie de página centrado: número de página (valor negativo lo baja más)
\fancyfoot[C]{\raisebox{-0.3cm}{\headerfooterfont\textcolor{black!60}{\thepage}}}

% Marcadores para capítulos (solo nombre del capítulo, sin "Capítulo X")
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}

% Redefinir estilo plain para que también muestre header en páginas de inicio de capítulo
\fancypagestyle{plain}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0.4pt}  % Línea debajo del header
  \renewcommand{\footrulewidth}{0.4pt}  % Línea arriba del footer
  \fancyhead[R]{\raisebox{0.2cm}{\headerfooterfont\textcolor{black!60}{\nouppercase{\leftmark}}}} % Con separación
  \fancyfoot[L]{\raisebox{0.2cm}{\headerfooterfont\textcolor{black!60}{\@authorname}}}            % Con separación
  \fancyfoot[C]{\raisebox{-0.3cm}{\headerfooterfont\textcolor{black!60}{\thepage}}}               % Bajado
}

% ----------------------------------------------------------
% 📄 Formato de títulos
% ----------------------------------------------------------
\titleformat{\chapter}{\bfseries\huge}{\thechapter.}{1em}{}
\titleformat{\section}{\bfseries\Large}{\thesection.}{1em}{}
\titleformat{\subsection}{\bfseries\large}{\thesubsection.}{1em}{}

% Espaciado de títulos
\titlespacing*{\chapter}{0pt}{0pt}{30pt}      % Capítulos
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}  % Secciones
\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}  % Subsecciones

\renewcommand{\contentsname}{Tabla de Contenidos}
\renewcommand{\listtablename}{Índice de Tablas}
\renewcommand{\listfigurename}{Índice de Figuras}

% ----------------------------------------------------------
% 🧩 Comando auxiliar para formatear nombres
% ----------------------------------------------------------
\newcommand{\formatNames}[1]{%
  \begingroup
  \IfStrEq{#1}{}{%
    \endgroup
  }{%
    \IfStrEq{#1}{---}{%
      \endgroup
    }{%
      \def\namelist{#1}%
      \def\first{}%
      \renewcommand{\do}[1]{%
        \ifx\first\empty
          \def\first{##1}%
        \else
          \\[-0.2em]\hspace*{3.4cm}##1%
        \fi
      }%
      \docsvlist{\namelist}%
      \first
      \endgroup
    }%
  }%
}

% ----------------------------------------------------------
% 📄 Comando para la portada
% ----------------------------------------------------------
\newcommand{\portadaUCI}[9]{%
  \begin{titlepage}
  \centering

  % LOGO
  \IfFileExists{img/uci_logo.png}{
    \includegraphics[width=0.35\textwidth]{img/uci_logo.png}\par\vspace{2cm}
  }{
    \vspace{2cm}
    {\Large \textbf{[Logo de la UCI no disponible]}}\par\vspace{2cm}
  }

  % TÍTULO
  {\Large \textbf{#1}}\\[2cm]
  {\huge \textbf{#2}}\\[2cm]
  \textit{Informe Técnico de la asignatura de Proyecto de Investigación y Desarrollo V}\\[2cm]

  % AUTORES Y TUTORES
  \begin{flushleft}
    \IfStrEq{#3}{}{ }{\textbf{Autor(es):} \formatNames{#3}\\[0.4cm]}
    \IfStrEq{#4}{}{ }{\textbf{Tutor(es):} \formatNames{#4}\\[0.4cm]}
    \IfStrEq{#5}{}{ }{\textbf{Co-tutor:} \formatNames{#5}\\[0.4cm]}
    \IfStrEq{#6}{}{ }{\textbf{Consultante:} \formatNames{#6}\\[0.4cm]}
    \IfStrEq{#7}{}{ }{\textbf{Asesor:} \formatNames{#7}\\[1cm]}
  \end{flushleft}

  \vfill
  {\large \textbf{La Habana, #8 de #9}}\\[0.2cm]
  \textit{\textbf{“Año 67 de la Revolución”}}
  \end{titlepage}
}

% ----------------------------------------------------------
% 📌 Comando para la tabla de contenidos y listas con cabecera
% ----------------------------------------------------------
\newcommand{\CompleteIndex}{%
  % ----- Tabla de Contenidos -----
  \cleardoublepage
  \phantomsection
  \markboth{Tabla de Contenidos}{Tabla de Contenidos} % cabecera
  \renewcommand{\contentsname}{Tabla de Contenidos} % título
  \tableofcontents

  % ----- Índice de Tablas -----
  \cleardoublepage
  \phantomsection
  \markboth{Índice de Tablas}{Índice de Tablas} % cabecera
  \renewcommand{\listtablename}{Índice de Tablas} % título
  \listoftables

  % ----- Índice de Figuras -----
  \cleardoublepage
  \phantomsection
  \markboth{Índice de Figuras}{Índice de Figuras} % cabecera
  \renewcommand{\listfigurename}{Índice de Figuras} % título
  \listoffigures
}

% ----------------------------------------------------------
% 📌 Comando para capítulos sin número (Introducción, Conclusiones)
% ----------------------------------------------------------
\newcommand{\introduction}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Introducción}%
  \markboth{Introducción}{}%
  \chapter*{Introducción}%
}

\newcommand{\conclusions}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Conclusiones}%
  \markboth{Conclusiones}{}%
  \chapter*{Conclusiones}%
}



% ----------------------------------------------------------
% 📌 Numeración de páginas
% ----------------------------------------------------------
% Preliminares en números romanos (mayúsculas)
\newcommand{\preliminaries}{%
  \pagenumbering{Roman}%
  \setcounter{page}{1}%
}

% Cuerpo principal en números arábigos a partir de la Introducción
\newcommand{\mainmatter}{%
  \cleardoublepage
  \pagenumbering{arabic}%
  \setcounter{page}{1}%
}



% ----------------------------------------------------------
% 📌 Comando para la página de Resumen y Abstract 
% ----------------------------------------------------------
\long\def\ResumenAbstract#1#2{%
  \cleardoublepage                % nueva página impar
  \thispagestyle{plain}           % sin cabecera, solo pie centrado
  \phantomsection                 % ancla para hipervínculos

  % ----- Resumen -----
  \chapter*{Resumen}              % título del resumen
  \markboth{Resumen}{}            % actualiza la cabecera
  
  \onehalfspacing                 % asegura interlineado 1.5
  \large                          % tamaño de fuente
  #1                              % contenido del resumen en español

  % ----- Abstract -----
  \chapter*{\textit{Abstract}}    % título en cursiva (igual formato que Resumen)
  \markboth{Abstract}{}            % actualiza la cabecera

  \onehalfspacing                 % asegura interlineado 1.5
  \large \textit{#2}              % contenido en cursiva

  \cleardoublepage                 % asegura que la siguiente sección comience en nueva página
}




% ----------------------------------------------------------
% 📌 Comando para la página de DATOS DE CONTACTO 
% ----------------------------------------------------------
\long\def\contactInformation#1{%
  \cleardoublepage                % nueva página impar
  \thispagestyle{plain}           % sin cabecera, solo pie centrado
  \phantomsection                 % ancla para hipervínculos

  % ----- Resumen -----
  \chapter*{Datos de Contacto}    % título
  \markboth{Datos de Contacto}{}  % actualiza la cabecera

  \onehalfspacing                 % asegura interlineado 1.5
  \large                          % tamaño de fuente
  #1                              % contenido

  \cleardoublepage                 % asegura que la siguiente sección comience en nueva página
}


% ----------------------------------------------------------
% 📌 Comando para la página de Recomendaciones
% ----------------------------------------------------------
\long\def\Recommendations#1{%
  \cleardoublepage                % empieza en nueva página impar
  \phantomsection                 % ancla para hipervínculos
  \addcontentsline{toc}{chapter}{Recomendaciones}% agrega al índice
  \markboth{Recomendaciones}{}    % cabecera

  \chapter*{Recomendaciones}      % título sin numerar
  \thispagestyle{plain}           % pie centrado, sin cabecera

  \onehalfspacing                 % asegura interlineado 1.5
  \large                          % tamaño de fuente
  #1                              % contenido de la sección

  \cleardoublepage                % deja lista la siguiente sección
}

% ----------------------------------------------------------
% 📌 Comando para la página de Anexos
% ----------------------------------------------------------
\long\def\Anexes#1{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Anexos}% agrega al índice
  \markboth{Anexos}{}             % cabecera

  \chapter*{Anexos}
  \thispagestyle{plain}

  \onehalfspacing                 % asegura interlineado 1.5
  \large                          % tamaño de fuente
  #1

  \cleardoublepage
}


% ----------------------------------------------------------
% 📌 Comando para la página de OPINIÓN DEL TUTOR 
% ----------------------------------------------------------
\long\def\TutorsOpinion#1{%
  \cleardoublepage                % nueva página impar
  \thispagestyle{plain}           % sin cabecera, solo pie centrado
  \phantomsection                 % ancla para hipervínculos

  % ----- Resumen -----
  \chapter*{Opinión de los Tutores}    % título
  \markboth{Opinión de los Tutores}{}  % actualiza la cabecera

  \onehalfspacing                 % asegura interlineado 1.5
  \large                          % tamaño de fuente
  #1                              % contenido

  \cleardoublepage                 % asegura que la siguiente sección comience en nueva página
}



% ----------------------------------------------------------
% 📌 Comando para la estructura del capítulo de development
% ----------------------------------------------------------

% --- Introducción del capítulo (no numerada pero en el índice) ---
\newcommand{\IntroCap}[2]{%
  \section*{Introducción}%
  \addcontentsline{toc}{section}{Introducción}%
  \phantomsection
  \label{intro:#1}%
  #2
  \vspace{0.5cm} % espacio antes del primer epígrafe
}

% --- Epígrafes numerados en arábigo con número de capítulo (también en el índice) ---
\newcounter{epigraph}[chapter]
\renewcommand{\theepigraph}{\thechapter.\arabic{epigraph}}

\newcommand{\epigraph}[2]{%
  \refstepcounter{epigraph}%
  % resetear contadores de niveles inferiores cuando se crea un nuevo epígrafe
  \setcounter{subepigraph}{0}%
  \setcounter{subsubepigraph}{0}%
  \section*{\theepigraph. #1}%
  \addcontentsline{toc}{section}{\protect\numberline{\theepigraph}\protect#1}%
  \phantomsection
  \label{epi:\theepigraph}%
  #2
  \vspace{0.5cm}
}

% --- Sub-epígrafes (numeración ligada al epígrafe principal) ---
\newcounter{subepigraph}[epigraph]
\renewcommand{\thesubepigraph}{\theepigraph.\arabic{subepigraph}}
\newcommand{\subepigraph}[2]{%
  \refstepcounter{subepigraph}%
  \noindent{\Large\bfseries\thesubepigraph\ #1\par}%
  \addcontentsline{toc}{subsection}{\protect\numberline{\thesubepigraph}\protect#1}%
  \phantomsection
  \label{sepi:\thesubepigraph}%
  \vspace{0.3cm}%
  \noindent #2\par\vspace{0.5cm}%
}

% --- Sub-sub-epígrafes ---
\newcounter{subsubepigraph}[subepigraph]
\renewcommand{\thesubsubepigraph}{\thesubepigraph.\arabic{subsubepigraph}}
\newcommand{\subsubepigraph}[2]{%
  \refstepcounter{subsubepigraph}%
  \noindent{\Large\bfseries\thesubsubepigraph\ #1\par}%
  \addcontentsline{toc}{subsubsection}{\protect\numberline{\thesubsubepigraph}\protect#1}%
  \phantomsection
  \label{ssepi:\thesubsubepigraph}%
  \vspace{0.3cm}%
  \noindent #2\par\vspace{0.5cm}%
}

% --- Subsección sin numeración (para usar dentro de cualquier epígrafe) ---
\newcommand{\unnumberedsubsection}[1]{%
  \vspace{0.4cm}%
  \noindent{\fontsize{12pt}{14.4pt}\selectfont\bfseries #1\par}%
  \vspace{0.2cm}%
}


% ----------------------------------------------------------
%  Comando para Referencias bibliograficas
% ----------------------------------------------------------
\long\def\BibliRefer#1{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Referencias bibliográficas}% agrega al índice
  \markboth{Referencias bibliográficas}{}             % cabecera

  \chapter*{Referencias bibliográficas}
  \thispagestyle{plain}

  \onehalfspacing                 % asegura interlineado 1.5
  \large                          % tamaño de fuente
  #1

  \cleardoublepage
}


% ----------------------------------------------------------
% 🟥 Comando para mostrar estructura de ejemplo (texto en rojo, sin numeración)
% ----------------------------------------------------------
\newenvironment{Explain}[2]{%
  \clearpage
  \pagestyle{empty}% 🔹 desactiva numeración mientras dure el entorno
  \begingroup
  \color{red}
  \noindent\textbf{#1}\\[0.3cm]%
  #2%
  \par
}{%
  \endgroup
  \clearpage
  \pagestyle{fancy}% 🔹 restaura numeración y cabecera
}



% ----------------------------------------------------------
% 📌 Comando para Referencias Bibliográficas
% ----------------------------------------------------------
\newcommand{\References}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Referencias Bibliográficas}
  \chapter*{Referencias Bibliográficas}%
  \markboth{Referencias Bibliográficas}{}%
  \renewcommand{\baselinestretch}{1.15}\selectfont % interlineado 1.15
  \fontsize{11pt}{13pt}\selectfont                 % Arial 11pt
  \bibliographystyle{apalike} % o cualquier estilo APA compatible
  \bibliography{referencias}   % tu archivo .bib
  \cleardoublepage
}


% ----------------------------------------------------------
% ✨ CUSTOM COMMANDS FOR TEXT FORMATTING
% ----------------------------------------------------------

% --- Commands to highlight important terms ---
\newcommand{\term}[1]{\textbf{\textit{#1}}}
\newcommand{\concept}[1]{\textcolor{blue}{\textbf{#1}}}

% --- Commands for inline code ---
\newcommand{\code}[1]{\texttt{#1}}
\newcommand{\var}[1]{\texttt{\textit{#1}}}

% --- Commands for notes ---
\newcommand{\note}[1]{\marginpar{\small\textcolor{red}{#1}}}
\newcommand{\importantnote}[1]{%
  \begin{quote}
    \textcolor{orange}{\textbf{Note:} #1}
  \end{quote}
}

% --- Command to highlight observations ---
\newcommand{\observation}[1]{%
  \begin{quote}
    \textcolor{teal}{\textbf{Observation:} \textit{#1}}
  \end{quote}
}

% --- Commands for links and URLs ---
% Link with visible URL: \link{https://www.youtube.com/}
\newcommand{\link}[1]{\href{#1}{\textcolor{blue}{\underline{#1}}}}

% Link with custom text: \linktext{youtube}{https://www.youtube.com/}
\newcommand{\linktext}[2]{\href{#2}{\textcolor{blue}{\underline{#1}}}}


% ----------------------------------------------------------
% 📦 CUSTOM ENVIRONMENTS
% ----------------------------------------------------------

% --- Environment for examples ---
\newenvironment{example}{%
  \par\vspace{0.3cm}
  \noindent\textcolor{blue}{\textbf{Example:}}
  \begin{quote}
}{%
  \end{quote}
  \vspace{0.3cm}
}

% --- Environment for definitions ---
\newenvironment{definition}[1]{%
  \par\vspace{0.3cm}
  \noindent\textcolor{purple}{\textbf{Definition (#1):}}
  \begin{quote}\itshape
}{%
  \end{quote}
  \vspace{0.3cm}
}

% --- Environment for code blocks ---
\newenvironment{codeblock}{%
  \par\vspace{0.3cm}
  \noindent\textbf{Code:}
  \begin{quote}\ttfamily\small
}{%
  \end{quote}
  \vspace{0.3cm}
}

% --- Environment for warnings ---
\newenvironment{warning}{%
  \par\vspace{0.3cm}
  \noindent\textcolor{red}{\textbf{⚠ Warning:}}
  \begin{quote}
}{%
  \end{quote}
  \vspace{0.3cm}
}


% ----------------------------------------------------------
% 📋 CUSTOM LISTS
% ----------------------------------------------------------

% --- Enumeration with numbers ---
\newenvironment{enumeration}{%
  \begin{enumerate}
}{%
  \end{enumerate}
}

% --- List with bullet points ---
\newenvironment{bulletlist}{%
  \begin{itemize}
}{%
  \end{itemize}
}

% --- List with letters (a, b, c...) ---
\newenvironment{alphalist}{%
  \begin{enumerate}[label=\alph*)]
}{%
  \end{enumerate}
}

% --- List with roman numerals (I, II, III...) ---
\newenvironment{romanlist}{%
  \begin{enumerate}[label=\Roman*.]
}{%
  \end{enumerate}
}


% ----------------------------------------------------------
% 🎯 COMMANDS FOR SPECIAL CONTENT HIGHLIGHTING
% ----------------------------------------------------------

% --- Highlight important text ---
\newcommand{\important}[1]{\textcolor{red}{\textbf{#1}}}

% --- Text in custom color ---
\newcommand{\colortext}[2]{\textcolor{#1}{#2}}

% --- Improved cross-references ---
\newcommand{\refsec}[1]{section~\ref{#1}}
\newcommand{\reffig}[1]{figure~\ref{#1}}
\newcommand{\reftab}[1]{table~\ref{#1}}
\newcommand{\refepi}[1]{epigraph~\ref{#1}}
