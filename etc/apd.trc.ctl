#
# apd.trc.ctl - Copyright (c) 2000, Soliton Associates Ltd.
#
# Trace control file for apd
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
task      		APD                       	on
trace     		APD_INIT                    	on
trace     		APD_INITD                    	on
trace     		APD_SVQ     		       	on
trace     		APD_SVO     		       	on
trace     		APD_PARSE     		       	on
trace     		APD_CHILD     		       	on
#----------------------------------------------------------
task      		APBASE                       	on
trace     		APBASE_INIT                    	on
trace     		APBASE_POST                    	on
trace     		APBASE_IN                     	on
trace     		APBASE_OUT                     	on
trace     		APBASE_SVO     		       	on
trace     		APBASE_SVQ     		       	on
trace     		APBASE_SCV     		       	off
trace     		APBASE_ACV     		       	on
trace     		APBASE_XDR     		       	off
trace     		APBASE_TERM                   	on
trace     		APBASE_ABNORM                  	on
#----------------------------------------------------------
