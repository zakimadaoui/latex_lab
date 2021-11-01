% Report class created by Dan Horne
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myDocClass}[2021/07/07 Report LaTeX class]
\LoadClass[]{article}
% PACKAGE DECLARATIONS
% general page layout and fonts
\usepackage[margin= 0.5in]{geometry}
\usepackage[utf8]{inputenc}
\usepackage[none]{hyphenat}
\usepackage{parskip}
\usepackage{multicol}
\usepackage{setspace}
\usepackage{times} %use Times front
% \usepackage{lmodern} % other nice font
% change default font size, visit :https://tex.stackexchange.com/questions/43719/how-do-i-change-the-default-font-size
\usepackage{fontsize}
\changefontsize[20pt]{11pt}
% standard packages
\usepackage{enumerate}
\usepackage{scrextend}
\usepackage{fancyhdr}
% math packages
\usepackage{centernot}
\usepackage{amsthm, amssymb, amsmath,verbatim}
\usepackage{mathtools}
% coding and colors
\usepackage{xifthen}
\usepackage{ifthen}
% color box
% \usepackage[most,listings]{tcolorbox}
% graphs and pictures
\usepackage{mathrsfs}
\usepackage{graphicx, subcaption}
\usepackage{float} %Allows for control of float positions
\usepackage{caption}
\usepackage{csvsimple,booktabs}
\usepackage{filecontents}

%define some colors
\usepackage{color}
\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{light_gray}{rgb}{0.95,0.95,0.95}
\definecolor{dark_gray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

%--------------------- setup code snippets --------------------
% visite: https://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings
\usepackage[T1]{fontenc}
\usepackage{beramono}% monospaced font with bold variant
\usepackage{listings}
%configure how listings appear
\lstset{ 
    keywordstyle=\color{blue},       % keyword style
    language=Octave,                 % the language of the code
    backgroundcolor=\color{light_gray},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}; should come as last argument
    basicstyle=\footnotesize ,        % the size of the fonts that are used for the code
    breakatwhitespace=false,          % sets if automatic breaks should only happen at whitespace
    breaklines=true,                 % sets automatic line breaking
    captionpos=b,                    % sets the caption-position to bottom
    commentstyle=\color{mygreen},    % comment style
    deletekeywords={...},            % if you want to delete keywords from the given language
    % escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
    extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
    firstnumber=0,                % start line enumeration with line 1000
    numberstyle=\tiny\color{dark_gray}, % the style that is used for the line-numbers
    frame=single,	                   % adds a frame around the code
    rulecolor=\color{dark_gray},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
    keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
    morekeywords={*,...},            % if you want to add more keywords to the set
    numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
    numbersep=10pt,                   % how far the line-numbers are from the code
    showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
    showstringspaces=false,          % underline spaces within strings only
    showtabs=false,                  % show tabs within strings adding particular underscores
    stepnumber=1,                    % the step between two line-numbers. If it's 1, each line will be numbered
    stringstyle=\color{mymauve},     % string literal style
    tabsize=2,	                   % sets default tabsize to 2 spaces
    title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}


%define VHDL language
% you can also add other languages defs after this one
\lstdefinelanguage{VHDL}{
  morekeywords={
    library,use,,entity,is,port,in,out,end,architecture,of,
    begin, process, case, when, select, else, if
  },
  emph={IEEE, ieee, all, signal, TYPE, std_logic, std_logic_vector, unsigned, signed 
  and, or, xor, nand, nor}
  morecomment=[l]--
}
\usepackage{xcolor}
\colorlet{keyword}{blue!100!black!80}
\colorlet{comment}{red!50!black!90}
\colorlet{emphcolor}{red!50!blue!50!green!100}
\lstdefinestyle{vhdl}{
  postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},
  breaklines   = true, 
  language     = VHDL,
  basicstyle   = \ttfamily,
  keywordstyle = \color{keyword}\bfseries,
  commentstyle = \color{comment},
  emphstyle = \color{mymauve},
  stringstyle=\color{mymauve},
}
%--------------------------------------------------------------

%tikz for state machines
\usepackage{tikz}
\usetikzlibrary{arrows,automata,calc}


%lipsum and text generation
% visit https://texblog.org/2011/02/26/generating-dummy-textblindtext-with-latex-for-testing/
% \usepackage[english]{babel}
\usepackage{blindtext}
\usepackage{lipsum}

% ARRAY COMMANDS
\usepackage{array}
\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}p{#1}}
\newcolumntype{R}[1]{>{\PreserveBackslash\raggedleft}p{#1}}
\newcolumntype{L}[1]{>{\PreserveBackslash\raggedright}p{#1}}


% HEADER
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{.5pt}

\fancyfoot[R]{\large \course \quad \thetitle \quad \textbf{[\thepage]}}
\fancypagestyle{plain}{%
\fancyhf{}
\renewcommand{\footrulewidth}{.5pt}
\fancyfoot[R]{\thetitle \quad\textbf{\thepage}
\fancyfoot[L]{\author}
} 
}


% Code blocks

% \newcommand{code}[arcgs][default]{def}