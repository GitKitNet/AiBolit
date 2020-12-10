@echo off
del AI-BOLIT-REPORT-start-php70.html
copy aibolit\ai-bolit.php site\aibolit_temp.php
copy aibolit\.adirignore site\.adirignore
copy aibolit\.aignore site\.aignore
copy aibolit\.aurlignore site\.aurlignore
copy aibolit\AIBOLIT-WHITELIST.db site\AIBOLIT-WHITELIST.db

IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
echo "###################################"
echo "........Running x64 PHP 7.0........"
echo "###################################"
aibolit\php70_64\php.exe -d short_open_tag=on site\aibolit_temp.php --progress=/progress.json
aibolit\php70_64\php.exe -d short_open_tag=on site\aibolit_temp.php --mode=1 --report=..\AI-BOLIT-REPORT-start-php70.html

GOTO END

:32BIT
echo "###################################"
echo "Running x86 PHP 7.0"
echo "###################################"
aibolit\php70_32\php.exe -d short_open_tag=on site\aibolit_temp.php --mode=1 --report=..\AI-BOLIT-REPORT-start-php70.html

GOTO END

:END

del site\AI-BOLIT-DOUBLECHECK.php
del site\aibolit_temp.php
del site\.adirignore
del site\.aignore
del site\.aurlignore
del site\AIBOLIT-WHITELIST.db

echo ---------------------------------------------------------
echo �����஢���� �����襭�. ���� � ᪠��஢���� AI-BOLIT-REPORT-start-php70.html 
pause