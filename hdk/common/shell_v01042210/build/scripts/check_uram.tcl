# Amazon FPGA Hardware Development Kit
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

global uramHeight
global CL_MODULE

# If CL_MODULE does not exist, set it to a default value.
if {![info exists CL_MODULE]} {
  set CL_MODULE cl_helloworld
}

###Check oreg_b usage for uramHeight==3 and uramHeight==4
set clean 1
if {[string compare $CL_MODULE "cl_uram_example"] == 0} {
if {$uramHeight > 2} {
   foreach uram [get_cells -hier -filter {REF_NAME==URAM288 && NAME=~WRAPPER_INST/CL/*} ] {
      set oregB [get_property OREG_B $uram]
      if {![string match -nocase "false" $oregB] || $oregB} {
         set clean '0'
         puts "Error: URAM288 instance \'$uram\' has OREG_B set to $oregB."
      }

      set oregEccB [get_property OREG_ECC_B $uram]
      if {![string match -nocase "false" $oregEccB] || $oregEccB} {
         set clean 0
         puts "Error: URAM288 instance \'$uram\' has OREG_ECC_B set to $oregEccB."
      }
   }
}

if {!$clean} {
   set errMsg "\nError: 1 or more URAM288 cells in the design are using OREG_B port. This is not supported for this flow. Review previous error messages and update URAM288 to set OREG_B and OREG_ECC_B properties to false."
   error $errMsg
}

###Check Cascade height
if {$uramHeight == 2} {
   # Prohibit the top two URAM sites of each URAM quad.
   set uramSites [get_sites -filter { SITE_TYPE == "URAM288" && NAME=~WRAPPER_INST/CL/*} ]
   foreach uramSite $uramSites {
      # Get the URAM location within a quad
      set quadLoc [expr  [string range $uramSite [expr [string first Y $uramSite] + 1] end] % 4]
      # The top URAM sites has usage restrictions
      if {$quadLoc == 2 || $quadLoc == 3} {
         # Prohibit the appropriate site
         if {[get_property IS_USED $uramSite]} {
            error "Error: Site $uramSite is occupied, and connot be prohibited. This design is set to only utilize the lower two (0 and 1) URAM sites of each quad, and this site ($quadLoc) should not be used."
         }
         set_property PROHIBIT true $uramSite
         puts "Setting Placement Prohibit on top URAM288 site $uramSite"
      }
   }
} elseif {$uramHeight == 3} {
   # Prohibit the top URAM site of each URAM quad.
   set uramSites [get_sites -filter { SITE_TYPE == "URAM288" && NAME=~WRAPPER_INST/CL/*} ]
   foreach uramSite $uramSites {
      # Get the URAM location within a quad
      set quadLoc [expr  [string range $uramSite [expr [string first Y $uramSite] + 1] end] % 4]
      # The top URAM sites has usage restrictions
      if {$quadLoc == 3} {
         # Prohibit the appropriate site
         if {[get_property IS_USED $uramSite]} {
            error "Error: Site $uramSite is occupied, and connot be prohibited. This design is set to only utilize the lower three URAM sites (0, 1, and 2) of each quad, and this site ($quadLoc) should not be used."
         }
         set_property PROHIBIT true $uramSite
         puts "Setting Placement Prohibit on top URAM288 site $uramSite"
      }
   }
} elseif {$uramHeight == 4} {
   foreach uram [get_cells -hier -filter { REF_NAME==URAM288 && NAME=~WRAPPER_INST/CL/*} ] {
      if {![string match "NONE" [get_property CASCADE_ORDER_A $uram]] || ![string match "NONE" [get_property CASCADE_ORDER_B $uram]]} {
         set errMsg "Error: URAM instance $uram is expected to CASCADE_ORDER_A and CASCADE_ORDER_B set to \"NONE\"."
         append errMsg "\n\tCASDCADE_ORDER_A: [get_property CASCADE_ORDER_A $uram]\n\tCASCADE_ORDER_B: [get_property CASCADE_ORDER_B $uram]\n"
         append errMsg "Verify synthesis option \'-max_uram_casade_height 1\' is set, and that no cascaded URAMs are instantiated."
         error $errMsg
      }
   }
} else {
   error "Error: Variable \'\$uramHeight\' set to unsupported value $uramHeight. Supported values are 2, 3, or 4"
}  
}
