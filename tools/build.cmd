@echo off

if "%QTDIR%" == "" (
  echo 'QTDIR' environment variable not defined!
  goto :eof
)

xcopy /y /r /i /e /v %~dp0qt\*.* %QTDIR%
set PATH = %PATH%;%QTDIR%\bin
pushd
cd /d %QTDIR%
configure -confirm-license -opensource -release -platform win32-msvc2005 -no-webkit -no-phonon -no-phonon-backend -no-script -no-scripttools -no-qt3support -no-multimedia -no-ltcg -nomake demos -nomake examples -nomake tools
nmake
popd
