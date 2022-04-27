#
# sami.trc.ctl - Copyright (c) 1997, Soliton Associates Ltd.
#
# Trace control file for sami
#
internal  		maxfilesize            		500000
internal  		paging				on
#----------------------------------------------------------
task      		TRC                           	on
trace     		TRC_WARN                      	on
trace     		TRC_DIAG                      	on
trace     		TRC_PENT                      	off
trace     		TRC_PEXT                      	off
#----------------------------------------------------------
task      		SAMI                       	on
trace     		SAMI_INIT                     	on
trace     		SAMI_TERM                     	on
trace     		SAMI_ABNORM                  	on
trace     		SAMI_CMD                     	off
trace     		SAMI_INQ                     	off
trace     		SAMI_DATA                     	off
trace     		SAMI_WAIT                     	off
trace     		SAMI_SIGS                     	on
trace     		SAMI_STATE                     	on
trace     		SAMI_XDR                     	off
trace     		SAMI_HDUMP                     	off
#----------------------------------------------------------
task      		NET                       	on
trace     		NET_INFO                     	on
trace     		NET_WARN                     	on
trace     		NET_HDUMP                   	off
trace     		NET_BDUMP                   	off
trace     		NET_NCV                    	on
trace     		NET_FROM_SAM                   	off
trace     		NET_FROM_SAX                   	off
trace     		NET_TO_SAM                    	off
trace     		NET_TO_SAX                    	off
trace     		NET_SEQ                  	off
trace     		NET_TCPI                  	off
#----------------------------------------------------------
task      		SVP                       	on
trace     		SVP_ACV        		       	off
trace     		SVP_SVN		               	on
trace     		SVP_SVO        		       	on
trace     		SVP_SVR                  	on
trace     		SVP_SVS        		       	off
trace     		SVP_SCV        		       	off
trace     		SVP_ODUMP      		       	off
#----------------------------------------------------------
