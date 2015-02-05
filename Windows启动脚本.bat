@echo off
@echo 本程序将在 4000 端口启动静态文件服务器，Windows 防火墙可能会提示是否允许网络访问，可以选择在局域网内共享以便使用虚拟机或局域网内其他主机访问调试。
if /i "%processor_architecture%"=="AMD64" GOTO AMD64
if /i "%PROCESSOR_ARCHITEW6432%"=="AMD64" GOTO AMD64
if /i "%processor_architecture%"=="x86" GOTO x86
GOTO ERR
:AMD64
    node64.exe server.js
:x86
    node.exe server.js
GOTO END
:ERR
@echo 不支持的CPU架构："%processor_architecture%"!
pause
:END