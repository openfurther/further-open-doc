@echo off
REM ========================
REM Compile HTML version of OpenFurther Documentation on Windows
REM Peter Mo 20131108
REM ========================

REM ========================
REM Configure Variables
REM ========================

REM asciiDoc Installation Path
set asciiDocPath="C:\Apps\asciidoc\asciidoc.py"

REM python 2.x (3.x does not work!) Installation Path
set pythonPath="C:\Python27\python.exe"

REM Document Source Path
set sourceDoc="C:/Apps/further-open-doc/reference-manual.asciidoc"

REM Run Compile to create HTML file
%pythonPath% %asciiDocPath% %sourceDoc%

REM This will create the reference-manual.html within the SAME folder:
REM i.e. C:/Apps/further-open-doc/reference-manual.html

REM End of Script