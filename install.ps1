#author FredericDT
#contact i@fdt.onl
$workpath=(Get-Item -Path ".\" -Verbose).FullName + "\"
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "AutoRunWifi" ('"'+$workpath+"OnStart.cmd"+'"') -type "String"
#writeRegInfo
Out-File -FilePath OnStart.cmd -InputObject ('@echo off && %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell -ExecutionPolicy Unrestricted "'+$workpath+'AutoLogin.ps1'+'" && exit') -Encoding ascii
#OnStart.cmd
('#author FredericDT
#contact i@fdt.onl

netsh wlan connect ssid=BUPT-portal name=BUPT-portal
echo "Please wait for 5 seconds"
sleep 5
$config=Get-Content '+$workpath+'config.txt
$un = $config[0]
$pw = $config[1]
$f = @{DDDDD=$un;upass=$pw;"0MKKey"=""}
$R=Invoke-WebRequest -Uri "http://10.3.8.211/" -Method POST -Body $f
echo "Task complete"
')>AutoLogin.ps1
#AutoLogin.ps1
''>config.txt
#config.txt
echo "Please edit the config.txt with the first line is your student_id and the next line is your password"
pause
