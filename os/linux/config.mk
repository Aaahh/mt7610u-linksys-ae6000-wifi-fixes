# Support ATE function
HAS_ATE=n

# Support QA ATE function
HAS_QA_SUPPORT=n

HAS_RSSI_FEEDBACK=n

# Support XLINK mode
HAS_XLINK=n


HAS_NINTENDO=n

# Support LLTD function
HAS_LLTD=n

# Support WDS function
HAS_WDS=n

# Support AP-Client function
HAS_APCLI=n

# Support Wpa_Supplicant
# i.e. wpa_supplicant -Dralink
HAS_WPA_SUPPLICANT=y


# Support Native WpaSupplicant for Network Maganger
# i.e. wpa_supplicant -Dwext
HAS_NATIVE_WPA_SUPPLICANT_SUPPORT=y

#Support Net interface block while Tx-Sw queue full
HAS_BLOCK_NET_IF=n

#Support IGMP-Snooping function.
HAS_IGMP_SNOOP_SUPPORT=n

#Support DFS function
HAS_DFS_SUPPORT=n

#Support Carrier-Sense function
HAS_CS_SUPPORT=n

ifeq ($(PLATFORM),MT85XX)
#Support HE_SUPPORT
HAS_HE_SUPPORT=y
HAS_HE_BD_SUPPORT=y
endif

ifeq ($(PLATFORM),MT53XX)
#Support HE_SUPPORT
HAS_HE_SUPPORT=y
HAS_HE_TV_SUPPORT=y
endif

#Support WEPAUTO mode try Open first then shared
HAS_WEPAUTO_OPEN_FIRST_SUPPORT=n


# Support user specific transmit rate of Multicast packet.
HAS_MCAST_RATE_SPECIFIC_SUPPORT=n

# Support for Multiple Cards
HAS_MC_SUPPORT=n

#Support for PCI-MSI
HAS_MSI_SUPPORT=n


#Support for IEEE802.11e DLS
HAS_QOS_DLS_SUPPORT=n

#Support for EXT_CHANNEL
HAS_EXT_BUILD_CHANNEL_LIST=n

#Support for IDS 
HAS_IDS_SUPPORT=n


#Support for Net-SNMP
HAS_SNMP_SUPPORT=n

#Support features of 802.11n Draft3
HAS_DOT11N_DRAFT3_SUPPORT=y

#Support features of Single SKU. 
HAS_SINGLE_SKU_SUPPORT=n

#Support features of 802.11n
HAS_DOT11_N_SUPPORT=y

#Support for 802.11ac VHT
HAS_DOT11_VHT_SUPPORT=y



#Support for 2860/2880 co-exist 
HAS_RT2880_RT2860_COEXIST=n

HAS_KTHREAD_SUPPORT=n





#Support for WiFi Display
HAS_WFD_SUPPORT=n

#Support for Auto channel select enhance
HAS_AUTO_CH_SELECT_ENHANCE=n

#Support statistics count
HAS_STATS_COUNT=y

#Support TSSI Antenna Variation
HAS_TSSI_ANTENNA_VARIATION=n

#Support USB_BULK_BUF_ALIGMENT
HAS_USB_BULK_BUF_ALIGMENT=n

#Support for USB_SUPPORT_SELECTIVE_SUSPEND
HAS_USB_SUPPORT_SELECTIVE_SUSPEND=n

#Support USB load firmware by multibyte
HAS_USB_FIRMWARE_MULTIBYTE_WRITE=n


#Support ANDROID_SUPPORT
HAS_ANDROID_SUPPORT=n

#HAS_IFUP_IN_PROBE_SUPPORT
HAS_IFUP_IN_PROBE_SUPPORT=n




#Support TXRX SW Antenna Diversity
HAS_TXRX_SW_ANTDIV_SUPPORT=n

#Client support WDS function
HAS_CLIENT_WDS_SUPPORT=n

#Support for Bridge Fast Path & Bridge Fast Path function open to other module
HAS_BGFP_SUPPORT=n
HAS_BGFP_OPEN_SUPPORT=n

# Support HOSTAPD function
HAS_HOSTAPD_SUPPORT=n

#Support GreenAP function
HAS_GREENAP_SUPPORT=n

#Support MAC80211 LINUX-only function
#Please make sure the version for CFG80211.ko and MAC80211.ko is same as the one
#our driver references to.
HAS_CFG80211_SUPPORT=y

#Support RFKILL hardware block/unblock LINUX-only function
HAS_RFKILL_HW_SUPPORT=n



HAS_APCLI_WPA_SUPPLICANT=n

HAS_RTMP_FLASH_SUPPORT=n

ifeq ($(OSABL),YES)
HAS_OSABL_FUNC_SUPPORT=y
HAS_OSABL_OS_PCI_SUPPORT=y
HAS_OSABL_OS_USB_SUPPORT=y
HAS_OSABL_OS_RBUS_SUPPORT=n
HAS_OSABL_OS_AP_SUPPORT=y
HAS_OSABL_OS_STA_SUPPORT=y
endif

HAS_LED_CONTROL_SUPPORT=y


#Support WIDI feature
#Must enable HAS_WSC at the same time.

HAS_TXBF_SUPPORT=n

HAS_STREAM_MODE_SUPPORT=n

HAS_NEW_RATE_ADAPT_SUPPORT=y

HAS_RATE_ADAPT_AGS_SUPPORT=n





HAS_TEMPERATURE_TX_ALC=y

HAS_WOW_SUPPORT=n
HAS_WOW_IFDOWN_SUPPORT=n

HAS_HDR_TRANS_SUPPORT=n

HAS_MAC_REPEATER_SUPPORT=n

HAS_FPGA_MODE=n

HAS_WIFI_TEST=n

HAS_WIFI_P2P_CONCURRENT_FAST_SCAN=n

STA_DRIVER_BUILD := 20141022-1327

#################################################

CC := $(CROSS_COMPILE)gcc
LD := $(CROSS_COMPILE)ld

ifndef $(WFLAGS-y)
WFLAGS-y := -DSTA_DRIVER_BUILD="\"${STA_DRIVER_BUILD}\""
else
WFLAGS-y += -DSTA_DRIVER_BUILD="\"${STA_DRIVER_BUILD}\""
endif

