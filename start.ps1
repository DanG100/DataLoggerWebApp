Invoke-Expression "cmd /c start powershell -Command {& `'$((Get-Item -Path ".\" -Verbose).FullName)\mongodb\bin\mongod.exe`' -f `"$((Get-Item -Path ".\" -Verbose).FullName)\mongo.conf`" }"
cd DataLoggerWebApp
gulp serve