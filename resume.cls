% resume.cls
% \documentstyle{resume}
\ProvidesClass{resume}[2021/12/01 v0.1 Resume class]
\LoadClass[11pt,a4paper]{article}
\nofiles                            % .aux files are not needed for resumes
\pagestyle{empty}                   % resumes do not need page numbers
\usepackage[parfill]{parskip}       % Do not indent paragraphs
\usepackage{array}                  % required for boldface tabular columns
\usepackage{ifthen}
\usepackage[margin=1cm]{geometry}
\usepackage[hidelinks]{hyperref}
\usepackage{calc}
%\usepackage[ngerman]{babel} 		% use the correspondig language for correct dates etc.
\usepackage{graphicx}				% images
\usepackage{tikz,stackengine}		% images
\usepackage[export]{adjustbox}		% image borders
\usetikzlibrary{tikzmark,calc}
\usepackage{xcolor}					% custom colors
\usepackage{fontawesome}			% custom icons
% Font
\renewcommand*\familydefault{\sfdefault}	% Use sans serif font
\definecolor{primary}{HTML}{002147}			% Oxford Blue
\definecolor{secondary}{HTML}{505b67}		% Slate Gray but darker shade -> https://mdigi.tools/color-shades/
\definecolor{accent}{rgb}{0.06, 0.3, 0.57}	% Yale Blue
\color{primary}\global\let\default@color\current@color	% use color
% Spacing
\def \none{0em}
\def \spaceH{1.5em}
\def \spaceV{0.5em}
\def \skipV{\smallskip}
\def \skipH{\hspace{\spaceH}}
% Headers
\def \addressstyle{\textit}
\def \employerstyle{\textbf}
\def \header#1{\color{accent}{\MakeUppercase{\textbf{#1}}}}
\def \header#1{\noindent \colorbox{accent}{\color{white}{\bf\MakeUppercase{#1}}}}
\def \namesize{\huge}
\def \sectionheadersize{\large}
\def \printName {{\namesize{\header{\@name}}}}
\def \printSectionHeader#1{{\sectionheadersize{\header{{#1}}}}}
\def \printHeader {\@info\\{\addressstyle{\@address}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def \name#1{\def\@name{#1}}
\def \info#1{\def\@info{#1}}
\def \address#1{\def\@address{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\ori@document=\document
\renewcommand{\document}{
  \ori@document                     % Begin document
  \printName                        % Print the name specified with \name
  \vskip \none						% Begin new line
  \printHeader						% Print info and address
  \skipV
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{cvSection}[1]{
  \printSectionHeader{#1}
  \begin{list}{}{
    \setlength{\leftmargin}{\spaceH}
  }
  \item[]
}{
  \end{list}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{cvSubsection}[4]{
  {\employerstyle{#1}}	\hfill		{#2}% Stop a space
  \ifthenelse{\equal{#3}{}}{}{
  \\
  {\addressstyle{#3}}	\hfill		{\addressstyle{#4}}% Stop a space
  }\skipV\color{secondary}
  \begin{list}{$\cdot$}{\leftmargin=\none}
  \itemsep -\spaceV \vspace{-\spaceV}
}{
  \end{list}
  \vspace{\spaceV}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Insert your data below %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\name{Your Name Here}
\info{
	\href{mailto:your@email.com}{\faEnvelopeSquare{} your@email.com}\skipH{}
	\href{tel:+123456789}{\faPhoneSquare{} +1 234 567 89}\skipH{}
	\href{https://www.linkedin.com/in/yournamehere}{\faLinkedinSquare{} yournamehere}
}
\address{123 Fake Street, Lorem Ipsum, LI 12345}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Insert your data above %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%