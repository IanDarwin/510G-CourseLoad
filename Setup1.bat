REM Androd Module: Installs Part One 

REM Windows Terminal - tabbed terminal with CTRL/C-CTRL-V
winget install --id Microsoft.WindowsTerminal
REM Java JDK 11 LTS - needed for older releases 3rd-party apps
winget install --id EclipseAdoptium.Temurin.11
REM Java JDK 17 LTS - free from numerous OpenJDK download sites
winget install --id EclipseAdoptium.Temurin.17
REM IntelliJ java-only install
winget install --id JetBrains.IntelliJIDEA.Community
REM Android Studio IDE (Ch03 to end) - free from Google (it's just JetBrains IntelliJ with extra plugins)
winget install --id Google.AndroidStudio
REM Android SDK, tools, emulators - downloaded when starting up Studio first time


Flutter SDK - latest - from https://flutter.dev/
Flutter plugin for Android Studio - via Studio Settings->Plugins

REM Tools used in preparing the course load
REM git (and bash shell) included in "git bash" 
winget install --id Git.Git -e
REM Make (gnu-make) - 
winget install --id GnuWin32.Make
REM mitmproxy for Chap 7
winget install --id mitmproxy.mitmproxy
REM nmap just for ncat
winget install --id Insecure.Nmap

echo Downloading maven build tool from https://maven.apache.org/download
curl -O https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
tar xzf apache-maven-3.8.6-bin.tar.gz

echo Task that must be done by hand (for now)
echo Set All Browser Home Pages to C:/Users/student/CourseFiles510G/website/index.html

rem Now that files are downloaded, we can set the PATH
powershell SetPaths.ps1

REM Documentation
REM Android Internals book first edition, free download, Used with permission.
REM SEE http://newandroidbook.com/vault7.htm. 
curl -o Downloads/InternalsBookVol1FirstEdn.pdf http://newandroidbook.com/AIvI-M-RL1.pdf

REM Sample Code:
REM JavaSrc - course author's open-source Java demo package 
git clone https://github.com/IanDarwin/javasrc
REM AndroidCookbookExamples - course author's open-source Android demos 
git clone https://github.com/IanDarwin/Android-Cookbook-Examples

REM Course Problems and Solutions, and a few demos 
git clone https://github.com/IanDarwin/CourseFiles510G
REM Chapter 3 Expenses-server - from course author, to upload expenses for Expenses app  
git clone https://github.com/IanDarwin/expenses-server
rem Pre-fetch a bunch ("half the internet") of dependencies for Spring-boot server
mvn -f expenses-server compile

REM Grand finale: download a tranche of files in non-git format
curl https://darwinsys.com/tmp/Tilde510G.tgz | tar xzf -

