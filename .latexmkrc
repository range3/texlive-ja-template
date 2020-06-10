#!/usr/bin/env perl

$max_repeat                    = 5;
$pdf_mode                      = 3;
$latex                         = 'uplatex %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';
$pdflatex                      = 'pdflatex %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';
# $lualatex                      = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
# $xelatex                       = 'xelatex %O -no-pdf -synctex=1 -shell-escape -interaction=nonstopmode %S';
# $biber                         = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex                        = 'upbibtex %O %B';
$makeindex                     = 'upmendex %O -o %D %S';
$dvipdf                        = 'dvipdfmx %O -o %D %S';
$dvips                         = 'dvips %O -z -f %S | convbkmk -u > %D';
# $ps2pdf                        = 'ps2pdf %O %S %D';
# $pdf_previewer                 = 'xdg-open';