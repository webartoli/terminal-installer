<#
==================================================================================================================
Name:           
Description:    
Version:        1.0
Date :          26/2/2023
Website:        https://bonben365.com
Script by:      https://github.com/bonben365
For detailed script execution: https://bonben365.com/
=================================================================================================================
#>
#Install and update Desktop framework packages
$location = "~/Downloads"
Set-Location $location
$uri = 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'
Invoke-WebRequest -Uri $uri -OutFile 'Microsoft.VCLibs.x64.14.00.Desktop.appx'
Add-AppxPackage -Path 'Microsoft.VCLibs.x64.14.00.Desktop.appx'

#Download the package to the Downloads folder of current logged on user
$url = 'https://github.com/microsoft/terminal/releases/latest'
$request = [System.Net.WebRequest]::Create($url)
$response = $request.GetResponse()
$tagUrl = $response.ResponseUri.OriginalString
$version = $tagUrl.split('/')[-1].Trim('v')
$fileName = "Microsoft.WindowsTerminal_Win10_$($version)_8wekyb3d8bbwe.msixbundle"
$downloadUrl = $tagUrl.Replace('tag', 'download') + '/' + $fileName
Invoke-WebRequest -Uri $downloadUrl -OutFile "$($location)/$($fileName)" 

#Install Windows Terminal
$path = Get-ChildItem -Name "*Microsoft.WindowsTerminal*"
Add-AppxPackage -Path $path
