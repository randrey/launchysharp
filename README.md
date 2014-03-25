Launchy#
====================
This is a fork of [Launchy# project][launchy#kshahar] updated to support .Net 4 plugins. 

For detailed information about Launchy# please check its [original repository][launchy#kshahar].

Binnaries
-------
[Available via GitHub Releases](https://github.com/randrey/launchysharp/releases/tag/v1.3)

Building
-------
The solution is configured for building using express versions of Visual Studio and produce output that is compatibale with Launchy 2.5 and 2.6b2, which are available from Launchy's [official website][launchy]. Steps descibed here may vary if you want to build for different version of Launchy (such as [this one](http://openningia.github.io/Launchy/) from @OpenNingia). 

#### 1. Prerequisits
Following needs to be installed\downloaded:
  * [Visual Studio Express 2013 for Windows Desktop](http://www.microsoft.com/en-us/download/details.aspx?id=40787)
  * [Visual C++ 2005 Express](http://go.microsoft.com/fwlink/?LinkId=51410)
  * [Windows SDK 6.1](http://www.microsoft.com/en-us/download/details.aspx?id=11310) (Only *Windows Headers And Libraries* and *Win32 Development Tools* are required)
  * Download and unzip qt-everywhere-opensource-src-4.6.0 from [Qt archive](http://download.qt-project.org/archive/qt/4.6/) *(4.6 is the version of Qt used in Launchy 2.5)*

#### 2. Setting environment variables
Go to Computer->Properties->Advanced system settings->Environment Variables and add\updates following values:

Variable|Value
----------|----------
WINSDK61  | C:\Program Files\Microsoft SDKs\Windows\v6.1
QTDIR     | C:\qt-everywhere-opensource-src-4.6.0
QMAKESPEC | %QTDIR%\mkspecs\win32-msvc2005
PATH      | %QTDIR%\bin

 <sup>*You may need to update some of the values to match your environemt*</sup>

#### 3. Building Qt
Open command prompt and run following commands:
    
```Batchfile
"%VS80COMNTOOLS%\vsvars32.bat"

set INCLUDE=%INCLUDE%;%WINSDK61%\Include
set LIB=%LIB%;%WINSDK61%\Lib
set PATH=%PATH%;%WINSDK61%\Bin

cd /d %QTDIR%

configure -opensource -debug-and-release -no-qt3support -nomake examples -nomake demos
nmake
```

Done. You should now be able to open solution in VS 2013 and build the project.

Notes
-------
- If you're using release version of Launchy and want to debug Launchy#, you will need to build it in Release mode with enabled PDB support.
- Lib folder contains patched QtCore4 library that allows Qt to load managed assemblies (credits go to @kshahar). It has to be used in place of the one that comes with Launchy.

License
-------
  - Launchy# is licensed under the terms of the GNU General Public License version 2.0 (GPLv2).
  - The Launchy# .NET plugin API is licensed under the terms of the GNU Lesser General Public License version 2.0 (LGPLv2).

  *(I would prefer to use MIT license, but I doubt it's ok to ignore original one.)*

  [launchy#kshahar]: https://github.com/kshahar/launchysharp
  [launchy]: http://launchy.net
  
