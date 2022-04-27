#
# nsvp.trc.ctl - Copyright (c) 1997, Soliton Associates Ltd.
#
# Trace control file for nsvp children
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
task      		NSVP                       	on
trace     		NSVP_DIAG                     	off
trace     		NSVP_INIT                     	on
trace     		NSVP_TERM                     	on
trace     		NSVP_ABNORM                  	on
trace     		NSVP_CMD                     	off
trace     		NSVP_INQ                     	off
trace     		NSVP_SIGS                     	off
trace     		NSVP_IMM                     	on
trace     		NSVP_EMM                     	off
trace     		NSVP_NON                     	off
trace     		NSVP_XDR                     	on
#----------------------------------------------------------
task      		NET                       	on
trace     		NET_INFO                     	on
trace     		NET_WARN                     	on
trace     		NET_DIAG                     	off
trace     		NET_NCV                  	off
trace     		NET_NIN                     	off
trace     		NET_NOUT                    	off
trace     		NET_DIN                     	off
trace     		NET_DOUT                    	off
trace     		NET_SEQ                  	off
#----------------------------------------------------------
task      		SVP                       	on
trace     		SVP_ACV        		       	on
trace     		SVP_SVO        		       	on
trace     		SVP_SVS        		       	off
#----------------------------------------------------------
