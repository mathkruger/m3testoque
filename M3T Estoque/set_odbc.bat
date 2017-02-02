set ODBC-params=CONFIGSYSDSN "Microsoft Access Driver (*.mdb, *.accdb)" "DSN=Estoque;DBQ=C:\M3T Estoque\db\Estoque.accdb
cls
if %PROCESSOR_ARCHITECTURE%==AMD64 %WINDIR%\SysWOW64\odbcconf.exe %ODBC-params% else %WINDIR%\System32\odbcconf.exe %ODBC-params% 
cls
@echo off
@echo Fonte de dados configurada com sucesso!
pause
