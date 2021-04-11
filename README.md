# Developing M480 with Visual Studio Community 2019 and GNU Tools ARM Embedded on Windows 10
M487D DSP Simulator Demo

# Install Toolchain
The GNU Tools ARM Embedded is encapsulated in NuEclipse, it is required to download the NuEclipse_V1.01.017_Windows from the below link:
http://www.nuvoton.com.cn/resource-download.jsp?tp_GUID=SW1120200401182901

If the above link is broken, go to https://www.nuvoton.com.cn/tool-and-software/ide-and-compiler/

# Setup Toolchain
Modify M480BSP/NuDemo/BuildCmd.bat, and make sure that both MAKE_PATH and GNU_TOOLS_ARM_EMBEDDED_PATH point to the right path.

SET MAKE_PATH=path/to/make.exe

SET GNU_TOOLS_ARM_EMBEDDED_PATH=path/to/arm-none-gcc.exe

# Using Nuvoton Simulator
![Nuvoton Simulator Animation](/NuDemo/res/anim.gif)




Open **NuDemo.sln** with **Microsoft Visual Studio Community 2019**, choose the configuration **Debug** and **x86** , then click the button **Local Windows Debugger** to lanuch simulator.

![Visual Studio 2019](/NuDemo/res/vs2019.png)