WFLAGS-y += -g -DAGGREGATION_SUPPORT -DPIGGYBACK_SUPPORT -DWMM_SUPPORT \
            -DLINUX -Wall -Wstrict-prototypes -Wno-trigraphs
WFLAGS-y += -DSYSTEM_LOG_SUPPORT -DRT28xx_MODE=$(RT28xx_MODE) \
            -DCHIPSET=$(MODULE) -DRESOURCE_PRE_ALLOC -DENHANCED_STAT_DISPLAY
#WFLAGS-y += -DFPGA_MODE
WFLAGS-y += -I$(RT28xx_DIR)/include



WFLAGS-${HAS_WIFI_P2P_CONCURRENT_FAST_SCAN} += -DWIFI_P2P_CONCURRENT_FAST_SCAN

WFLAGS-${HAS_HE_SUPPORT} += -DHE_SUPPORT
WFLAGS-${HAS_HE_SUPPORT} += -DIP_ASSEMBLY

WFLAGS-${HAS_HE_BD_SUPPORT} += -DHE_BD_SUPPORT

WFLAGS-${HAS_WEPAUTO_OPEN_FIRST_SUPPORT} += -DWEPAUTO_OPEN_FIRST

WFLAGS-${HAS_HE_TV_SUPPORT} += -DHE_TV_SUPPORT

WFLAGS-${HAS_KTHREAD_SUPPORT} += -DKTHREAD_SUPPORT

WFLAGS-${HAS_RTMP_FLASH_SUPPORT} += -DRTMP_FLASH_SUPPORT

WFLAGS-${HAS_STREAM_MODE_SUPPORT} += -DSTREAM_MODE_SUPPORT

WFLAGS-${HAS_SINGLE_SKU_SUPPORT} += -DSINGLE_SKU_V2

WFLAGS-${HAS_HDR_TRANS_SUPPORT} += -DHDR_TRANS_SUPPORT

WFLAGS-${HAS_DOT11_VHT_SUPPORT} += -DDOT11_VHT_AC

WFLAGS-${HAS_MAC_REPEATER_SUPPORT} += -DMAC_REPEATER_SUPPORT


#################################################

# config for STA mode

ifeq ($(RT28xx_MODE),STA)
WFLAGS-y += -DCONFIG_STA_SUPPORT -DSCAN_SUPPORT -DDBG

WFLAGS-${HAS_HDR_TRANS_SUPPORT} += -DHDR_TRANS_TX_SUPPORT

WFLAGS-${HAS_XLINK} += -DXLINK_SUPPORT


ifeq ($(HAS_WPA_SUPPLICANT),y)
WFLAGS-y += -DWPA_SUPPLICANT_SUPPORT
WFLAGS-${HAS_NATIVE_WPA_SUPPLICANT_SUPPORT} += -DNATIVE_WPA_SUPPLICANT_SUPPORT
endif

ifeq ($(HAS_ATE),y)
WFLAGS-y += -DRALINK_ATE
WFLAGS-y += -DCONFIG_RT2880_ATE_CMD_NEW
WFLAGS-y += -I$(RT28xx_DIR)/ate/include
WFLAGS-${HAS_QA_SUPPORT} += -DRALINK_QA
endif


WFLAGS-${HAS_SNMP_SUPPORT} += -DSNMP_SUPPORT

WFLAGS-${HAS_QOS_DLS_SUPPORT} += -DQOS_DLS_SUPPORT

ifeq ($(HAS_DOT11_N_SUPPORT),y)
WFLAGS-y += -DDOT11_N_SUPPORT

WFLAGS-${HAS_DOT11N_DRAFT3_SUPPORT} += -DDOT11N_DRAFT3

WFLAGS-${HAS_TXBF_SUPPORT} += -DTXBF_SUPPORT

WFLAGS-${HAS_NEW_RATE_ADAPT_SUPPORT} += -DNEW_RATE_ADAPT_SUPPORT
endif


ifeq ($(HAS_WFD_SUPPORT),y)
HAS_P2P_SUPPORT=y
HAS_P2P_SPECIFIC_WIRELESS_EVENT=y
WFLAGS-y += -DWFD_SUPPORT
endif


WFLAGS-${HAS_CS_SUPPORT} += -DCARRIER_DETECTION_SUPPORT

WFLAGS-${HAS_STATS_COUNT} += -DSTATS_COUNT_SUPPORT

WFLAGS-${HAS_TSSI_ANTENNA_VARIATION} += -DTSSI_ANTENNA_VARIATION

WFLAGS-${HAS_ANDROID_SUPPORT} += -DANDROID_SUPPORT


WFLAGS-${HAS_IFUP_IN_PROBE_SUPPORT} += -DIFUP_IN_PROBE

WFLAGS-${HAS_USB_SUPPORT_SELECTIVE_SUSPEND} += -DUSB_SUPPORT_SELECTIVE_SUSPEND

WFLAGS-${HAS_USB_FIRMWARE_MULTIBYTE_WRITE} += -DUSB_FIRMWARE_MULTIBYTE_WRITE -DMULTIWRITE_BYTES=4

ifeq ($(HAS_CFG80211_SUPPORT),y)
WFLAGS-y += -DRT_CFG80211_SUPPORT -DEXT_BUILD_CHANNEL_LIST
WFLAGS-${HAS_RFKILL_HW_SUPPORT} += -DRFKILL_HW_SUPPORT
endif

ifeq ($(OSABL),YES)
WFLAGS-y += -DOS_ABL_SUPPORT
WFLAGS-${HAS_OSABL_FUNC_SUPPORT} += -DOS_ABL_FUNC_SUPPORT
WFLAGS-${HAS_OSABL_OS_PCI_SUPPORT} += -DOS_ABL_OS_PCI_SUPPORT
WFLAGS-${HAS_OSABL_OS_USB_SUPPORT} += -DOS_ABL_OS_USB_SUPPORT
WFLAGS-${HAS_OSABL_OS_RBUS_SUPPORT} += -DOS_ABL_OS_RBUS_SUPPORT
WFLAGS-${HAS_OSABL_OS_AP_SUPPORT} += -DOS_ABL_OS_AP_SUPPORT
WFLAGS-${HAS_OSABL_OS_STA_SUPPORT} += -DOS_ABL_OS_STA_SUPPORT
endif


