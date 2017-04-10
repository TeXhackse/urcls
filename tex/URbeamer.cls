%% 
%%  This is file `URbeamer.cls' version 2.0 (2017/04/05),
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
\ProvidesExplClass {URbeamer} {\filedate} {\fileversion} {beamer based document class for the University of Regensburg}

\RequirePackage{URoptions}

\Define@specialopt@Module

\UR@DeclareColorOptions
\UR@define@draftfinalkeys

\clist_map_inline:nn {headline,logotext,alignwithbar,framenumber,externalize,coloredboxes,depcaps,cdlayout} {\Module@DeclarePassOption {#1} {beamerouterthemeUR}}

\Module@DeclarePassOption {logo} [] {URrules}
\Module@DeclarePassOption {intern} {URrules}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}


\Module@Process@SpecialOptions

\ProcessOptions\relax

\edef\UR@beamer@saveclsopts{\@classoptionslist}
\LoadClass[xcolor=table,hyperref={bookmarks,hidelinks}]{beamer}
\edef\@classoptionslist{\UR@beamer@saveclsopts}

\mode<presentation>{
   \usetheme{UR}
}

\mode<all>

\endinput


