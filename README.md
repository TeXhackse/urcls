# urcls
LaTeX classes & packages to use the corporate Design of the University of Regensburg using LaTeX.

 Copyright (C) Marei Peischl <tex@mareipeischl.de>, 2014--2019

 urcls 2019/01/31 v2.1

***************************************************************************

 This material is subject to the LaTeX Project Public License version 1.3c
 or later. See http://www.latex-project.org/lppl.txt for details.

***************************************************************************

Summary
-------
The urcls-bundle provides beamer and scrlttr2 derived classes to use the Corporate Design of the University of Regensburg.
It also contains several packages to provide the specific colorbars and also a general option processing mechanism for all Packages.

Version 2.0 also includes the packages URrules and URpagestyles, which provide access to the colorbars outside the URbeamer and URletter classes. URpagestyles also creates Titlepagelayouts as well as a colored Version of rules to be used inside a Document, e.g. as separation rules for the headline.

To Compile the DEMO-files one might need the [Logos](http://www.physik.uni-regensburg.de/studium/edverg/latex/files/local/urlogo.zip) (Only available from the network of the University of Regensburg).

[Link to the github repository](https://github.com/TeXhackse/urcls)

Files
-----
This work consists of the files 

**urcls package and class files**
+ URbeamer.cls v2.0(2017/04/05)
+ beamerthemeUR.sty v2.0(2017/04/05)
+ beamercolorthemeUR.sty v2.0(2017/04/05)
+ beamerfontthemeUR.sty v2.0(2017/04/05)
+ beamerouterthemeUR.sty v2.0(2017/04/05)
+ URletter.cls v2.1(2018/10/19)
+ URspecialopts v2.1 (2019/01/22)
+ URoptions v2.0 (2017/04/05)


**urcls example files**
+ URpagestyles-DEMO.tex v2.0(2017/04/05)
+ URbeamer-DEMO.tex v2.0(2017/04/05)
+ URletter-DEMO.tex v2.0(2017/04/05)
+ URadressdaten-DEMO.lco v2.0(2017/04/05)

Versions
--------
**v2.0** (2017/04/06)
+ added a generalized mechanism for the colorbars using URrules
+ beamertheme UR is now useable without the URbeamer.cls
+ added a specific option-processing-mechanism by introducing the URspecialopts package
+ adding the URpagestyles package
+ bugfix

**v1.1** (2015/06/15)
+ bugfix and added LuaTeX-Support

**v1.0** (2015/01/29)
+ first CTAN version of the urcls-bundle
