# M480BSP
BSP for M480 Series MCU

Developing M480 with Visual Studio 2019 and GNU Tools ARM Embedded on Windows 10

The GNU Tools ARM Embedded is encapsulated in NuEclipse, it is required to download the NuEclipse_V1.01.017_Windows from the below link:
http://www.nuvoton.com.cn/resource-download.jsp?tp_GUID=SW1120200401182901

If the above link is broken, go to https://www.nuvoton.com.cn/tool-and-software/ide-and-compiler/

Modify M480BSP/NuDemo/BuildCmd.bat, make sure that MAKE_PATH and GNU_TOOLS_ARM_EMBEDDED_PATH point to the correct path.
SET MAKE_PATH=path/to/make.exe
SET GNU_TOOLS_ARM_EMBEDDED_PATH=path/to/arm-none-gcc.exe
