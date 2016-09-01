TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = keithleyK2410
# keithleyK2410.dbd will be created and installed
DBD += keithleyK2410.dbd

# keithleyK2410.dbd will be made up from these files:
keithleyK2410_DBD += base.dbd
# To send command_string to the system command interpreter for execution
keithleyK2410_DBD += system.dbd

ifdef ASYN
	keithleyK2410_DBD += asyn.dbd drvAsynSerialPort.dbd
	keithleyK2410_DBD += drvAsynIPPort.dbd
	keithleyK2410_LIBS += asyn
endif
ifdef STD
	keithleyK2410_DBD += stdSupport.dbd
	keithleyK2410_LIBS += std
endif
ifdef CALC
	keithleyK2410_DBD += calcSupport.dbd
	keithleyK2410_LIBS += calc
endif
ifdef BUSY
	keithleyK2410_DBD += busySupport.dbd
	keithleyK2410_LIBS += busy
endif
ifdef SSCAN
	keithleyK2410_DBD += sscanSupport.dbd
	keithleyK2410_LIBS += sscan
	ifdef SNCSEQ
		keithleyK2410_DBD += sscanProgressSupport.dbd
		keithleyK2410_LIBS += scanProgress
	endif
endif
ifdef AUTOSAVE
	keithleyK2410_DBD += asSupport.dbd
	keithleyK2410_LIBS += autosave
endif
ifdef SNCSEQ
	keithleyK2410_DBD += devSequencer.dbd
	keithleyK2410_LIBS += seqDev seq pv
endif
ifdef STREAM
	keithleyK2410_DBD += stream.dbd
	keithleyK2410_LIBS += stream 
endif
ifdef DEVIOCSTATS
	keithleyK2410_DBD += devIocStats.dbd iocAdmin.dbd
	keithleyK2410_LIBS += devIocStats
endif

# keithleyK2410_registerRecordDeviceDriver.cpp derives from keithleyK2410.dbd
keithleyK2410_SRCS += keithleyK2410_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
keithleyK2410_SRCS_DEFAULT += keithleyK2410Main.cpp
keithleyK2410_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#keithleyK2410_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
keithleyK2410_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

