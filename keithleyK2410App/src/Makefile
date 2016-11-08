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
$(PROD_IOC)_DBD += base.dbd
# To send command_string to the system command interpreter for execution
$(PROD_IOC)_DBD += system.dbd

# Include dbd files from all support applications:
ifdef AUTOSAVE
	$(PROD_IOC)_DBD += asSupport.dbd
	$(PROD_IOC)_LIBS += autosave
endif
ifdef ASYN
	$(PROD_IOC)_DBD += asyn.dbd drvAsynSerialPort.dbd
	$(PROD_IOC)_DBD += drvAsynIPPort.dbd
	$(PROD_IOC)_LIBS += asyn
endif
ifdef STD
	$(PROD_IOC)_DBD += stdSupport.dbd
	$(PROD_IOC)_LIBS += std
endif
ifdef CALC
	$(PROD_IOC)_DBD += calcSupport.dbd
	$(PROD_IOC)_LIBS += calc
endif
ifdef BUSY
	$(PROD_IOC)_DBD += busySupport.dbd
	$(PROD_IOC)_LIBS += busy
endif
ifdef SSCAN
	$(PROD_IOC)_DBD += sscanSupport.dbd
	$(PROD_IOC)_LIBS += sscan
	ifdef SNCSEQ
		$(PROD_IOC)_DBD += sscanProgressSupport.dbd
		$(PROD_IOC)_LIBS += scanProgress
	endif
endif
ifdef SNCSEQ
	# seq-2-1 and earlier has devSequencer
	ifeq (seq-2-1, $(findstring seq-2-1, $(SNCSEQ)))
		$(PROD_IOC)_DBD += devSequencer.dbd
		$(PROD_IOC)_LIBS += seqDev seq pv
	else ifeq (seq-2.1, $(findstring seq-2.1, $(SNCSEQ)))
		$(PROD_IOC)_DBD += devSequencer.dbd
		$(PROD_IOC)_LIBS += seqDev seq pv
	# seq-2-2
	else 
		$(PROD_IOC)_LIBS += seq pv
	endif
endif
ifdef STREAM
	$(PROD_IOC)_DBD += stream.dbd
	$(PROD_IOC)_LIBS += stream 
endif
ifdef DEVIOCSTATS
	$(PROD_IOC)_DBD += devIocStats.dbd iocAdmin.dbd
	$(PROD_IOC)_LIBS += devIocStats
endif

# $(PROD_IOC)_registerRecordDeviceDriver.cpp derives from keithleyK2410.dbd
$(PROD_IOC)_SRCS += keithleyK2410_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
$(PROD_IOC)_SRCS_DEFAULT += keithleyK2410Main.cpp
$(PROD_IOC)_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#$(PROD_IOC)_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
$(PROD_IOC)_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

