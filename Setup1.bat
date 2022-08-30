REM Androd Module: Installs Part One 

REM Make sure we start in ~
cd %USERPROFILE%

REM Windows Terminal - tabbed terminal with CTRL/C-CTRL-V
winget install --id Microsoft.WindowsTerminal
REM Java JDK 11 LTS - needed for older releases 3rd-party apps
winget install --id EclipseAdoptium.Temurin.11.JDK
REM Java JDK 17 LTS - free from numerous OpenJDK download sites
winget install --id EclipseAdoptium.Temurin.17.JDK --version 17.0.4.8
REM IntelliJ java-only install
winget install --id JetBrains.IntelliJIDEA.Community
REM Android Studio IDE (Ch03 to end) - free from Google (it's just JetBrains IntelliJ with extra plugins)
winget install --id Google.AndroidStudio
REM Android SDK, tools, emulators - downloaded when starting up Studio first time

REM Flutter SDK - latest - from https://flutter.dev/
REM IGNORE warnings about missing command-line tools
curl -o flutter.zip https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.0.5-stable.zip
unzip flutter.zip
del   flutter.zip
flutter\bin\flutter doctor

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

REM Course Problems and Solutions, and a few demos 
git clone https://github.com/IanDarwin/makehandsons
cd makehandsons
mvn -DskipTests clean package install assembly:single
mkinst-win.bat
cd .
git clone https://github.com/IanDarwin/CourseFiles510G
REM Generating exercise files from solutions
cd CourseFiles510G\sourcecode
make
cd ..\..

REM Chapter 3 Expenses-server - from course author, to upload expenses for Expenses app  
git clone https://github.com/IanDarwin/expenses-server
rem Pre-fetch a bunch ("half the internet") of dependencies for Spring-boot server
mvn -f expenses-server/pom.xml compile

REM Grand finale: download a tranche of files in non-git format
curl https://darwinsys.com/tmp/Tilde510G.tgz | tar xzf -

REM Tha-Tha-Tha-That's all folks!

REM Remember there are a few manual steps needed, see the README.
echo Set All Browser Home Pages to C:/Users/student/CourseFiles510G/website/index.html
