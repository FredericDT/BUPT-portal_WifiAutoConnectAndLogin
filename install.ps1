#author FredericDT
#contact i@fdt.onl
$workpath=(Get-Item -Path ".\" -Verbose).FullName + "\"
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "AutoRunWifi" ('"'+$workpath+"OnStart.cmd"+'"') -type "String"
#writeRegInfo
'#author dachr
#contact 805960083@qq.com

@echo off
@set Path=%Path%;%SystemRoot%\system32\WindowsPowerShell\v1.0\& powershell -ExecutionPolicy Unrestricted "'+$workpath+'AutoLogin.ps1'+'"
exit'>OnStart.cmd
#onStart.cmd
'#author FredericDT
#contact i@fdt.onl

netsh wlan connect ssid=BUPT-portal name=BUPT-portal
echo 请等待5秒
sleep 5
$config=Get-Content config.txt
$un = $config[0]
$pw = $config[1]
$f = @{DDDDD=$un;upass=$pw;"0MKKey"=""}
$R=Invoke-WebRequest -Uri "http://10.3.8.211/" -Method POST -Body $f
echo 任务完成
'>AutoLogin.ps1
#AutoLogin.ps1
''>config.txt
#config.txt
echo "请修改config.txt，第一行为学号，第二行为密码"
pause