WFLAGS-${HAS_TXRX_SW_ANTDIV_SUPPORT} += -DTXRX_SW_ANTDIV_SUPPORT


ifeq ($(HAS_WIDI_SUPPORT),y)
WFLAGS-y += -DWIDI_SUPPORT

ifeq ($(HAS_P2P_SUPPORT),y)
WFLAGS-${HAS_INTEL_WFD_SUPPORT} += -DINTEL_WFD_SUPPORT

WFLAGS-${HAS_WFA_WFD_SUPPORT} += -DWFA_WFD_SUPPORT
endif

endif

WFLAGS-${HAS_WOW_SUPPORT} += -DWOW_SUPPORT

WFLAGS-${HAS_WOW_IFDOWN_SUPPORT} += -DWOW_IFDOWN_SUPPORT

endif
# endif of ifeq ($(RT28xx_MODE),STA)

#################################################

#################################################

#
# Common compiler flag
#






WFLAGS-${HAS_EXT_BUILD_CHANNEL_LIST} += -DEXT_BUILD_CHANNEL_LIST

WFLAGS-${HAS_IDS_SUPPORT} += -DIDS_SUPPORT


ifeq ($(OSABL),YES)
WFLAGS-y += -DEXPORT_SYMTAB
endif

WFLAGS-${HAS_CLIENT_WDS_SUPPORT} += -DCLIENT_WDS

WFLAGS-${HAS_BGFP_SUPPORT} += -DBG_FT_SUPPORT

WFLAGS-${HAS_BGFP_OPEN_SUPPORT} += -DBG_FT_OPEN_SUPPORT


WFLAGS-${HAS_LED_CONTROL_SUPPORT} += -DLED_CONTROL_SUPPORT

WFLAGS-${HAS_FPGA_MODE} += -DCONFIG_FPGA_MODE

WFLAGS-${HAS_FPGA_MODE} += -DCONFIG_WIFI_TEST

WFLAGS-${HAS_TEMPERATURE_TX_ALC} += -DRTMP_TEMPERATURE_TX_ALC

