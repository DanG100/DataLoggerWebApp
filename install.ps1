#wget https://nodejs.org/dist/v6.10.3/node-v6.10.3-win-x86.zip -OutFile node.zip
#expand-archive -path 'node.zip' -destinationpath '.'
#wget http://downloads.mongodb.org/win32/mongodb-win32-x86_64-2008plus-ssl-v3.4-latest.zip -OutFile mongo.zip
#expand-archive -path 'mongo.zip' -destinationpath '.'
#Rename-Item .\mongodb-win32-x86_64-2008plus-ssl-3.4.5-rc0-4-g4db4a7c\ .\mongodb
#Rename-Item .\node-v6.10.3-win-x86\ .\node
$latestRelease = Invoke-WebRequest https://github.com/klanmiko/DataLoggerWebApp/releases/latest -Headers @{"Accept"="application/json"}
$json = $latestRelease.Content | ConvertFrom-Json
$latestVersion = $json.tag_name
$url = "https://github.com/klanmiko/DataLoggerWebApp/archive/$latestVersion.zip"
wget $url -OutFile latest.zip
expand-archive -path 'latest.zip' -destinationpath '.'
$versionNum = $latestVersion.Substring(1)
Rename-Item ".\DataLoggerWebApp-$versionNum" .\DataLoggerWebApp
cd .\DataLoggerWebApp\
..\node\npm install
cd ..
rm mongo.zip
rm node.zip
mkdir db
cd
Write-Output "storage:" > mongo.conf
Write-Output "    dbPath: `"E:\\install test\\db`"" >> mongo.conf
