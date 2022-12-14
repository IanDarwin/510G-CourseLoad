REM Androd Module: Installs Part One 

REM Make sure we start in ~
cd %USERPROFILE%
REM Create these early to avoid accidents
mkdir bin lib

REM Windows Terminal - tabbed terminal with CTRL/C-CTRL-V
winget install --id Microsoft.WindowsTerminal
REM Java JDK 11 LTS - needed for older releases 3rd-party apps
winget install --id EclipseAdoptium.Temurin.11.JDK
REM Java JDK 17 LTS - free from numerous OpenJDK download sites
winget install --id EclipseAdoptium.Temurin.17.JDK --version 17.0.4.8
REM Check what version of Java students will get - should be 17
java -version
REM Make sure we get a modern Java for use here
PATH="C:\Program Files\Eclipse Adoptium\jdk-17.0.4.8-hotspot\bin";%PATH%
java -version

REM IntelliJ java-only install
winget install --id JetBrains.IntelliJIDEA.Community
REM Android Studio IDE (Ch03 to end) - free from Google (it's just JetBrains IntelliJ with extra plugins)
winget install --id Google.AndroidStudio
REM Android SDK, tools, emulators - downloaded when starting up Studio first time

REM Flutter SDK - latest - from https://flutter.dev/
curl -o flutter.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.0.5-stable.zip
"C:\Program Files\Git\usr\bin\unzip.exe" flutter.zip > nul:
del   flutter.zip

REM Tools used in preparing the course load
REM Make (gnu-make) - 
winget install --id GnuWin32.Make
REM mitmproxy for Chap 7
winget install --id mitmproxy.mitmproxy
REM nmap just for ncat
winget install --id Insecure.Nmap

echo Downloading maven build tool from https://maven.apache.org/download
curl https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz | tar xzf -

REM Documentation
REM Android Internals book first edition, free download, Used with permission.
REM SEE http://newandroidbook.com/vault7.htm. 
curl -o Documents/LevinInternalsBookVol1FirstEdn.pdf http://newandroidbook.com/AIvI-M-RL1.pdf

REM Sample Code:
REM JavaSrc - course author's open-source Java demo package 
git clone https://github.com/IanDarwin/javasrc
REM AndroidCookbookExamples - course author's open-source Android demos 
git clone https://github.com/IanDarwin/Android-Cookbook-Examples
REM AndroidTemplate
git clone https://github.com/IanDarwin/AndroidTemplate

REM Course Problems and Solutions, and a few demos 
git clone https://github.com/IanDarwin/makehandsons
cd makehandsons
CALL ..\apache-maven-3.8.6\bin\mvn.cmd -ntp -DskipTests clean package install assembly:single
copy target\makehandsons-1.0-SNAPSHOT-jar-with-dependencies.jar %USERPROFILE%\lib\makehandsons.jar
copy scripts\* %USERPROFILE%\bin
cd ..
git clone https://github.com/IanDarwin/CourseFiles510G
REM Generating exercise files from solutions
cd CourseFiles510G\sourcecode
make
cd ..\..

REM Chapter 3 Expenses-server - from course author, to upload expenses for Expenses app  
git clone https://github.com/IanDarwin/expenses-server
rem Pre-fetch a bunch ("half the internet") of dependencies for Spring-boot server
CALL apache-maven-3.8.6\bin\mvn.cmd -ntp -f expenses-server/pom.xml compile

REM Grand finale: download a tranche of files in non-git format
curl https://darwinsys.com/tmp/Tilde510G.tgz | tar xzf -

REM Java Version - default should be 17, not 11
java --version

@echo Tha-Tha-Tha-That's all folks!

@echo Remember there is one manual step needed:
@echo Set All Browser Home Pages to 
@echo	file:///C:/Users/%USERNAME%/CourseFiles510G/website/index.html
