Write-Host "Android Module: Installation of files & software"

$Today = (Get-Date).DateTime
Write-Host "Setup started at" $Today

# Make sure we start in right place
cd ~

Write-Host Windows Terminal - tabbed terminal with CTRL/C-CTRL-V
winget install --id Microsoft.WindowsTerminal
Write-Host Java JDK 11 LTS - needed for older releases 3rd-party apps
winget install --id EclipseAdoptium.Temurin.11.JDK
Write-Host Java JDK 17 LTS - free from numerous OpenJDK download sites
winget install --id EclipseAdoptium.Temurin.17.JDK
Write-Host IntelliJ java-only install
winget install --id JetBrains.IntelliJIDEA.Community
Write-Host "Android Studio IDE (Ch03 to end) - free from Google (just JetBrains IntelliJ with extra plugins)"
winget install --id Google.AndroidStudio
Write-Host Android SDK, tools, emulators - downloaded when starting up Studio first time

function download() {
param(
	[string]$Url
)
	C:\Windows\System32\curl.exe -O $Url
}

Write-Host Flutter SDK - latest - from https://flutter.dev/
download "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.0.5-stable.zip"
unzip flutter_windows_3.0.5-stable.zip
del   flutter_windows_3.0.5-stable.zip
Write-Host IGNORE warnings about missing command-line tools
flutter\flutter doctor

Write-Host Tools used in preparing the course load
Write-Host git (and bash shell) included in "git bash" package
winget install --id Git.Git -e
Write-Host "Make (gnu-make)"
winget install --id GnuWin32.Make
Write-Host mitmproxy for Chap 7
winget install --id mitmproxy.mitmproxy
Write-Host nmap just for ncat
winget install --id Insecure.Nmap

Write-Host maven build tool from https://maven.apache.org/download
download https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
tar xzf apache-maven-3.8.6-bin.tar.gz

Write-Host Set PATHs here, because paths.
# PowerShell script to add a set of paths
# Must run under  set-executionpolicy RemoteSigned or powershell will say not found
# Update $pathsArray for your needs
# Consider removing the return statement in the Test-Path clause
# Author: Ian Darwin based on some pieces found on a web search - no powershell expert am I.

$pathsArray = 
	"C:\Program Files\Eclipse Adoptium\jdk-17.0.3.7-hotspot\bin",
	"C:\Users\student\apache-maven-3.8.5\bin",
	"C:\Users\student\bin",
	"C:\Users\student\AppData\Local\Android\Sdk\tools\bin",
	"C:\Users\student\AppData\Local\Android\Sdk\emulator",
	"C:\Users\student\AppData\Local\Android\Sdk\platform-tools",
	"C:\Users\student\flutter\bin",
	"C:\Program Files (x86)\GnuWin32\bin"

function Add-To-Path{
param(
	[string]$Dir
)

	if (!(Test-Path $Dir)) {
		Write-warning "Supplied directory $Dir was not found!"
		# return
	}
	$PATH = [Environment]::GetEnvironmentVariable("PATH", "Machine")
	if ($PATH -notlike "*$Dir*" ) {
		[Environment]::SetEnvironmentVariable("PATH", "$PATH;$Dir", "Machine")
		Write-Host "Added $Dir"
	} else {
		Write-warning "$Dir already in path"
	}
}

foreach ($path in $pathsArray)
{
	Add-To-Path $path
}

Write-Host Documentation
Write-Host Android Internals book first edition, free download, Used with permission.
Write-Host SEE http://newandroidbook.com/vault7.htm. 
download http://newandroidbook.com/AIvI-M-RL1.pdf
rename AIvI-M-RL1.pdf Documents/LevinInternalsBookVol1FirstEdn.pdf

Write-Host Sample Code:
Write-Host "JavaSrc - course author's open-source Java demo package"
git clone https://github.com/IanDarwin/javasrc
Write-Host "AndroidCookbookExamples - course author's open-source Android demos"
git clone https://github.com/IanDarwin/Android-Cookbook-Examples

Write-Host Course Problems and Solutions, and a few demos 
git clone https://github.com/IanDarwin/CourseFiles510G
Write-Host Generating exercise files from solutions
cd CourseFiles510G
make
cd ..

Write-Host "Chapter 3 Expenses-server - from course author, to upload expenses for Expenses app"
git clone https://github.com/IanDarwin/expenses-server
Write-Host Pre-fetch a bunch ("half the internet") of dependencies for Spring-boot server
mvn -f expenses-server/pom.xml compile

Write-Host Grand finale: download a tranche of files in non-git format
download https://darwinsys.com/tmp/Tilde510G.tgz
tar xzf Tilde510G.tgz
delete  Tilde510G.tgz

Write-Host "Tha-Tha-Tha-That's all folks!"

Write-Host Remember there are a few manual steps needed, see the README.
Write-Host "Set All Browser Home Pages to C:/Users/student/CourseFiles510G/website/index.html"


$Today = (Get-Date).DateTime
Write-Host "Setup finished at" $Today
