# PowerShell script to add a set of paths
# Must run under  set-executionpolicy RemoteSigned or powershell will say not found
# Update $pathsArray for your needs
# Consider removing the return statement in the Test-Path clause
# Author: Ian Darwin based on some pieces found on a web search - no powershell expert am I.

$Today = (Get-Date).DateTime
Write-Host "SetPaths run on" $Today

$pathsArray = 
	"C:\Program Files\Eclipse Adoptium\jdk-17.0.4.8-hotspot\bin",
	"C:\Users\student\apache-maven-3.8.6\bin",
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