#################################################
# ChipSet specific definitions.
#
ifneq ($(findstring rt2860,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_PCI -DRTMP_PCI_SUPPORT -DRT2860 -DRT28xx -DA_BAND_SUPPORT -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2860
endif

ifneq ($(findstring rt3090,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_PCI -DRT30xx -DRT3090  -DRTMP_PCI_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DVCORECAL_SUPPORT -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2860
endif

ifneq ($(findstring rt2870,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_USB -DRTMP_USB_SUPPORT -DRT2870 -DRT28xx -DRTMP_TIMER_TASK_SUPPORT -DA_BAND_SUPPORT -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2870
endif

ifneq ($(findstring rt2070,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_USB -DRT30xx -DRT3070 -DRT2070 -DRTMP_USB_SUPPORT -DRTMP_TIMER_TASK_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2870
endif

ifneq ($(findstring rt3070,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_USB -DRT30xx -DRT3070 -DRTMP_USB_SUPPORT -DRTMP_TIMER_TASK_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DVCORECAL_SUPPORT -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2870

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-${HAS_CS_SUPPORT} += -DCARRIER_DETECTION_FIRMWARE_SUPPORT 
endif

endif

ifneq ($(findstring rt2880,$(CHIPSET)),)
WFLAGS-y += -DRT2880 -DRT28xx -DRTMP_MAC_PCI -DCONFIG_RALINK_RT2880_MP -DRTMP_RBUS_SUPPORT -DMERGE_ARCH_TEAM -DA_BAND_SUPPORT -DCONFIG_SWMCU_SUPPORT
WFLAGS-${HAS_WIFI_LED_SHARE} += -DCONFIG_WIFI_LED_SHARE
endif

ifneq ($(findstring rt3572,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_USB -DRTMP_USB_SUPPORT -DRT2870 -DRT28xx -DRT30xx -DRT35xx -DRT3572 -DRTMP_TIMER_TASK_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DA_BAND_SUPPORT -DVCORECAL_SUPPORT -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2870

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-${HAS_CS_SUPPORT} +=  -DCARRIER_DETECTION_FIRMWARE_SUPPORT
endif

endif

ifneq ($(findstring rt3573,$(CHIPSET)),)
WFLAGS-y += -DRTMP_MAC_USB -DRTMP_USB_SUPPORT -DRT30xx -DRT35xx -DRT3593 -DRT3573\
          -DRTMP_TIMER_TASK_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT\
          -DA_BAND_SUPPORT -DDOT11N_SS3_SUPPORT \
		  -DVCORECAL_SUPPORT -DNEW_MBSSID_MODE -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2870

ifneq ($(findstring $(RT28xx_MODE),STA APSTA),)
WFLAGS-y += -DRTMP_FREQ_CALIBRATION_SUPPORT
endif

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-${HAS_CS_SUPPORT} +=  -DCARRIER_DETECTION_FIRMWARE_SUPPORT
endif

endif

ifneq ($(findstring rt3062,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_PCI -DRT2860 -DRT28xx -DRT30xx -DRT35xx -DRT3062 -DRTMP_PCI_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DVCORECAL_SUPPORT -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2860
endif

ifneq ($(findstring rt3562,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_PCI -DRT2860 -DRT28xx -DRT30xx -DRT35xx -DRT3562 -DRTMP_PCI_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DA_BAND_SUPPORT -DVCORECAL_SUPPORT -DCONFIG_M8051_SUPPORT

CHIPSET_DAT = 2860
endif

ifneq ($(findstring rt3593,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_PCI -DDOT11N_SS3_SUPPORT -DRT3593 -DRT28xx -DRT30xx -DRT35xx -DRTMP_PCI_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DA_BAND_SUPPORT -DNEW_MBSSID_MODE -DVCORECAL_SUPPORT -DCONFIG_M8051_SUPPORT

#WFLAGS-y += -DNEW_RATE_ADAPT_SUPPORT
CHIPSET_DAT = 2860

ifneq ($(findstring $(RT28xx_MODE),STA APSTA),)
WFLAGS-y += -DRTMP_FREQ_CALIBRATION_SUPPORT
endif

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif
endif

ifneq ($(findstring rt3390,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_PCI -DRT30xx -DRT33xx -DRT3090 -DRT3390 -DRTMP_PCI_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DRTMP_INTERNAL_TX_ALC -DVCORECAL_SUPPORT -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2860
endif

ifneq ($(findstring rt8592,$(CHIPSET)),)
WFLAGS-y += -DRT8592 -DRT65xx -DRLT_MAC -DRTMP_MAC_PCI -DRTMP_PCI_SUPPORT -DA_BAND_SUPPORT -DRX_DMA_SCATTER
WFLAGS-y += -DRTMP_RF_RW_SUPPORT -DIQ_CAL_SUPPORT -DVCORECAL_SUPPORT
WFLAGS-y += -DFIFO_EXT_SUPPORT
WFLAGS-y += -DRTMP_TEMPERATURE_COMPENSATION
WFLAGS-y += -DMCS_LUT_SUPPORT

WFLAGS-y += -DFPGA_MODE
WFLAGS-y += -DWFA_VHT_PF

ifneq ($(findstring $(RT28xx_MODE),AP),)
# TODO: shiang-6590, need to ask hardware about the memory base setting first!!
#WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif
CHIPSET_DAT = 2860
endif

ifneq ($(or $(findstring mt7650e,$(CHIPSET))$(findstring mt7630e,$(CHIPSET)),$(findstring mt7610e,$(CHIPSET))),)
WFLAGS-y += -DMT76x0 -DRT65xx -DRLT_MAC -DRLT_RF -DRTMP_MAC_PCI -DRTMP_PCI_SUPPORT -DA_BAND_SUPPORT -DRX_DMA_SCATTER -DNEW_MBSSID_MODE -DRTMP_EFUSE_SUPPORT -DCONFIG_ANDES_SUPPORT
#-DRTMP_FREQ_CALIBRATION_SUPPORT -DVCORECAL_SUPPORT 
#-DENHANCE_NEW_MBSSID_MODE
ifneq ($(findstring $(RT28xx_MODE),AP),)
#WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif

ifneq ($(findstring mt7650e,$(CHIPSET)),)
WFLAGS-y += -DMT7650
endif

ifneq ($(findstring mt7630e,$(CHIPSET)),)
WFLAGS-y += -DMT7630
endif

ifneq ($(findstring mt7610e,$(CHIPSET)),)
WFLAGS-y += -DMT7610
endif

CHIPSET_DAT = 2860
endif

ifneq ($(or $(findstring mt7650u,$(CHIPSET)),$(findstring mt7630u,$(CHIPSET)),$(findstring mt7610u,$(CHIPSET))),)
WFLAGS-y += -DMT76x0 -DRT65xx -DRLT_MAC -DRLT_RF -DRTMP_MAC_USB -DRTMP_USB_SUPPORT -DRTMP_TIMER_TASK_SUPPORT -DA_BAND_SUPPORT -DRTMP_EFUSE_SUPPORT -DNEW_MBSSID_MODE -DCONFIG_ANDES_SUPPORT
#-DRTMP_FREQ_CALIBRATION_SUPPORT
#-DRX_DMA_SCATTER
ifneq ($(findstring mt7650u,$(CHIPSET)),)
WFLAGS-y += -DMT7650
endif

ifneq ($(findstring mt7630u,$(CHIPSET)),)
WFLAGS-y += -DMT7630
endif

ifneq ($(findstring mt7610u,$(CHIPSET)),)
WFLAGS-y += -DMT7610
endif

ifneq ($(findstring $(RT28xx_MODE),AP),)
#WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif

WFLAGS-${HAS_CSO_SUPPORT} += -DCONFIG_CSO_SUPPORT -DCONFIG_TSO_SUPPORT

CHIPSET_DAT = 2870
endif

ifneq ($(or $(findstring mt7662e,$(CHIPSET)),$(findstring mt7612e,$(CHIPSET))),)
WFLAGS-y += -DMT76x2 -DRT65xx -DRLT_MAC -DRLT_RF -DRTMP_MAC_PCI -DRTMP_PCI_SUPPORT -DA_BAND_SUPPORT -DRX_DMA_SCATTER -DNEW_MBSSID_MODE -DRTMP_EFUSE_SUPPORT -DCONFIG_ANDES_SUPPORT
#-DRTMP_FREQ_CALIBRATION_SUPPORT -DVCORECAL_SUPPORT
ifneq ($(findstring $(RT28xx_MODE),AP),)
#WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif
CHIPSET_DAT = 2860

ifneq ($(findstring mt7662e,$(CHIPSET)),)
WFLAGS-y += -DMT7662
endif

ifneq ($(findstring mt7612e,$(CHIPSET)),)
WFLAGS-y += -DMT7612
endif
endif

ifneq ($(or $(findstring mt7662u,$(CHIPSET)),$(findstring mt7662u,$(CHIPSET))),)
WFLAGS-y += -DMT76x2 -DRT65xx -DRLT_MAC -DRLT_RF -DRTMP_MAC_USB -DRTMP_USB_SUPPORT -DRTMP_TIMER_TASK_SUPPORT -DA_BAND_SUPPORT -DRTMP_EFUSE_SUPPORT -DNEW_MBSSID_MODE -DCONFIG_ANDES_SUPPORT

ifneq ($(findstring mt7662u,$(CHIPSET)),)
WFLAGS-y += -DMT7662
endif

ifneq ($(findstring mt7612u,$(CHIPSET)),)
WFLAGS-y += -DMT7612
endif

ifneq ($(findstring $(RT28xx_MODE),AP),)
#WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif

WFLAGS-${HAS_CSO_SUPPORT} += -DCONFIG_CSO_SUPPORT -DCONFIG_TSO_SUPPORT

CHIPSET_DAT = 2870
endif

ifneq ($(findstring rt3370,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_USB -DRT30xx -DRT33xx -DRT3070 -DRT3370 -DRTMP_USB_SUPPORT -DRTMP_TIMER_TASK_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DRTMP_INTERNAL_TX_ALC -DVCORECAL_SUPPORT -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2870

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-${HAS_CS_SUPPORT} +=  -DCARRIER_DETECTION_FIRMWARE_SUPPORT
endif

endif

ifneq ($(findstring rt5390,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_PCI -DRT30xx -DRT33xx -DRT3090 -DRT3390 -DRT5390 -DRTMP_PCI_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DRTMP_FREQ_CALIBRATION_SUPPORT -DRTMP_INTERNAL_TX_ALC -DVCORECAL_SUPPORT -DIQ_CAL_SUPPORT -DNEW_MBSSID_MODE -DRTMP_TEMPERATURE_COMPENSATION -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2860

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif
endif

ifneq ($(findstring rt5370,$(CHIPSET)),)
WFLAGS-y +=-DRTMP_MAC_USB -DRT30xx -DRT33xx -DRT3070 -DRT3370 -DRT5370 -DRTMP_USB_SUPPORT -DRTMP_TIMER_TASK_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DRTMP_INTERNAL_TX_ALC -DRTMP_FREQ_CALIBRATION_SUPPORT -DVCORECAL_SUPPORT -DIQ_CAL_SUPPORT -DNEW_MBSSID_MODE -DRTMP_TEMPERATURE_COMPENSATION -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2870

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-${HAS_CS_SUPPORT} +=  -DCARRIER_DETECTION_FIRMWARE_SUPPORT
endif

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif
endif

ifneq ($(findstring rt3052,$(CHIPSET)),)
WFLAGS-y += -DRTMP_MAC_PCI -DRTMP_RBUS_SUPPORT -DRT3052 -DRT305x -DRTMP_RF_RW_SUPPORT -DCONFIG_SWMCU_SUPPORT -DVCORECAL_SUPPORT
CHIPSET_DAT = 2870
WFLAGS-${HAS_WIFI_LED_SHARE} += -DCONFIG_WIFI_LED_SHARE
endif

ifneq ($(findstring rt3352,$(CHIPSET)),)
WFLAGS-y += -DRTMP_MAC_PCI -DRTMP_RBUS_SUPPORT -DRT3352 -DRT305x -DRTMP_RF_RW_SUPPORT -DVCORECAL_SUPPORT -DCONFIG_SWMCU_SUPPORT -DRTMP_INTERNAL_TX_ALC -DNEW_MBSSID_MODE
CHIPSET_DAT = 2860
WFLAGS-${HAS_WIFI_LED_SHARE} += -DCONFIG_WIFI_LED_SHARE
ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif
endif

ifneq ($(findstring rt5350,$(CHIPSET)),)
WFLAGS-y += -DRTMP_MAC_PCI -DRTMP_RBUS_SUPPORT -DRT5350 -DRT305x -DRT3050 -DRT3350 -DRTMP_RF_RW_SUPPORT -DVCORECAL_SUPPORT -DCONFIG_SWMCU_SUPPORT -DRTMP_INTERNAL_TX_ALC -DRTMP_FREQ_CALIBRATION_SUPPORT -DIQ_CAL_SUPPORT -DNEW_MBSSID_MODE
CHIPSET_DAT = 2860
WFLAGS-${HAS_WIFI_LED_SHARE} += -DCONFIG_WIFI_LED_SHARE
ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif
endif

ifneq ($(findstring rt5592,$(CHIPSET)),)
WFLAGS-y += -DRTMP_MAC_PCI -DRTMP_PCI_SUPPORT -DRT30xx -DRT5592\
		  -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT\
		  -DA_BAND_SUPPORT -DIQ_CAL_SUPPORT -DRX_DMA_SCATTER -DVCORECAL_SUPPORT\
          -DNEW_MBSSID_MODE -DRTMP_TEMPERATURE_COMPENSATION -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2860
WFLAGS-${HAS_CSO_SUPPORT} += -DCONFIG_CSO_SUPPORT

ifneq ($(findstring $(RT28xx_MODE),STA APSTA),)
WFLAGS-y += -DRTMP_FREQ_CALIBRATION_SUPPORT
endif

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif

endif

ifneq ($(findstring rt5572,$(CHIPSET)),)
WFLAGS-y += -DRTMP_MAC_USB -DRTMP_USB_SUPPORT -DRT30xx -DRT5572 -DRT5592\
		  -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DNEW_MBSSID_MODE\
		  -DRTMP_TIMER_TASK_SUPPORT -DA_BAND_SUPPORT -DIQ_CAL_SUPPORT -DVCORECAL_SUPPORT\
		  -DRTMP_TEMPERATURE_COMPENSATION -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2870
WFLAGS-${HAS_CSO_SUPPORT} += -DCONFIG_CSO_SUPPORT

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-${HAS_CS_SUPPORT} +=  -DCARRIER_DETECTION_FIRMWARE_SUPPORT 
endif

ifneq ($(findstring $(RT28xx_MODE),STA APSTA),)
WFLAGS-y += -DRTMP_FREQ_CALIBRATION_SUPPORT
endif

ifneq ($(findstring $(RT28xx_MODE),AP),)
#WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif

endif

ifneq ($(findstring rt3290,$(CHIPSET)),)
WFLAGS-y += -DRTMP_MAC_PCI -DRTMP_PCI_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DRTMP_FREQ_CALIBRATION_SUPPORT -DRTMP_INTERNAL_TX_ALC -DRT30xx -DRT3290 -DVCORECAL_SUPPORT -DCONFIG_M8051_SUPPORT
CHIPSET_DAT = 2860

ifneq ($(findstring $(RT28xx_MODE),STA APSTA),)
WFLAGS-y += -DRTMP_FREQ_CALIBRATION_SUPPORT -DPCIE_PS_SUPPORT
endif

ifneq ($(findstring $(RT28xx_MODE),AP),)
WFLAGS-y += -DSPECIFIC_BCN_BUF_SUPPORT
endif
endif

#################################################


ifeq ($(PLATFORM),5VT)
#WFLAGS-y += -DCONFIG_5VT_ENHANCE
endif

WFLAGS-${HAS_BLOCK_NET_IF} += -DBLOCK_NET_IF

WFLAGS-${HAS_DFS_SUPPORT} += -DDFS_SUPPORT

WFLAGS-${HAS_MC_SUPPORT} += -DMULTIPLE_CARD_SUPPORT

WFLAGS-${HAS_LLTD} += -DLLTD_SUPPORT

ifeq ($(PLATFORM),RMI)
WFLAGS-y += -DRT_BIG_ENDIAN 
endif

ifeq ($(PLATFORM),UBICOM_IPX8)
WFLAGS-y += -DRT_BIG_ENDIAN -DUNALIGNMENT_SUPPORT -DPLATFORM_UBM_IPX8 -DNO_CONSISTENT_MEM_SUPPORT -DCACHE_LINE_32B
endif

ifeq ($(PLATFORM),BL2348)
WFLAGS-y += -DRT_BIG_ENDIAN
endif

ifeq ($(PLATFORM),BL23570)
WFLAGS-y += -DRT_BIG_ENDIAN
endif

ifeq ($(PLATFORM),BLUBB)
WFLAGS-y += -DRT_BIG_ENDIAN
endif

ifeq ($(PLATFORM),BLPMP)
WFLAGS-y += -DRT_BIG_ENDIAN
endif

ifeq ($(PLATFORM),RMI_64)
WFLAGS-y += -DRT_BIG_ENDIAN 
endif
ifeq ($(PLATFORM),IXP)
WFLAGS-y += -DRT_BIG_ENDIAN
endif

ifeq ($(PLATFORM),IKANOS_V160)
WFLAGS-y += -DRT_BIG_ENDIAN -DIKANOS_VX_1X0
endif

ifeq ($(PLATFORM),IKANOS_V180)
WFLAGS-y += -DRT_BIG_ENDIAN -DIKANOS_VX_1X0
endif

ifeq ($(PLATFORM),INF_TWINPASS)
WFLAGS-y += -DRT_BIG_ENDIAN -DINF_TWINPASS
endif

ifeq ($(PLATFORM),INF_DANUBE)
ifneq (,$(findstring 2.4,$(LINUX_SRC)))
# Linux 2.4
WFLAGS-y += -DINF_DANUBE -DRT_BIG_ENDIAN
else
# Linux 2.6
WFLAGS-y += -DRT_BIG_ENDIAN
endif
endif

ifeq ($(PLATFORM),INF_AR9)
WFLAGS-y += -DRT_BIG_ENDIAN -DINF_AR9
# support MAPI function for AR9.
#WFLAGS-y += -DAR9_MAPI_SUPPORT
endif

ifeq ($(PLATFORM),INF_VR9)
WFLAGS-y += -DRT_BIG_ENDIAN -DINF_AR9 -DINF_VR9
endif

ifeq ($(PLATFORM),CAVM_OCTEON)
WFLAGS-y += -DRT_BIG_ENDIAN
endif

ifeq ($(PLATFORM),BRCM_6358)
WFLAGS-y += -DRT_BIG_ENDIAN -DBRCM_6358
endif

ifeq ($(PLATFORM),INF_AMAZON_SE)
WFLAGS-y += -DRT_BIG_ENDIAN -DINF_AMAZON_SE
endif

ifeq ($(PLATFORM),RALINK_3052)
WFLAGS-y += -DPLATFORM_RALINK_3052
endif

ifeq ($(PLATFORM),FREESCALE8377)
#EXTRA_CFLAGS := -v -I$(RT28xx_DIR)/include -I$(LINUX_SRC)/include $(WFLAGS-y)-O2 -Wall -Wstrict-prototypes -Wno-trigraphs 
#export EXTRA_CFLAGS
WFLAGS-y += -DRT_BIG_ENDIAN
EXTRA_CFLAGS := $(WFLAGS-y) -I$(RT28xx_DIR)/include
endif

ifeq ($(PLATFORM),ST)
#WFLAGS-y += -DST
WFLAGS-y += -DST
endif

#kernel build options for 2.4
# move to Makefile outside LINUX_SRC := /opt/star/kernel/linux-2.4.27-star

ifeq ($(PLATFORM),RALINK_3052)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include/asm-mips/mach-generic -I$(LINUX_SRC)/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe  -finline-limit=100000 -march=mips2 -mabi=32 -Wa,--trap -DLINUX -nostdinc -iwithprefix include $(WFLAGS-y)
export CFLAGS
endif

ifeq ($(PLATFORM), RALINK_2880)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe  -finline-limit=100000 -march=mips2 -mabi=32 -Wa,--trap -DLINUX -nostdinc -iwithprefix include $(WFLAGS-y)
export CFLAGS
endif

ifeq ($(PLATFORM),STAR)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -Uarm -fno-common -pipe -mapcs-32 -D__LINUX_ARM_ARCH__=4 -march=armv4  -mshort-load-bytes -msoft-float -Uarm -DMODULE -DMODVERSIONS -include $(LINUX_SRC)/include/linux/modversions.h $(WFLAGS-y)

export CFLAGS
endif

ifeq ($(PLATFORM),UBICOM_IPX8)
EXTRA_CFLAGS += $(WFLAGS-y) 
export EXTRA_CFLAGS
endif

ifeq ($(PLATFORM),SIGMA)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -I$(LINUX_SRC)/include/asm/gcc -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -DEM86XX_CHIP=EM86XX_CHIPID_TANGO2 -DEM86XX_REVISION=6 -I$(LINUX_SRC)/include/asm-mips/mach-generic -I$(RT2860_DIR)/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -ffreestanding -O2     -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe  -mabi=32 -march=mips32r2 -Wa,-32 -Wa,-march=mips32r2 -Wa,-mips32r2 -Wa,--trap -DMODULE $(WFLAGS-y) -DSIGMA863X_PLATFORM

export CFLAGS
endif

ifeq ($(PLATFORM),SIGMA_8622)
CFLAGS := -D__KERNEL__ -I$(CROSS_COMPILE_INCLUDE)/include -I$(LINUX_SRC)/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fno-common -pipe -fno-builtin -D__linux__ -DNO_MM -mapcs-32 -march=armv4 -mtune=arm7tdmi -msoft-float -DMODULE -mshort-load-bytes -nostdinc -iwithprefix -DMODULE $(WFLAGS-y)
export CFLAGS
endif

ifeq ($(PLATFORM),5VT)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O3 -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=apcs-gnu -mno-thumb-interwork -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm926ej-s --param max-inline-insns-single=40000  -Uarm -Wdeclaration-after-statement -Wno-pointer-sign -DMODULE $(WFLAGS-y) 

export CFLAGS
endif

ifeq ($(PLATFORM),IKANOS_V160)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -I$(LINUX_SRC)/include/asm/gcc -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -I$(LINUX_SRC)/include/asm-mips/mach-generic -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -ffreestanding -O2 -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe -march=lx4189 -Wa, -DMODULE $(WFLAGS-y)
export CFLAGS
endif

ifeq ($(PLATFORM),IKANOS_V180)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -I$(LINUX_SRC)/include/asm/gcc -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -I$(LINUX_SRC)/include/asm-mips/mach-generic -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -ffreestanding -O2 -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe -mips32r2 -Wa, -DMODULE $(WFLAGS-y)
export CFLAGS
endif

ifeq ($(PLATFORM),INF_TWINPASS)
CFLAGS := -D__KERNEL__ -DMODULE -I$(LINUX_SRC)/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -G 0 -mno-abicalls -fno-pic -march=4kc -mips32 -Wa,--trap -pipe -mlong-calls $(WFLAGS-y)
export CFLAGS
endif

ifeq ($(PLATFORM),INF_DANUBE)
	ifneq (,$(findstring 2.4,$(LINUX_SRC)))
	CFLAGS := $(WFLAGS-y) -Wundef -fno-strict-aliasing -fno-common -ffreestanding -Os -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe -msoft-float  -mabi=32 -march=mips32 -Wa,-32 -Wa,-march=mips32 -Wa,-mips32 -Wa,--trap -I$(LINUX_SRC)/include/asm-mips/mach-generic
	else
	CFLAGS := $(WFLAGS-y) -Wundef -fno-strict-aliasing -fno-common -ffreestanding -Os -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe -msoft-float  -mabi=32 -march=mips32r2 -Wa,-32 -Wa,-march=mips32r2 -Wa,-mips32r2 -Wa,--trap -I$(LINUX_SRC)/include/asm-mips/mach-generic
	endif
export CFLAGS
endif

ifeq ($(PLATFORM),INF_AR9)
CFLAGS := $(WFLAGS-y) -Wundef -fno-strict-aliasing -fno-common -fno-pic -ffreestanding -Os -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe -msoft-float  -mabi=32 -mlong-calls -march=mips32r2 -mtune=34kc -march=mips32r2 -Wa,-32 -Wa,-march=mips32r2 -Wa,-mips32r2 -Wa,--trap -I$(LINUX_SRC)/include/asm-mips/mach-generic
export CFLAGS
endif

ifeq ($(PLATFORM),INF_VR9)
CFLAGS := $(WFLAGS-y) -Wundef -fno-strict-aliasing -fno-common -fno-pic -ffreestanding -Os -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe -msoft-float  -mabi=32 -mlong-calls -march=mips32r2 -march=mips32r2 -Wa,-32 -Wa,-march=mips32r2 -Wa,-mips32r2 -Wa,--trap -I$(LINUX_SRC)/include/asm-mips/mach-generic
export CFLAGS
endif

ifeq ($(PLATFORM),BRCM_6358)
CFLAGS := $(WFLAGS-y) -nostdinc -iwithprefix include -D__KERNEL__ -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -I $(LINUX_SRC)/include/asm/gcc -G 0 -mno-abicalls -fno-pic -pipe  -finline-limit=100000 -mabi=32 -march=mips32 -Wa,-32 -Wa,-march=mips32 -Wa,-mips32 -Wa,--trap -I$(LINUX_SRC)/include/asm-mips/mach-bcm963xx -I$(LINUX_SRC)/include/asm-mips/mach-generic  -Os -fomit-frame-pointer -Wdeclaration-after-statement  -DMODULE -mlong-calls
export CFLAGS
endif

ifeq ($(PLATFORM),INF_AMAZON_SE)
CFLAGS := -D__KERNEL__ -DMODULE=1 -I$(LINUX_SRC)/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -DCONFIG_IFX_ALG_QOS -DCONFIG_WAN_VLAN_SUPPORT -fomit-frame-pointer -DIFX_PPPOE_FRAME -G 0 -fno-pic -mno-abicalls -mlong-calls -pipe -finline-limit=100000 -mabi=32 -march=mips32 -Wa,-32 -Wa,-march=mips32 -Wa,-mips32 -Wa,--trap -nostdinc -iwithprefix include $(WFLAGS-y)
export CFLAGS
endif

ifeq ($(PLATFORM),ST)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -Wall -O2 -Wundef -Wstrict-prototypes -Wno-trigraphs -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-aliasing -fno-common -fomit-frame-pointer -ffreestanding -m4-nofpu -o $(WFLAGS-y) 
export CFLAGS
endif

ifeq ($(PLATFORM),PC)
    ifneq (,$(findstring 2.4,$(LINUX_SRC)))
	# Linux 2.4
	CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE -DMODVERSIONS -include $(LINUX_SRC)/include/linux/modversions.h $(WFLAGS-y)
	export CFLAGS
    else
	# Linux 2.6
	EXTRA_CFLAGS := $(WFLAGS-y) 
    endif
endif

ifeq ($(PLATFORM),INTELP6)
	EXTRA_CFLAGS := $(WFLAGS-y) 
endif

#If the kernel version of RMI is newer than 2.6.27, please change "CFLAGS" to "EXTRA_FLAGS"
ifeq ($(PLATFORM),RMI)
EXTRA_CFLAGS := -D__KERNEL__ -DMODULE=1 -I$(LINUX_SRC)/include -I$(LINUX_SRC)/include/asm-mips/mach-generic -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -DCONFIG_IFX_ALG_QOS -DCONFIG_WAN_VLAN_SUPPORT -fomit-frame-pointer -DIFX_PPPOE_FRAME -G 0 -fno-pic -mno-abicalls -mlong-calls -pipe -finline-limit=100000 -mabi=32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -march=xlr -ffreestanding  -march=xlr -Wa,--trap, -nostdinc -iwithprefix include $(WFLAGS-y)
export EXTRA_CFLAGS
endif

ifeq ($(PLATFORM),RMI_64)
EXTRA_CFLAGS := -D__KERNEL__ -DMODULE=1 -I$(LINUX_SRC)/include -I$(LINUX_SRC)/include/asm-mips/mach-generic -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -DCONFIG_IFX_ALG_QOS -DCONFIG_WAN_VLAN_SUPPORT -fomit-frame-pointer -DIFX_PPPOE_FRAME -G 0 -fno-pic -mno-abicalls -mlong-calls -pipe -finline-limit=100000 -mabi=64 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -march=xlr -ffreestanding  -march=xlr -Wa,--trap, -nostdinc -iwithprefix include $(WFLAGS-y)
export EXTRA_CFLAGS
endif

ifeq ($(PLATFORM),IXP)
	CFLAGS := -v -D__KERNEL__ -DMODULE -I$(LINUX_SRC)/include -mbig-endian -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -Uarm -fno-common -pipe -mapcs-32 -D__LINUX_ARM_ARCH__=5 -mcpu=xscale -mtune=xscale -malignment-traps -msoft-float $(WFLAGS-y)
        EXTRA_CFLAGS := -v $(WFLAGS-y) -mbig-endian
	export CFLAGS        
endif

ifeq ($(PLATFORM),SMDK)
        EXTRA_CFLAGS := $(WFLAGS-y) 
endif

ifeq ($(PLATFORM),CAVM_OCTEON)
	EXTRA_CFLAGS := $(WFLAGS-y) -mabi=64 $(WFLAGS-y)
export CFLAGS
endif

ifeq ($(PLATFORM),DM6446)
	CFLAGS := -nostdinc -iwithprefix include -D__KERNEL__ -I$(LINUX_SRC)/include  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Os -fno-omit-frame-pointer -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mlittle-endian -mabi=apcs-gnu -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm9tdmi -msoft-float -Uarm -Wdeclaration-after-statement -c -o $(WFLAGS-y)
export CFLAGS
endif

ifeq ($(PLATFORM),BL2348)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -I$(LINUX_SRC)/include/asm/gcc -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -DEM86XX_CHIP=EM86XX_CHIPID_TANGO2 -DEM86XX_REVISION=6 -I$(LINUX_SRC)/include/asm-mips/mach-generic -I$(RT2860_DIR)/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -ffreestanding -O2     -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe  -mabi=32 -march=mips32r2 -Wa,-32 -Wa,-march=mips32r2 -Wa,-mips32r2 -Wa,--trap -DMODULE $(WFLAGS-y) -DSIGMA863X_PLATFORM -DEXPORT_SYMTAB -DPLATFORM_BL2348
export CFLAGS
endif

ifeq ($(PLATFORM),BL23570)
EXTRA_CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -I$(LINUX_SRC)/include/asm/gcc -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -DEM86XX_CHIP=EM86XX_CHIPID_TANGO2 -DEM86XX_REVISION=6 -I$(LINUX_SRC)/include/asm-mips/mach-generic -I$(RT2860_DIR)/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -ffreestanding -O2     -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe  -mabi=32 -march=74kc -Wa,-32 -Wa,-march=mips32r2 -Wa,-mips32r2 -Wa,--trap -DMODULE $(WFLAGS-y) -DSIGMA863X_PLATFORM -DEXPORT_SYMTAB -DPLATFORM_BL23570
export EXTRA_CFLAGS
endif

ifeq ($(PLATFORM),BLUBB)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -I$(LINUX_SRC)/include/asm/gcc -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -DEM86XX_CHIP=EM86XX_CHIPID_TANGO2 -DEM86XX_REVISION=6 -I$(LINUX_SRC)/include/asm-mips/mach-generic -I$(RT2860_DIR)/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -ffreestanding -O2     -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe  -mabi=32 -march=mips32r2 -Wa,-32 -Wa,-march=mips32r2 -Wa,-mips32r2 -Wa,--trap -DMODULE $(WFLAGS-y) -DSIGMA863X_PLATFORM -DEXPORT_SYMTAB -DPLATFORM_BL2348
export CFLAGS
endif

ifeq ($(PLATFORM),BLPMP)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -I$(LINUX_SRC)/include/asm/gcc -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -I$(LINUX_SRC)/include/asm-mips/mach-tango2 -DEM86XX_CHIP=EM86XX_CHIPID_TANGO2 -DEM86XX_REVISION=6 -I$(LINUX_SRC)/include/asm-mips/mach-generic -I$(RT2860_DIR)/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -ffreestanding -O2     -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe  -mabi=32 -march=mips32r2 -Wa,-32 -Wa,-march=mips32r2 -Wa,-mips32r2 -Wa,--trap -DMODULE $(WFLAGS-y) -DSIGMA863X_PLATFORM -DEXPORT_SYMTAB
export CFLAGS
endif

ifeq ($(PLATFORM),MT85XX)
    ifneq (,$(findstring 2.4,$(LINUX_SRC)))
	# Linux 2.4
	CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE -DMODVERSIONS -include $(LINUX_SRC)/include/linux/modversions.h $(WFLAGS-y)
	export CFLAGS
    else
	# Linux 2.6
	EXTRA_CFLAGS += $(WFLAGS-y) -DMT85XX
	EXTRA_CFLAGS += -D _NO_TYPEDEF_BOOL_ \
	                -D _NO_TYPEDEF_UCHAR_ \
	                -D _NO_TYPEDEF_UINT8_ \
	                -D _NO_TYPEDEF_UINT16_ \
	                -D _NO_TYPEDEF_UINT32_ \
	                -D _NO_TYPEDEF_UINT64_ \
	                -D _NO_TYPEDEF_CHAR_ \
	                -D _NO_TYPEDEF_INT16_ \
	                -D _NO_TYPEDEF_INT32_ \
	                -D _NO_TYPEDEF_INT64_ \
	                
    endif
endif

ifeq ($(PLATFORM),NXP_TV550)
    ifneq (,$(findstring 2.4,$(LINUX_SRC)))
        # Linux 2.4
        CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=2 -march=mips -DMODULE -DMODVERSIONS -include $(LINUX_SRC)/include/linux/modversions.h $(WFLAGS-y)
        export CFLAGS
    else
        # Linux 2.6
        EXTRA_CFLAGS := $(WFLAGS-y)
    endif
endif

ifeq ($(PLATFORM),MVL5)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -O3 -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mno-thumb-interwork -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm926ej-s --param max-inline-insns-single=40000  -Uarm -Wdeclaration-after-statement -Wno-pointer-sign -DMODULE $(WFLAGS-y) 
export CFLAGS
endif

ifeq ($(PLATFORM),RALINK_3352)
CFLAGS := -D__KERNEL__ -I$(LINUX_SRC)/include/asm-mips/mach-generic -I$(LINUX_SRC)/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -G 0 -mno-abicalls -fno-pic -pipe  -finline-limit=100000 -march=mips2 -mabi=32 -Wa,--trap -DLINUX -nostdinc -iwithprefix include $(WFLAGS-y)
export CFLAGS
endif
