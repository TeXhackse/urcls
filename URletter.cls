%% 
%%  This is file `URletter.cls' version 2.0 (2017/04/05),
%%	it is part of
%%  urcls -- Corporate Design for the University of Regensburg
%% ----------------------------------------------------------------------------
%%
%%  Copyright (C) 2014--2017 by Marei Peischl <TeX@mareipeischl.de>
%%
%% ----------------------------------------------------------------------------
%%  License information
%% ----------------------------------------------------------------------------
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Marei Peischl.
%%
%% ============================================================================
%%
%%  Dieses Werk darf nach den Bedingungen der LaTeX Project Public Lizenz
%%  in der Version 1.3c, verteilt und/oder verändert werden. Die aktuelle
%%  Version dieser Lizenz ist http://www.latex-project.org/lppl.txt und
%%  Version 1.3c oder neuer ist Teil aller LaTeX-Distributionen ab 2005/12/01. 
%%  Dieses Werk hat den LPPL-Verwaltungs-Status "maintained". 
%%  Die Verwaltung liegt aktuell bei der Autorin, Marei Peischl.
%%
%% ----------------------------------------------------------------------------
%%  End of license information
%% ----------------------------------------------------------------------------
%%

\NeedsTeXFormat{LaTeX2e}
\def\fileversion{2.0}
\def\filedate{2017/04/05}

\RequirePackage{expl3}
\ProvidesExplClass {URletter} {\filedate} {\fileversion} {scrlttr2 based document class for the University of Regensburg}

\RequirePackage{URoptions}
\Define@specialopt@Module



\clist_map_inline:nn {intern,dean,deanery,babel} {\UR_new@BoolOpt {#1}}
\UR_set@InitialValue:nn {babel}{true}
\UR_new@BoolOpt [dean] {dekan}
\UR_new@BoolOpt [deanery] {dekanat}

\Module@DeclarePassOption{logo}{URrules}
\Module@DeclarePassOption{intern}[true]{URrules}
\Module@DeclarePassOption{draft}[true]{URrules}
\Module@DeclarePassOption{final}[true]{URrules}

\UR@create@ChoiceKey{headline}[true]{
	{true}{
		\bool_gset_true:N \g_UR@ShowHeadline_bool
	},
	{false}{
		\bool_gset_false:N \g_UR@ShowHeadline_bool
	},
	{intern}{
		\bool_gset_true:N \g_UR@ShowHeadline_bool
		\PassOptionsToPackage{intern}{URrules}
	}
}<true>


\UR_Define@Key:n {
	headline / draft .meta:n = {headline=intern},
	headline / empty .meta:n = {headline=false},
	headline / color .meta:n = {headline=true}
}


\UR@create@ChoiceKey{refline}{
	{nodate}{
		\bool_gset_true:N \g_UR@locdate_bool
		\PassOptionsToClass{refline=nodate}{scrlttr2}
	},
	{false}{
		\bool_gset_true:N \g_UR@locdate_bool
		\AtEndOfClass{\removereffields}
		\PassOptionsToClass{refline=nodate}{scrlttr2}
	},
	{unknown}{
		\PassOptionsToClass{\l_keys_key_tl\tl_if_blank:nF{#1}{=#1}}{scrlttr2}
	}
}



%lco-Option for LoadLetterOptions
\Module@DefineSpecialKey{lco}{\AtEndOfClass{\expandafter\LoadLetterOptions{#1}}}

%Optionsvariante aus Kompatibilitätsgründen:
\DeclareOption{noheadline}{\UR_set@Key:n{headline=false}}

\UR@DeclareColorOptions

\Module@DefineSpecialPassKey{URrules}
\Module@DefineSpecialPassKey{URcolors}

\PassOptionsToClass{backaddress=plain}{scrlttr2}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrlttr2}}


\Module@Process@SpecialOptions


\exp_args:Nx \ProcessKeysOptions { \@currname.\@currext }


\ProcessOptions\relax

\LoadClass{scrlttr2}

\RequirePackage{iftex}
\ifPDFTeX
\RequirePackage[utf8]{inputenc}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\providecaptionname{german,ngerman}{\chairname}{Lehrstuhl}%Lehrstuhl}%Lehrstuhl für...
\providecaptionname{german,ngerman}{\facultyname}{Fakultät}%Fakultät für...
\providecaptionname{german,ngerman}{\institutename}{Institut}%Institut für...
\providecaptionname{german,ngerman}{\roomname}{Zimmer}


\providecommand*{\chairname}{Lehrstuhl}
\providecommand*{\facultyname}{Fakultät}
\providecommand*{\institutename}{Institut}
\providecommand*{\roomname}{Zimmer}

%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Neue Komavars
\newkomavar[\phonename\usekomavar{phoneseparator}]{officephone}%Telefon Sekretariat
\newkomavar[\faxname\usekomavar{phoneseparator}]{officefax}%Fax Sekretariat
\newkomavar[\chairname\chairseparator]{chair}
\newcommand{\chairseparator}{~für~}
\newkomavar[\facultyname\facultyseparator]{faculty}
\newcommand{\facultyseparator}{~für~}
\newkomavar[\institutename\instituteseparator]{institute}
\newcommand{\instituteseparator}{~für~}
\newcommand{\roomseparator}{~}
\newkomavar[\roomname\roomseparator]{fromroom}
\newkomavar{department}%Einrichtung

\newcommand{\UR@dean}{Der~Dekan}
\newcommand{\UR@deanery}{Dekanat}
\newcommand{\UR@deanery@label}{Fakultätsverwaltung}

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Pseudolängen und Längen
%Erstellung des Farbbalkens
\bool_if:NTF \g_UR@ShowHeadline_bool {
	\RequirePackage{URrules}
	\UR@create@titlebox{UR@letter@titlebox}
	\setkomavar{firsthead}{\usebox{\UR@letter@titlebox}}
}{
	\RequirePackage{URcolors}
	\newlength{\UR@title@halfradius}
	\setlength{\UR@title@halfradius}{\dimexpr\paperwidth/42\relax}
	\setkomavar{firsthead}{} 
}

\@setplength{refhpos}{\useplength{toaddrhpos}}
\setlengthtoplength{\oddsidemargin}{toaddrhpos}
\addtolength{\oddsidemargin}{-1in}
\setlength{\textwidth}{\paperwidth}
\addtolengthplength[-2]{\textwidth}{toaddrhpos}
\@setplength{refwidth}{\textwidth}
%Positionierung des Kopfes
\@setplength{firstheadhpos}{0pt}
\@setplength{firstheadvpos}{0pt} %-1pt}
\@setplength{firstheadwidth}{\paperwidth}
%Positionierung der Absenderergänzung
\@setplength{lochpos}{\useplength{toaddrhpos}}
\@setplength{locvpos}{6\UR@title@halfradius}
\@setplength{locwidth}{\dimexpr(\paperwidth-10\UR@title@halfradius)/2-\useplength{lochpos}\relax}
\@setplength{locheight}{\dimexpr\useplength{toaddrheight}+\useplength{toaddrvpos}-\useplength{locvpos}\relax}

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Absenderergänzung

\bool_if:NTF \g_UR@deanery_bool {
\setkomavar{location}{
		\setlength{\parskip}{0pt}
		\setlength{\parindent}{0pt}
		\sffamily\raggedright\par
		\fontsize{12}{12}\selectfont\UR@deanery\\[1em]
		\fontsize{8}{8}\selectfont\textbf{\usekomavar*[\MakeUppercase]{faculty}\usekomavar[\MakeUppercase]{faculty}\\[1.5em]}
		\fontsize{8}{8}\selectfont
				\textbf{\UR@deanery@label\\[1.5pt]\usekomavar{fromname}}\\[1.5pt]
				\ifkomavarempty{fromphone}{}{\usekomavar*{fromphone}\usekomavar{fromphone}\\[1.5pt]%
				\ifkomavarempty{fromfax}{\null\hspace*{0cm}\\[1em]}{\usekomavar*{fromfax}\usekomavar{fromfax}\\[1.5pt]}}
				\ifkomavarempty{fromroom}{}{\usekomavar*{fromroom} \usekomavar{fromroom}\\[1.5pt]}
				\usekomavar{fromaddress}\\[1.5em]
				\ifkomavarempty{fromemail}{}{\usekomavar*{fromemail}\usekomavar{fromemail}\\[1.5pt]}
				\ifkomavarempty{fromurl}{}{\usekomavar*{fromemail}\usekomavar{fromurl}}
				\bool_if:NT \g_UR@locdate_bool {
				\\[1.5em]
				\vfill
		    	{\ifkomavarempty{place}{}{%
						\usekomavar{place}\usekomavar{placeseparator}}%
					\usekomavar{date}}%
				}
		
		
		}
}{
	\bool_if:NTF \g_UR@dean_bool {
		\setkomavar{location}{
		\setlength{\parskip}{0pt}
		\sffamily\raggedright\par
		\fontsize{12}{0}\selectfont\UR@dean\\[1.5em]
		\fontsize{8}{0}\selectfont\textbf{\usekomavar*[\MakeUppercase]{faculty}\usekomavar[\MakeUppercase]{faculty}\\[1.5em]}
		\fontsize{8}{0}\selectfont
				\textbf{\usekomavar{fromname}}\\[1.5pt]
				%Absendertelefonnummer
				\ifkomavarempty{fromphone}{}{\usekomavar*{fromphone}\usekomavar{fromphone}\\[1.5pt]} 
				\ifkomavarempty{fromfax}{}{\usekomavar*{fromfax}\usekomavar{fromfax}\\[1.5pt]} %Absenderfax
				\ifkomavarempty{fromroom}{}{\usekomavar*{fromroom} \usekomavar{fromroom}\\}
				%Sekretariat:
				\ifkomavarempty{officephone}{}{Sekretariat:\\[1.5pt]
				\usekomavar*{officephone}\usekomavar{officephone}\\[1.5pt]
				\ifkomavarempty{officefax}{}{\usekomavar*{officefax}\usekomavar{officefax}\\[1.5pt]}}
				\usekomavar{fromaddress}\\[1.5em]
				\ifkomavarempty{fromemail}{}{\usekomavar{fromemail}\\[1.5pt]}
				\ifkomavarempty{fromurl}{}{\usekomavar{fromurl}}
				\bool_if:NT \g_UR@locdate_bool {
				\\[1.5em]
				\vfill
		    	{\ifkomavarempty{place}{}{%
						\usekomavar{place}\usekomavar{placeseparator}}%
					\usekomavar{date}}%
				}
		}
	}{
		\setkomavar{location}{
			\setlength{\parskip}{0pt}
			\setlength{\parindent}{0pt}
			\fontsize{6}{0}\selectfont
			\sffamily\raggedright\par
		%Einrichtung 
		\ifkomavarempty{department}
				{\ifkomavarempty{faculty}
										{\vspace*{\baselineskip}}
										{\textbf{\usekomavar*[\MakeUppercase]{faculty}\usekomavar[\MakeUppercase]{faculty}\\[5pt]}}}
				{\textbf{\usekomavar*[\MakeUppercase]{department}\usekomavar[\MakeUppercase]{department}\\[5pt]}}
					\fontsize{12}{0}\selectfont
					\ifkomavarempty{chair}
									{
									\ifkomavarempty{institute}
										{\par\vspace{2.2cm}}
										{\usekomavar*{institute}\usekomavar{institute}\\[1.5em]}
									}
									{\usekomavar*{chair}\usekomavar{chair}\\[1.5em]}
		\fontsize{8}{0}\selectfont
		\ifkomavarempty{fromname}{}{\textbf{\usekomavar{fromname}}\\[1.5pt]}
		%Absendertelefonnummer
		\ifkomavarempty{fromphone}{}{\usekomavar*{fromphone}\usekomavar{fromphone}\\[1.5pt] 
		\ifkomavarempty{fromfax}{}{\usekomavar*{fromfax}\usekomavar{fromfax}\\[1.5pt]}}%Absenderfax
		\ifkomavarempty{fromroom}{}{\usekomavar*{fromroom} \usekomavar{fromroom}\\[1.5pt]}
		%Sekretariat:
		\ifkomavarempty{officephone}{}{Sekretariat:\\[1.5pt]
		\usekomavar*{officephone}\usekomavar{officephone}
		\ifkomavarempty{officefax}{\null\hspace*{0cm}\\[1em]}{\\[1.5pt]\usekomavar*{officefax}\usekomavar{officefax}\\[1.5pt]}}
		\usekomavar{fromaddress}\\[1em]
		\ifkomavarempty{fromemail}%
			{\ifkomavarempty{fromurl}{}{\usekomavar{fromurl}}}%
			{\usekomavar{fromemail}%
				\ifkomavarempty{fromurl}{}{\\[1.5pt]\usekomavar{fromurl}}}
		\bool_if:NT \g_UR@locdate_bool {
		\\[1.5em]
		\vfill
    	{\ifkomavarempty{place}{}{%
					\usekomavar{place}\usekomavar{placeseparator}}%
				\usekomavar{date}}%
		}
		}
	}
}

%Defaultwerte für komavar
\setkomavar{fromaddress}{Universitätsstraße~31\\[1.5pt]93053~Regensburg}
\setkomavar{backaddress}{Universität~Regensburg~$\cdot$~93040~Regensburg}
\setkomavar{phoneseparator}{~+49\,941\,943-}
\setkomavar{faxseparator}{~+49\,941\,943-}


\endinput
