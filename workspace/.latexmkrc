$out_dir = 'out';     # PDF や中間ファイルを out フォルダに
#$pdf_mode = 4;        # LuaLaTeX モード
#$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode %O %S';
#$latex = 'uplatex %O -src-specials -shell-escape -interaction=nonstopmode -synctex=1 -kanji=utf8 %S';
$bibtex = 'upbibtex %O %B -kanji=utf8';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex -U %O -o %D %S';
#$pdf_mode = 4;
$pdf_previewer = 'exit';
