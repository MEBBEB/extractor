@echo off
setlocal

set "rootFolder=%~dp0"

for /d %%i in ("%rootFolder%\*") do (
  for /f "delims=" %%a in ('dir /b /s /a-d "%%i\*.pdf"') do (
    set "filename=%%~na"
    set "ext=%%~xa"
    set "targetFile=%%~dpi\%%~na%%~xa"
    set "counter=1"

    :loop
    if exist "%targetFile%" (
      set /a counter+=1
      set "targetFile=%%~dpi\%%~na(%counter%)%%~xa"
      goto loop
    )

    move "%%a" "%targetFile%"
  )
)

endlocal

