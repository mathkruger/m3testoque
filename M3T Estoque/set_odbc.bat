set ODBC-params=CONFIGSYSDSN "Microsoft Access Driver (*.mdb, *.accdb)" "DSN=Estoque;DBQ=C:\M3TEstoque\db\Estoque.accdb

%WINDIR%\System32\odbcconf.exe %ODBC-params% 
if %PROCESSOR_ARCHITECTURE%==AMD64 %WINDIR%\SysWOW64\odbcconf.exe %ODBC-params%

cls
@echo Fonte de dados configurada com sucesso!

pause