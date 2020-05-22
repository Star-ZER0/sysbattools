@echo off
mode con cols=101 lines=35
title E龙の批处理系统工具箱V0.2b
color F8

::获取管理员权限
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

:UAC
if '%errorlevel%' NEQ '0' (
    echo 请求管理员权限...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\edragonwintoolsgetadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\edragonwintoolsgetadmin.vbs"
    "%temp%\edragonwintoolsgetadmin.vbs"
    exit /B
:gotAdmin
    if exist "%temp%\edragonwintoolsgetadmin.vbs" ( del "%temp%\edragonwintoolsgetadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
    goto start

:start
cls
echo E龙の批处理系统工具箱V0.2b
echo 本程序正在内测，各个功能尚不完善，如有问题请提交至edragon.sxl.cn或e_dragon007@qq.com
echo github地址（尚未完成）：https://github.com/EDragon007/sysbattools
echo 本程序遵从GPL-3.0协议发行，转载请联系作者，不得进行二次转载！
echo 集各种小程序精华而制作成的小巧bat批处理脚本awa
echo 　　　　　　　　　　　　██████　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
echo 　　　　　██　　　　██　█████　　　　　　　　　　　　　█　　　　　　　　　　　　　　　　
echo 　　　　████　　　████████　　　　　　　　　██　███　　　　　　　　　　　　　　　
echo 　　　　　　　　　　　████████　　　　　　　　████　　　　　　　　　　　　　　　　　　
echo 　　　　　　　　　　　████　　　　　　　　　　　　　　　　　　　　　　　　█　　　　　　　　　
echo 　　　　　　　　　　　███████　　　　　　　　　　　　　　　　　　　　　█　　　　　　　　　
echo 　　　　█　　　　　█████　　　　　　　　　　　　　　　　　　　　　　█　█　█　　　　　　　
echo 　　　　█　　　　██████　　　　　　　　　　　　　　　　　　　　　　█　█　█　　　　　　　
echo 　　　　██　　　████████　　　　　　　　　　　　　　　　　　　　█　█　█　　　　　　　
echo 　　　　███　███████　█　　　　　　　　　　　　　　　　　　　　█　█　█　　　　　　　
echo 　　　　███████████　　　　　　　　　　　　　　　　　　　　　　　███　　　　　　　　
echo 　　　　　█████████　　　　　　　　　　　　　　　　　　　　　　　　　█　　　　　　　　　
echo 　　　　　　████　██　　　　　　　　　　　　　　　　▂▄　　　　　　　　█　　　　　　　　　
echo █████　　　█　　█　　████████████████████████████████████
echo 　　　　　　　　██　██　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
echo ————————————————————————菜单————————————————————————
echo [1]清理系统空间			[11]开启桌面快捷方式的小箭头	
echo [2]关闭Windows Defender		[12]执行chkdsk并尝试修复磁盘	
echo [3]开启Windows Defender		[13]修复指定分区引导		
echo [4]关闭休眠(可释放部分空间)	[14]FAT32无损转NTFS		
echo [5]关闭客户体验改善计划		[15]扫描系统文件的完整性并修复	
echo [6]关闭磁盘碎片整理计划		[16]编辑hosts文件		
echo [7]设置用户账户控制(UAC)弹窗	[17]刷新DNS缓存			
echo [8]关闭用户账户控制(UAC)小盾牌	[18]定时关机(定时)		
echo [9]开启用户账户控制(UAC)小盾牌	[19]定时重启(定时)		
echo [10]关闭桌面快捷方式的小箭头	[20]定时执行指定命令		
set /p choose=请输入你的选择:
if /i "%choose%"=="1" cls&goto sysclean
if /i "%choose%"=="2" cls&goto wdoff
if /i "%choose%"=="3" cls&goto wdon
if /i "%choose%"=="4" cls&goto sleepoff
if /i "%choose%"=="5" cls&goto planoff
if /i "%choose%"=="6" cls&goto ddoff
if /i "%choose%"=="7" cls&goto uacsetting
if /i "%choose%"=="8" cls&goto uacsoff
if /i "%choose%"=="9" cls&goto uacson
if /i "%choose%"=="10" cls&goto arrowoff
if /i "%choose%"=="11" cls&goto arrowon
if /i "%choose%"=="12" cls&goto chkdsk
if /i "%choose%"=="13" cls&goto bcdboot
if /i "%choose%"=="14" cls&goto fattontfs
if /i "%choose%"=="15" cls&goto sfc
if /i "%choose%"=="16" cls&goto edithosts
if /i "%choose%"=="17" cls&goto flushdns
if /i "%choose%"=="18" cls&goto timedshutdown
if /i "%choose%"=="19" cls&goto timedreboot
if /i "%choose%"=="20" cls&goto timedtasks
exit

:sysclean
cls
echo 注意！你将要清理以下文件：
echo [临时文件(*.tmp)]
echo [临时文件(*._mp)]
echo [日志文件(*.log)]
echo [临时帮助文件(*.gid)]
echo [磁盘检查文件(*.chk)]
echo [临时备份文件(*.old)]
echo [回收站]
echo [临时备份文件(*.bak)]
echo [预读取数据文件夹]
echo [临时文件夹]
echo [Cookies]
echo [IE临时文件]
echo [临时文件文件夹]
echo [文件使用记录]
echo [WinSxS备份文件夹]
echo 本程序按拓展名和文件夹进行清理，而且不经过回收站，误删文件作者概不负责！
set /p choose=真的要继续吗？[1]继续	[2]返回：
if /i "%choose%"=="1" goto cleansysstart
if /i "%choose%"=="2" goto start
exit

:cleansysstart
cls
echo 准备清理系统垃圾...
echo ==================================
echo 正在清理[临时文件(*.tmp)](1 / 15)
del /f /s /q %systemdrive%\*.tmp
echo 正在清理[临时文件(*._mp)](2 / 15)
del /f /s /q %systemdrive%\*._mp
echo 正在清理[日志文件(*.log)](3 / 15)
del /f /s /q %systemdrive%\*.log
echo 正在清理[临时帮助文件(*.gid)](4 / 15)
del /f /s /q %systemdrive%\*.gid
echo 正在清理[磁盘检查文件(*.chk)](5 / 15)
del /f /s /q %systemdrive%\*.chk
echo 正在清理[临时备份文件(*.old)](6 / 15)
del /f /s /q %systemdrive%\*.old
echo 正在清理[回收站](7 / 15)
del /f /s /q %systemdrive%\recycled\*.*
echo 正在清理[临时备份文件(*.bak)](8 / 15)
del /f /s /q %windir%\*.bak
echo 正在清理[预读取数据文件夹](9 / 15)
del /f /s /q %windir%\prefetch\*.*
echo 正在清理[临时文件文件夹(Temp)](10 / 15)
del /f /s /q %windir%\temp\*.*
echo 正在清理[Cookies](11 / 15)
del /f /s /q %userprofile%\cookies\*.*
echo 正在清理[IE临时文件](12 / 15)
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
echo 正在清理[临时文件文件夹](13 / 15)
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
echo 正在清理[文件使用记录](14/ 15)
del /f /s /q "%userprofile%\Recent\*.*"
echo 正在清理[WinSxS备份文件夹](15/ 15)
del /f /s /q "%systemdrive%\Windows\winsxs\Backup\*.*"
echo ==================================
echo 清理系统垃圾完成！
pause
goto start

:wdoff
cls
echo 正在关闭Windows Defender……
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
echo 关闭Windows Defender成功！请重启你的电脑！
pause
goto start

:wdon
cls
echo 正在开启Windows Defender……
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 0 /t REG_DWORD /f
echo 开启Windows Defender成功！请重启你的电脑！
pause
goto start

:sleepoff
cls
echo 正在关闭Windows休眠功能……
powercfg -h off
echo 关闭Windows休眠成功！
pause
goto start

:planoff
cls
echo 正在关闭Windows客户体验改善计划……
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /d 0 /t REG_DWORD /f
echo 关闭客户体验改善计划成功！
pause
goto start

:ddoff
cls
echo 正在关闭磁盘碎片整理计划……
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
echo 关闭磁盘碎片整理计划成功！
pause
goto start

:uacsetting
cls
echo 正在设置用户账户控制(UAC)……
C:\windows\system32\useraccountcontrolsettings.exe
echo 设置用户账户控制(UAC)成功！
pause
goto start

:uacsoff
cls
echo 正在关闭用户账户控制(UAC)小盾牌……
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
echo 正在关闭Explorer……
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
echo 关闭用户账户控制(UAC)小盾牌成功！
echo 正在开启Explorer……
start explorer.exe
pause
goto start

:uacson
cls
echo 正在开启用户账户控制(UAC)小盾牌……
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /f
echo 正在关闭Explorer……
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
echo 开启用户账户控制(UAC)小盾牌成功！
echo 正在开启Explorer……
start explorer.exe
pause
goto start

:arrowoff
cls
echo 正在关闭快捷方式小箭头……
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
echo 正在关闭Explorer……
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
echo 关闭快捷方式小箭头成功！
echo 正在开启Explorer……
start explorer
pause
goto start

:arrowon
cls
echo 正在开启快捷方式小箭头……
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f
echo 正在关闭Explorer……
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
echo 开启快捷方式小箭头成功！
echo 正在开启Explorer……
start explorer
pause
goto start

:chkdsk
cls
echo 注意！执行chkdsk的时间可能会很长，请管理好您的时间！
echo 请输入你要执行磁盘检查的磁盘盘符(如：C)
set /p chkdsk=
chkdsk %chkdsk%: /f
pause
goto start

:bcdboot
cls
echo 注意！本工具使用Windows自带的bcdboot工具修复，仅支持修复Windows系统
echo 本工具自动判断选择Legacy/UEFI引导方式
echo 请输入你要执行修复引导的磁盘盘符(如：C)
set /p bcdboot=
bcdboot %bcdboot%:/Windows /v
pause
goto start

:fattontfs
cls
echo 注意！本工具使用Windows自带的convert工具转换，转换前请确保磁盘无错误！
echo 理论上为无损转换，但是不保证100%无损，作者概不负责！
echo 请输入你要执行FAT32转NTFS的磁盘盘符(如：C)
set /p fattontfs=
convert %fattontfs%: /fs:ntfs
pause
goto start

:sfc
cls
echo 本工具使用Windows自带的sfc工具完全扫描一次您当前运行系统，并尝试修复错误的系统文件
echo 注意！耗时将会特别长，请提前管理好您的时间！
echo 适合电脑被病毒侵扰后系统文件损坏导致的系统不稳定的修复
echo 是否要继续执行？[1]继续	[2]返回：
set /p sfc=
if /i "%sfc%"=="1" cls&goto sfcstart
if /i "%sfc%"=="2" cls&goto start
exit

:sfcstart
echo 正在执行系统扫描和修复……
sfc /scannow
echo 扫描并修复完成！
pause
goto start

:edithosts
cls
echo 正在使用记事本打开hosts文件……
notepad "%systemroot%/system32/drivers/etc/hosts"
echo hosts文件已编辑！
pause
goto start

:flushdns
cls
echo 正在刷新DNS缓存……
ipconfig /flushdns
echo DNS缓存刷新成功！
pause
goto start

:timedshutdown
cls
echo 请输入关机的时间：(24小时制，如11:40，冒号必须为英文冒号！)
echo 当关机时间到后，将会提示用户保存文件并等待1分钟后关机
set /p shutdowntime=
at %shutdowntime% shutdown /s /t 60
echo 操作完成！
pause
goto start

:timedreboot
cls
echo 请输入重启的时间：(24小时制，如11:40，冒号必须为英文冒号！)
echo 当重启时间到后，将会提示用户保存文件并等待1分钟后重启
set /p reboottime=
at %reboottime% shutdown /r /t 60
echo 操作完成！
pause
goto start

:timedtasks
cls
echo 请输入执行命令的时间：(24小时制，如11:40，冒号必须为英文冒号！)
echo 当执行命令到后，将会运行下一步输入的命令
set /p taskstime=
echo 请输入在%taskstime%执行的命令：
set /p timedtasks=
at %taskstime% %timedtasks%
echo 已设置完成！
pause
goto start