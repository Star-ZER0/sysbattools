@echo off
mode con cols=100 lines=35
title E龙の批处理系统工具箱V0.1b
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
echo E龙の批处理系统工具箱V0.1b
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
echo █████　　　█　　█　　███████████████████████████████████
echo 　　　　　　　　██　██　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
echo ————————————————————菜单————————————————————
echo [1]清理系统空间
echo [2]关闭Windows Defender
echo [3]关闭休眠(可释放部分空间)
echo [4]关闭客户体验改善计划
echo [5]关闭磁盘碎片整理计划
echo [6]关闭用户账户控制(UAC)
echo [7]关闭用户账户控制(UAC)小盾牌
echo [8]关闭桌面快捷方式小箭头
echo [9]开启桌面快捷方式小箭头
set /p choose=请输入你的选择:
if /i "%choose%"=="1" cls&goto sysclean
if /i "%choose%"=="2" cls&goto wdoff
if /i "%choose%"=="3" cls&goto sleepoff
if /i "%choose%"=="4" cls&goto planoff
if /i "%choose%"=="5" cls&goto ddoff
if /i "%choose%"=="6" cls&goto uacoff
if /i "%choose%"=="7" cls&goto uacsoff
if /i "%choose%"=="8" cls&goto arrowoff
if /i "%choose%"=="9" cls&goto arrowon
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
echo 本程序按拓展名和文件夹进行清理，而且不经过回收站，误删文件作者概不负责！
set /p choose=真的要继续吗？[1]继续	[2]关闭：
if /i "%choose%"=="1" goto cleansysstart
if /i "%choose%"=="2" goto start

:cleansysstart
cls
echo 准备清理系统垃圾...
echo ==================================
echo 正在清理[临时文件(*.tmp)](1 / 14)
del /f /s /q %systemdrive%\*.tmp
echo 正在清理[临时文件(*._mp)](2 / 14)
del /f /s /q %systemdrive%\*._mp
echo 正在清理[日志文件(*.log)](3 / 14)
del /f /s /q %systemdrive%\*.log
echo 正在清理[临时帮助文件(*.gid)](4 / 14)
del /f /s /q %systemdrive%\*.gid
echo 正在清理[磁盘检查文件(*.chk)](5 / 14)
del /f /s /q %systemdrive%\*.chk
echo 正在清理[临时备份文件(*.old)](6 / 14)
del /f /s /q %systemdrive%\*.old
echo 正在清理[回收站](7 / 14)
del /f /s /q %systemdrive%\recycled\*.*
echo 正在清理[临时备份文件(*.bak)](8 / 14)
del /f /s /q %windir%\*.bak
echo 正在清理[预读取数据文件夹](9 / 14)
del /f /s /q %windir%\prefetch\*.*
echo 正在清理[临时文件文件夹(Temp)](10 / 14)
del /f /s /q %windir%\temp\*.*
echo 正在清理[Cookies](11 / 14)
del /f /s /q %userprofile%\cookies\*.*
echo 正在清理[IE临时文件](12 / 14)
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
echo 正在清理[临时文件文件夹](13 / 14)
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
echo 正在清理[文件使用记录](14/ 14)
del /f /s /q "%userprofile%\Recent\*.*"
echo ==================================
echo 清理系统垃圾完成！
pause
goto start

:wdoff
cls
echo 正在关闭Windows Defender……
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
echo 关闭Windows Defender成功！
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

:uacoff
cls
echo 正在关闭用户账户控制(UAC)……
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /d 0 /t REG_DWORD /f
echo 关闭用户账户控制(UAC)成功！
pause
goto start

:uacsoff
cls
echo 正在关闭用户账户控制(UAC)小盾牌……
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
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