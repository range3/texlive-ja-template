#!/usr/bin/env perl
ensure_path( 'TEXINPUTS', './ipsj_v4/UTF8' );
ensure_path( 'BSTINPUTS', './ipsj_v4/UTF8' );
@default_files=('main');


$max_repeat                    = 5;
$pdf_mode                      = 3;
$pvc_view_file_via_temporary   = 0;
$latex                         = 'platex %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';
# $latex                         = 'uplatex %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';
# $pdflatex                      = 'pdflatex %O -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %S';
# $lualatex                      = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
# $xelatex                       = 'xelatex %O -no-pdf -synctex=1 -shell-escape -interaction=nonstopmode %S';
# $biber                         = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex                        = 'upbibtex %O %B';
# $makeindex                     = 'pmendex %O -o %D %S';
$dvipdf                        = 'dvipdfmx %O -o %D %S';
# $dvips                         = 'dvips %O -z -f %S | convbkmk -u > %D';
# $ps2pdf                        = 'ps2pdf %O %S %D';
# $pdf_previewer                 = 'xdg-open';
