
# Bug report: TWjiang@nuvoton.com

# Make phony targets .PHONY
# There isn't really an all file created and there really isn't clean file.
# There are actually just tags that identify a target whose rules should
# always be run.
.PHONY: all clean target


# The Preprocessor Macros
DEFS = \
	-DMACROTEST1 \
	-DMACROTEST2 \

INCLUDES = \
	-I. \
	-I"../../Library/CMSIS/Include" \
	-I"../../Library/Device/Nuvoton/M480/Include" \
	-I"../../Library/StdDriver/inc" \
	-I"../../ThirdParty/emWin/Config" \
	-I"../../ThirdParty/emWin/Include" \
	-I"../../ThirdParty/FatFs/source" \
	-I"../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/GCC/../tslib" \

GFLAGS = \
	-mcpu=cortex-m4 \
	-mthumb \
	-mfloat-abi=hard \
	-mfpu=fpv4-sp-d16 \
	-O2 \
	-fmessage-length=0 \
	-fsigned-char \
	-ffunction-sections \
	-fdata-sections \
	-g \

CFLAGS = -std=gnu11 $(INCLUDES) $(DEFS)

CPPFLAGS =
CXXFLAGS =

ASFLAG = -g
LINKFILE = "../../Library/Device/Nuvoton/M480/Source/GCC/gcc_arm.ld"
LDFLAGS = 
LIBS = -L"../../ThirdParty\emWin\Lib"


# define the C source files
# Don't include paths in filenames
# Inerting and maintaining paths everywhere is tedious and error prone. Better is to use
# VPATH within the Makefile like this:
#	VPATH=../src
SRCS_C = \
	../../Library/Device/Nuvoton/M480/Source/GCC/_syscalls.c \
	../../Library/Device/Nuvoton/M480/Source/system_M480.c \
	../../Library/StdDriver/src/clk.c \
	../../Library/StdDriver/src/eadc.c \
	../../Library/StdDriver/src/ebi.c \
	../../Library/StdDriver/src/fmc.c \
	../../Library/StdDriver/src/gpio.c \
	../../Library/StdDriver/src/retarget.c \
	../../Library/StdDriver/src/sdh.c \
	../../Library/StdDriver/src/sys.c \
	../../Library/StdDriver/src/timer.c \
	../../Library/StdDriver/src/uart.c \
	../../ThirdParty/emWin/Config/GUI_X.c \
	../../ThirdParty/emWin/Config/GUIConf.c \
	../../ThirdParty/emWin/Config/LCDConf.c \
	../../ThirdParty/FatFs/source/ff.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_AntialiasedText.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Automotive.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_BarGraph.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Bitmap.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_ColorBar.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Conf.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Cursor.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Fading.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Graph.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_IconView.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_ImageFlow.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Intro.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Listview.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_RadialMenu.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Resource.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Skinning.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Speed.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Speedometer.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Start.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_TransparentDialog.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_Treeview.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_VScreen.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_WashingMachine.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/Application/GUIDEMO_ZoomAndRotate.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/tslib/diskio.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/tslib/fbutils.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/tslib/M48XTouchPanel.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/tslib/SDGlue.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/tslib/testutils.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/tslib/ts_calibrate.c \
	../../SampleCode/NuMaker-PFM-M487D/emWin_GUIDemo/main.c


# define the assembly files
SRCS_S = ../../Library/Device/Nuvoton/M480/Source/GCC/startup_M480.S


# Explicitly name sources
# Lines like this one should be avoided.
# OS_C_SRCS := $(wildcard *.c)


# define the C object files
#
# This uses Suffix Replacement within a macro:
#	$(name:string1=string2)
#		For each word in 'name' replace 'string1' with 'string2'
# Below we are replacing the suffix .c of all words in the macros SRCS_C
# with the .o suffix
OBJS = $(SRCS_C:.c=.o) $(SRCS_S:.S=.o)

C_DEPS = $(OBJS:.o=.d)
  
# Linking
MAIN = emWin_GUIDemo.elf

$(MAIN): $(OBJS)
	@echo
	$(CC) $(GFLAGS) -T $(LINKFILE) -Xlinker --gc-sections -Wl,-Map,"emWin_GUIDemo.map" \
	 $(LIBS) -o $(MAIN) $(OBJS) -lNUemWin_CM4_GNU


# ELF to HEX
TARGET = emWin_GUIDemo.hex
target: $(MAIN)
	@echo
	@echo Invoking: GNU ARM Cross Create Flash Image
	$(OBJCOPY) -O ihex $< $(TARGET)
	@echo Finished building: $(TARGET)
	@echo
	@echo Invoking: GNU ARM Cross Print Size
	$(SIZE) --format=berkeley $<
	@echo


# This is a suffix replacement rule for building .o's from .c's
# it uses automatic variables $< the name of the prerequisite of 
# the rule (a .c file) and $@ the name of the target of the rule (a .o file)
# (see the GNU make manual section about automatic variables)
# 
# Define an implicit rule
.c.o:
	$(CC) $(GFLAGS) $(CFLAGS) -c $< -o $@


# Define an implicit rule other than above
# The following means to build the target foo.S make should build foo.c
.S.o:
	$(CC) $(GFLAGS) -x assembler-with-cpp $(INCLUDES) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"


all: target

rebuild: all
	@echo "rebuild done"
	
clean:
	@echo "clean done"
	-rm -f $(OBJS) emWin_GUIDemo.*
