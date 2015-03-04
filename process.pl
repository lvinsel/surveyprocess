#!/bin/perl
#----------------------------------------
# MPStoCDI_01.pl
# fork process pro_fbk_22.pl
# convert MPS codes to Clark Deitz Inc codes
#----------------------------------------
# process_22.pl
# added various codes to maintain the detail of Hoelscher's code list
# added	'N' - Stone/Rock
# 	'O' - Oil and Chip
# to Material Modifiers List
# added Monitoring/Inspection Well 'MWL' IDOT 640
# added a material modifier to Gutter GU*
# added a material modifier to CURB "CR*" which causes a conflict with CRB which is our standard concrete back of curb code
# 'curb bit' becomes CUB instead????
# add RR mile Post 'RMP'
# add RR switch heater 'RSH'
# add RR tie 'RTI'
# add RR derailer RDR
# add additional modifier to building.  there are conflicts in the B** series due to bridge codes
# so I'm moving Building codes to G**
# G<OM> the first modifiier is the ownership.  This is needed for IDOT.  The second modifier is the material type
# I added M as a material type for Masonry
# added PA<M> for patio
# added SL<M> for slab
# added RW<M> for Retaining wall material type
# added WA<M> for Wall material type
# added ACU for air conditioning unit
# added COL for column
# added DCK for deck
# added V for a material type for vinyl
# Added a list of Survey Point types using a combination Hoelscher codes and IDOT codes SP<P>
# A	Traverse Point
# B	Axle
# C	Cut Cross
# D	Concrete Monument
# E	Crimp Pipe
# F	Bench Mark
# G	GPS Monument
# H	Control Point
# I	Iron Pipe
# J	Nail
# k	Nail & Washer\shiner
# L	PK Nail
# M	Mag Nail
# N	ROW Marker
# O	RR Spike
# P	Pole Barn Spike
# Q	Stone
# R	Cotton Picker Spindle
# S	Hub
# T	Cut Square
# U	Rebar
# V	Drill Hole
# W	Brass Marker
# X	Iron Rod/Pin
# Y
# Z	other
# Removed the SPC - Special misc code - more confusion
# Changed a few of the Railroad Related codes so that they all start with RR
# Added some Railroad related codes too 
# Added Riser/Feed for the Utilities RS*
########################################
#----------------------------------------
#----------------------------------------
# process_21.pl
# add combined ASCII output with all points in one file
#----------------------------------------
#----------------------------------------
# process_20.pl
# fix bugs in bridge and point files
# some points getting placed in both files
# --------------------------------------------
# process_19.pl
# 20131107
# Modified:
# MHM
# MHN
# VLB
# VLW
# VLG
# BBG
# BBW
#----------------------------------------
# process_18.pl
# 20130621
# Change *_QA_lines.cor and *_QA_spots.cor to *_PtLn.cor
# Change *_QA_symbols.cor to *_cell.cor
# Remove all QA output files
# Removed the DTM file
# added:
#   RPF = point of frog - 1" point
#   RPS = point of switch
#   RSW = switch box
# Goals:
# rename variables
# add cathodic protection
#
####################################
# process_17.pl
# 20130322
# added:
#     VNG Gas Vent
#     PDF Pedestal Fiber Optic
#     HHF Handhole Fiber Optic
#     HHV Handhole TV
#     HHR Traffic Signal Handhole
#     HHE Handhole Electric
# change HHT from traffic signal handhole to Handhole Traffic
#     MHS Manhole Traffic Fiber Optic
############################################
##################################
# process_16.pl 20130116
# added BWC - Bridge Deck Sidewalk Concrete - BSW is depreciated
# added BSS - Bridge Structural Steel
# added BSC - Bridge Scupper
# added BDP - Bridge Deck Plate
# change BPA from 624 to 633 and eliminated 'required Comment'"PARAPET'
# depreciated edge of pavement/edge of shoulder combinations used on IL-83 (fail). ERB-EWC.
# depreciated RNW Runway
# depreciated 667 as IDOT code for crown (CRB/CRC) using breakline 607 with material comments for
  # pavement areas with no stripeing - use stripeing as breakline where possible
# Crown now has material types: CNB = HMA, CNC = CONC, etc. - see 667 above
# I'm going to stop using the B6B codes and start using CRB on all curbs unless they are
  # odd (not B6.12 or B6.24).  Use the IDOT codes of odd curbs. - LV - The B6B and B62 will still
  # work.
# Changed BBA/BBB/BBC/BBR from 619 to 621 so that spots land on the Topo_BridgeStructures level
# added BUC - Building Commercial - BLD is being depreciated
# added BUP - Building Public - BLD is being depreciated
# added BUR - Building Residential - BLD is being depreciated
# changed RR centerline from CLR to RCL
# added BRR the base of a Barrier Wall
# added SBW Splice Box Water - weird sprinkler system above ground splice box at US-14 in Mt. Pleasant
###################################
#####################################
# PROCESS_15.pl
# added SNN - Warning Sign - Sanitary
# added SNW - Warning Sign - Water
########################
#####################################
# PROCESS_14.pl
#   added RCK - Rock or Boulder
########################
#-----------------------
# PROCESS_13.PL
#  ADDED SWA,B,C,R
# ADDED SBT - SPLICE BOX TELEPHONE
# added PDE - Pedestal Electric\
# ADDED BBA, BBB, BBC, BBR - BRIDGE DECK AGG, BIT, CONC, BRICK
# ADDED BSW - BRIDGE SIDEWALK

#
####################################
#----------------------------
# Process_12.pl
# added:
#  LNB = Lane Lines - HMA/BIT
#  LNC = Lance Lines - Conc
#  TOE = Toe of Slope
#  TOP = Top of Slope
#  RIP = Riprap
#  DCA = Driveway/Commercial Aggregate
#  DCB = Driveway/Commercial BIT/HMA
#  DCC = Driveway/Commercial Concrete
#  DCG = Driveway/Commercial Ground
#  DCR = Driveway/Commercial Brick
#  DFA = Driveway/Field Aggregate
#  DFB = Driveway/Field BIT/HMA
#  DFC = Driveway/Field Concrete
#  DFG = Driveway/Field Ground
#  DFR = Driveway/Field Brick
#  DPA = Driveway/Private-Residential Aggregate
#  DPB = Driveway/Private-Residential BIT/HMA
#  DPC = Driveway/Private-Residential Concrete
#  DPG = Driveway/Private-Residential Ground
#  DPR = Driveway/Private-Residential Brick
########################################
#-----------------------
# Process_11.pl 20111028
#
# Added: FOU = Foundation
#
########################
# Process_10.pl 20110729
#
# Process_8 had many improvements - however I also migrated to "Mapping Codes"
# (instead of "Line Codes") as an option in Geopak.  Using the "Mapping Codes" I was
# finally able to get the curves to work. These codes also needed to be at the beginning of
# code like BL*EOP1.
#
# But the Mapping Code option forced the lines to be created in
# point number order.  This caused problems in processing.  It ignored
# the order of the points in the ASCII file.
# For example, say you missed an EOP1 shot on a cross section and went back to it at the
# next set up.
# Now to draw that line correctly using the "Line Coding" option you can reorder the records in
# the ASCII file like:
# 1,1000,1000,EOP1,L
# 2,1000,1010,EOP1,
# 40,1000,1020,EOP1,
# 3,1000,1030,EOP1,
#
# In the "Mapping Codes" option, the order of the ASCII file is ignored and the EOP1 are sorted
# so that the line goes 1,2,3,40.
#
# This was too big of a complication to screw with; we would need to RENUMBER points to
# get the line to draw correctly.
# So this version has the latest code changes (MPS_IDOTCodes_V02_15.xlsx) and reverts back to
# processing with the "Line Coding" option.
#
##############################################################################
#
#########################################################################
# The following array maps keys used by Field Surveyors
#
#
# Codes not in the list pass through unchanged
#####################################################################################
%pointCodes = (  # ABC -> 123
 #"XXX" => "XXX",
 "ACU" => "AC", # Air Conditioning Unit
 "AEM" => "930", # AG Electric Main
 #"AGE" => "674", # Shoulder Aggregate Edge
 #"B6T" => "508", # Curb B6-12 Top Front #deleted v6
 "BAB" => "ABUT", # Bridge Abutment Cap Top.  The outline of the face,sides,
                  # and top of the abutment.  A 3d line.
 "BAL" => "613", # The outline of the face of the abutment and the face of the
                  # wingwalls.  A 2d line, usually collected prismless.
 "BAR" => "STR", # Stop Bar
 "BAS" => "618", # Bridge Approach Slab
 #"BAT" => "615", # Bridge Abutment Top
 "BBA" => "619", # Bridge Deck - AGG - Spots only
 "BBB" => "619", # Bridge Deck - BIT - Spots only
 "BBC" => "619", # Bridge Deck - CONC - Spots only
 "BBG" => "319", # Buffalo Box - Gas
 "BBR" => "619", # Bridge Deck - BRICK - Spots only
 "BBS" => "620", # Bridge Seat.  The bridge seat elevation.  For elevation only.  Usually collected
                  # with the "hook".
 "BBW" => "WB", # Buffalo Box - Water
 #"BBX" => "320", # Water Buffalo Box
 "BCB" => "611", # Bridge Curb.  The top back of any curb or median on a bridge.
 "BCH" => "699", # Bench - like park bench
 "BDB" => "619", # Bridge Deck. The line of the bit bridge deck.  A 3d line.
 "BDC" => "619", # Bridge Deck. The line of the concrete bridge deck.  A 3d line.
 "BDP" => "619", # Bridge Deck Plate
 "BDT" => "619", # Bridge Desk Timber
 #"BDK" => "619", # Bridge Deck
 "BEX" => "623", # Bridge Expansion Joint.  A 3d line.
 "BHR" => "HRAIL", # Bridge Handrail
 "BLD" => "BLDG", # v16 start of depreciation
 "BLC" => "626", # The bottom of the concrete bridge beams.  Usually taken at
                  # the beginning middle and end oof each span of the bridge beams.
                  # Usually only required on the outside (upstream and downstream) beams.
 "BLS" => "627", # The bottom of the steel bridge beams.  Usually taken at
                  # the beginning middle and end oof each span of the bridge beams.
                  # Usually only required on the outside (upstream and downstream) beams.
 "BLT" => "628", # The bottom of the timber bridge beams.  Usually taken at
                  # the beginning middle and end oof each span of the bridge beams.
                  # Usually only required on the outside (upstream and downstream) beams.
 "BOL" => "BOL", # Bollard / Post
 "BOR" => "CORE", # Soil Boring?
 "BPA" => "633", # Bridge Parapet / Handrail.  A 2d line.
 "BPC" => "629", # The outline of the face of the pier cap. A 2d line usually
                  # collected "prismless".
 "BPR" => "615", # Pier Cap.  The outline of the face, sides and top of the pier cap.  A 3d line.
 "BPT" => "631", # The pier cap elevation,  For elevation only.  Usually collected
                  # with the "hook".
 #"BRC" => "611", # Bridge Curb
 "BRK" => "TOE", # Breakline
 "BRR" => "579", # Barrier Wall
 "BSC" => "641", # Bridge Scupper
 "BSH" => "BUSH",
 "BSL" => "BUSH1", # Bush Line/ Hedgerow added v6
 "BSS" => "633", # Bridge Structural Steel
 "BUC" => "BLDG", # Building - Commercial
 "BUP" => "BLDG", # Building - Public
 "BUR" => "BLDG", # Building - Residential
 "BWC" => "619", # Bridge Deck Sidewalk Concrete
 "BWL" => "612", # Bridge Backwall The outline of the face and sides of the
                  # bridge back wall.  A 3d line.
 #"BWT" => "635", # Bridge Wing Wall Top Elevation
 "BWW" => "635", # The outline of the face and sides of the wingwall.  A 3d line with
                  # points at each elevation change.
 "CBM" => "CB", # Catch Basin Grate
 "CKH" => "CKBS",
 "CKV" => "CKBS",
 "CNA" => "CL", # Crown - AGG
 "CNB" => "CL", # Crown - BIT/HMA - use stripeing as breakline where possible
 "CNC" => "CL", # Crown - CONC - use stripeing as breakline where possible
 "CNR" => "CL", # Crown - BRICK
 "CNP" => "CNPY", # Canopy
 "CNT" => "TMAST", # Traffic Signal Cantilever/Mast Arm
 "COL" => "PLR", # Column
 "CPH" => "MON", # Control Point - modified v6
 "CRB" => "BC", # Curb Top - Bit
 "CRC" => "BC", # Curb Top - Conc
 "CRN" => "BC", # Curb Top - Stone
# "CRN" => "667", # Depreciated see CNA-CNR
 "CRP" => "CROP", # Crop Line
 "CRW" => "STR", # Crosswalk
 "CUB" => "CULV",
 "CUE" => "CULV",
 "CUP" => "CULV",
 "DAM" => "DAM",
 "DCA" => "EP", # ver12 - Driveway/Commercial Aggregate
 "DCB" => "EP", # ver12 - Driveway/Commercial BIT/HMA
 "DCC" => "EP", # ver12 - Driveway/Commercial Concrete
 "DCG" => "FE", # ver12 - Driveway/Commercial Ground - Field Entrance
 "DCK" => "DECK", # Deck 
 "DCR" => "EP", # ver12 - Driveway/Commercial Brick
 "DFA" => "FE", # ver12 - Driveway/Field Aggregate
 "DFB" => "FE", # ver12 - Driveway/Field BIT/HMA
 "DFC" => "FE", # ver12 - Driveway/Field Concrete
 "DFG" => "FE", # ver12 - Driveway/Field Ground - Field Entrance
 "DFR" => "FE", # ver12 - Driveway/Field Brick
 "DPA" => "EP", # ver12 - Driveway/Private-Residential Aggregate
 "DPB" => "EP", # ver12 - Driveway/Private-Residential BIT/HMA
 "DPC" => "EP", # ver12 - Driveway/Private-Residential Concrete
 "DPG" => "FE", # ver12 - Driveway/Private-Residential Ground - Field Entrance
 "DPR" => "EP", # ver12 - Driveway/Private-Residential Brick
 "DRA" => "EP", # Driveway - aggregate
 "DRB" => "EP", # Driveway - HMA
 "DRC" => "EP", # Driveway - Concrete
 "DRG" => "FE", # Field Entrance
 "DRR" => "EP", # Driveway - Brick
 "DRV" => "EP", # Depreciated see DCA Thru DPR
 "DSP" => "DS", # Downspout
 "DTH" => "FLD", # Ditch Flowline
 "DTP" => "FLS", # Ditch - Paved - Centerline
 "EOA" => "AGG", # Edge of pavement - aggregate
 "EOB" => "BIT", # Edge of pavement - bit/hma
 "EOC" => "EP", # Edge of pavement - concrete
 "EOL" => "EP", # Edge of Lanes - added v6
 "EOR" => "EP", # Edge of pavement - Brick
 #"EOP" => "668", # Edge of pavement
 "FEC" => "ESC", # Flared End Section - Concrete
 "FES" => "ESM", # Flared End Section - Metal
 "FFL" => "FF", # Finish Floor/Threshold Elevation
 #"FLO" => "363", # Flowline / Ditch
 "FNC" => "FNC", # Fence Line
 "FND" => "MON", # Found Monument
 "FNG" => "GATE", # Gate Post
 "FNI" => "FNC", # Fence Line - Iron
 "FNL" => "FNC", # Fence Line - Chain Link
 "FNT" => "FNC", # Fence Line - Wood
 "FNV" => "FNC", # Fence Line - Vinyl
 "FNW" => "FNC", # Fence Line - Wire
 "FNX" => "FNC", # Fence Line - Barbed Wire
 "FOU" => "795", # Foundation
 "GCC" => "BLDG", # Building - Commercial - Concrete
 "GCF" => "BLDG", # Building - Commercial - Wood Frame
 "GCM" => "BLDG", # Building - Commercial - Masonry
 "GCR" => "BLDG", # Building - Commercial - Brick
 "GCS" => "BLDG", # Building - Commercial - Steel
 "GCT" => "BLDG", # Building - Commercial - Timber/Log
 "GND" => "GS",
 "GPC" => "BLDG", # Building - Public - Concrete
 "GPF" => "BLDG", # Building - Public - Wood Frame
 "GPM" => "BLDG", # Building - Public - Masonry
 "GPR" => "BLDG", # Building - Public - Brick
 "GPS" => "BLDG", # Building - Public - Steel
 "GPT" => "BLDG", # Building - Public - Timber/Log
 "GRC" => "BLDG", # Building - Residential - Concrete
 "GRF" => "BLDG", # Building - Residential - Wood Frame
 "GRL" => "GRAIL", # Guard Rail
 "GRM" => "BLDG", # Building - Residential - Masonry
 "GRR" => "BLDG", # Building - Residential - Brick
 "GRS" => "BLDG", # Building - Residential - Steel
 "GRT" => "BLDG", # Building - Residential - Timber/Log
 "GUB" => "FL", # Gutter/Flowline - HMA
 "GUC" => "FL", # Gutter/Flowline - CONC
 "GUN" => "FL", # Gutter/Flowline - Stone
 "GUP" => "GP", # Guy Pole
 "GUT" => "FL", # Gutter/Flowline
 "GUY" => "GUY", # Guy Wire
 "H2O" => "EW", # Water Line
 "HHD" => "HH", # Traffic Signal Handhole Double - added v6
 "HHE" => "HH", # Handhole - Electric
 "HHF" => "HH", # Handhole - Fiber Optic
 "HHT" => "HH", # Handhole - Telephone
 "HHR" => "HH", # Handhole - Traffic Signal Handhole
 "HHV" => "HH", # Handhole - Cable TV
 "HWL" => "HW",
 "HYD" => "FH",
 "INL" => "INLET", # Inlet
 "JUE" => "E",
 "JUF" => "FO", # JULIE Communications Fiber Optic Mark
 "JUG" => "G",
 "JUM" => "SS", # JULIE Storm Mark"
 "JUN" => "SAN", # JULIE Sanitary Mark
 "JUP" => "PIPL", # JULIE Petroleum Pipeline Mark
 "JUR" => "T",
 "JUS" => "T", # JULIE  Traffic Signal Fiber Optic Mark
 "JUT" => "T",
 "JUV" => "CTV",
 "JUW" => "W", # JULIE Waterline Mark
 "LNB" => "EP", # Lane Line - HMA
 "LNC" => "EP", # Lane Line - CONC
 "LND" => "LS",
 "LNM" => "STR",
 "MBX" => "MB",
 "MCS" => "STRU", # Misc. Concrete Slab
 "MED" => "CMED", # Median
 "MHE" => "EMH", # Manhole Electric
 "MHF" => "TMH", # Manhole Fiber Optic
 "MHG" => "GB", # Manhole Gas
 "MHS" => "TMH", # Manhole Traffic Fiber Optic
 "MHM" => "MHSS", # Manhole Storm
 "MHN" => "MHSA", # Manhole Sanitary
 "MHT" => "TMH", # Manhole Telephone/Communications
 "MHV" => "TMH", # Manhole Cable TV
 "MHW" => "WMH", # Manhole Water
 "MSC" => "STRU", # Misc - added v6
 "MTE" => "EM", # Meter - Electric
 "MTG" => "GM", # Meter - Gas
 "MTW" => "WM", # Meter Water
 "MWL" => "INSP", # Monitoring/Inspection Well
 "NPS" => "STR", # No passing line
 "PAA" => "EP", # Patio Edge - Aggregate/Gravel
 "PAB" => "EP", # Patio Edge - HMA
 "PAC" => "EP", # Patio Edge - Concrete
 "PAN" => "EP", # Patio Edge - Stone
 "PAR" => "EP", # Patio Edge - Brick
 "PBB" => "GS", # A spot elevation on a bit bridge deck.
 "PBC" => "GS", # A spot elevation on a conc bridge deck.
 "PDE" => "EPED", # Pedestal Electric
 "PDF" => "TPED", # Pedestal Fiber Optic
 "PDT" => "TPED",
 "PDV" => "CPED",
 "PHB" => "TBTH", # Phone Booth
 "PLF" => "FLAG",
 "PLT" => "OSTLT",
 "PMA" => "GS", # Pavement Spot- Aggregate
 "PMB" => "GS", # Pavement Spot- Bituminous
 "PMC" => "GS", # Pavement Spot- Concrete
 "PMR" => "GS", # Pavement Spot- Brick
 "PMT" => "GS", # Pavement
 "PPL" => "PPL", # Power Pole with Light added v6
 "PPT" => "PPT", # Power Pole with Transformer
 "PPU" => "PP",
 "PRK" => "PM", # Parking Meter
 "PUG" => "684", # Pump - Gas
 "PUW" => "PUMP", # Pump - Water
 "RCK" => "RIP", # Rock or Boulder
 "RCL" => "RR", # Railroad Centerline
 "RDR" => "464", # Railroad Derailer
 "RGG" => "GR", # Regulator - Gas
 "RIP" => "RIP", # Riprap
 "RMP" => "461", # RR Mile Post
 #"RNW" => "376",
 "RPB" => "STR", # Ramp - HMA
 "RPC" => "STR", # Ramp - Concrete
 "RPN" => "STR", # Ramp - Stone
 "RPR" => "STR", # Ramp - Brick
 "RPS" => "STR", # Ramp - Steel
 "RPT" => "STR", # Ramp - Wood
 "ROW" => "ROW",
 "RRC" => "458", # RR Signal Cabinet
 "RRF" => "463", # RR Point of Frog - 1" point
 "RRG" => "RRGT", # RR Crossing Gate
 "RRH" => "455", # RR Switch Heater
 "RRM" => "461", # RR Mile Post
 "RRP" => "456", # RR Semaphore
 "RRR" => "451", # RR Top of Rail
 "RRS" => "462", # RR Point of Switch
 "RRT" => "RRTIE", # RR Tie/Sleeper
 "RRW" => "455", # RR Switch Box
 "RSE" => "RISER", # Riser - Electricial
 "RSF" => "RISER", # Riser - Fiber optic
 "RSG" => "RISER", # Riser - Gas
 "RSM" => "RISER", # Riser - Storm
 "RSN" => "RISER", # Riser - Sanitary
 "RSR" => "RISER", # Riser - Traffic 
 "RSS" => "RISER", # Riser - Traffic Fiber Optic
 "RST" => "RISER", # Riser - Telephone
 "RSV" => "RISER", # Riser - TV
 "RSW" => "RISER", # Riser - Water
 "RVT" => "REV", # Revetment Mat
 "RWC" => "RW", # Retaining Wall - Concrete
 "RWL" => "RW", # Retaining Wall
 "RWN" => "RW", # Retaining Wall - Stone
 "RWM" => "RW", # Retaining Wall - Masonry
 "RWR" => "RW", # Retaining Wall - Brick
 "RWS" => "RW", # Retaining Wall - Steel
 "RWT" => "RW", # Retaining Wall - Timber
 "SBE" => "EBOX",
 "SBF" => "FB", # Slice Box - Fiber Optic
 "SBR" => "TSCONT", # Traffic Signal Controller - changed v6
 "SBT" => "TBOX", # SPLICE BOX TELEPHONE
 "SBV" => "281", # SPLICE BOX TELEVISION
 "SBW" => "SPRB", # Splice Box for Sprinkler System
 "SHA" => "ES", # Shoulder - Aggregate
 "SHB" => "ES", # Shoulder - Bituminous
 "SHC" => "ES", # Shoulder - Concrete
 "SLA" => "EP", # Slab - Aggregate/Gravel
 "SLB" => "EP", # Slab - HMA/Bit
 "SLC" => "EP", # Slab - Concrete
 "SLN" => "EP", # Slab - Stone
 "SLR" => "EP", # Slab - Brick
 "SNC" => "PSGN", # Sign - Commercial
 "SNE" => "UWS",
 "SNF" => "UWS",
 "SNG" => "UWS",
 "SNN" => "UWS", # Warning Sign - Sanitary
 "SNL" => "UWS",
 "SNP" => "UWS",
 "SNR" => "TSGN", # Sign - Traffic
 "SNT" => "UWS",
 "SNV" => "UWS",
 "SNW" => "UWS", # Warning Sign - Water
# "SPC" => "699", # Special / Misc.
 "SPA" => "MON", # Traverse Point
 "SPB" => "MON", # Axle
 "SPC" => "MON108", # Cut Cross
 "SPD" => "MON", # Concrete Monument
 "SPE" => "MON100", # Crimp Pipe
 "SPF" => "BM", # Benchmark
 "SPG" => "MON", # GPS Monument
 "SPH" => "MON", # Control Point
 "SPI" => "IP", # Iron Pipe
 "SPJ" => "MON", # Nail
 "SPK" => "MON", # Nail & Washer/Shiner
 "SPL" => "MON106", # PK Nail
 "SPM" => "MON106", # Mag Nail
 "SPN" => "ROW", # ROW Marker
 "SPO" => "MON103", # RR Spike
 "SPP" => "MON107", # Pole Barn Spike
 "SPQ" => "MON", # Stone
 "SPR" => "MON", # Cotton Picker Spindle
 "SPS" => "MON", # Hub
 "SPT" => "MON", # Cut Square
 "SPU" => "MON110", # Rebar 
 "SPV" => "MON", # Drill Hole
 "SPW" => "MON", # Brass Marker
 "SPX" => "MON101", # Iron Rod/Pin
 "SPY" => "MON104", # Traverse Point
 "SPZ" => "MON", # Survey Point
 "STR" => "STEP", # Stairs/Porch
 "SWK" => "SW",
 "SWA" => "SW", # SIDEWALK - AGG
 "SWB" => "SW", # SIDEWALK - BIT/HMA
 "SWC" => "SW", # SIDEWALK - CONC
 "SWR" => "SW", # SIDEWALK - BRICK
 #"TOB" => "881", # Top of Bank
 "TIL" => "DL", # Tile
 "TNG" => "TANK", # Gas Tank
 "TNP" => "TANK", # Oil Tank
 "TOE" => "TOE", # Toe of Slope
 "TOP" => "TB", # Top of Slope
 "TRC" => "CTR",
 "TRD" => "DTR",
 "TRE" => "TRAN", # Transformer
 "TRF" => "TSP1", # Traffic Signal
 "TRL" => "DL", # Traffic Signal Loop Detector
 "THW" => "FLD",
 "TWR" => "TT", # Transmission Tower
 "UND" => "CULV", # Underdrain
 "VLB" => "VALVE", # Valve Box
 "VLG" => "GV", # Gas Valve
 "VLE" => "VALVE",
 "VLN" => "VALVE", # Valve for sanitary force main
 "VLW" => "WV", # Water Valve By Hydrant
 "VNG" => "GVP", # Gas Vent Pipe
 "VNT" => "VENT",
 "VNN" => "354",
 "WAC" => "BLDG", # Wall - not retaining - Concrete
 "WAF" => "BLDG", # Wall - not retaining - Frame
 "WAL" => "BLDG", # Wall
 "WAN" => "BLDG", # Wall - not retaining - Stone/Rock
 "WAM" => "BLDG", # Wall - not retaining - Masonry
 "WAR" => "BLDG", # Wall - not retaining - Brick
 "WAS" => "BLDG", # Wall - not retaining - Steel
 "WAT" => "BLDG", # Wall - not retaining - Timber
 "WDE" => "HDG",
 "WEL" => "WELL", # Well
 "WET" => "WET",
 "WTR" => "W",
# IDOT Codes Flow Through without change to code  ##################
 "100" => "100",
 "101" => "101",
 "102" => "102",
 "103" => "103",
 "104" => "104",
 "105" => "105",
 "106" => "106",
 "107" => "107",
 "108" => "108",
 "109" => "109",
 "110" => "110",
 "111" => "111",
 "112" => "112",
 "113" => "113",
 "114" => "114",
 "115" => "115",
 "116" => "116",
 "117" => "117",
 "118" => "118",
 "119" => "119",
 "120" => "120",
 "121" => "121",
 "122" => "122",
 "123" => "123",
 "124" => "124",
 "125" => "125",
 "126" => "126",
 "127" => "127",
 "128" => "128",
 "129" => "129",
 "130" => "130",
 "131" => "131",
 "132" => "132",
 "133" => "133",
 "134" => "134",
 "135" => "135",
 "136" => "136",
 "137" => "137",
 "138" => "138",
 "139" => "139",
 "140" => "140",
 "141" => "141",
 "142" => "142",
 "143" => "143",
 "144" => "144",
 "145" => "145",
 "146" => "146",
 "147" => "147",
 "148" => "148",
 "149" => "149",
 "150" => "150",
 "151" => "151",
 "152" => "152",
 "153" => "153",
 "154" => "154",
 "155" => "155",
 "156" => "156",
 "157" => "157",
 "158" => "158",
 "159" => "159",
 "160" => "160",
 "161" => "161",
 "162" => "162",
 "163" => "163",
 "164" => "164",
 "165" => "165",
 "166" => "166",
 "167" => "167",
 "168" => "168",
 "169" => "169",
 "170" => "170",
 "171" => "171",
 "172" => "172",
 "173" => "173",
 "174" => "174",
 "175" => "175",
 "176" => "176",
 "177" => "177",
 "178" => "178",
 "179" => "179",
 "180" => "180",
 "181" => "181",
 "182" => "182",
 "183" => "183",
 "184" => "184",
 "185" => "185",
 "186" => "186",
 "187" => "187",
 "188" => "188",
 "189" => "189",
 "190" => "190",
 "191" => "191",
 "192" => "192",
 "193" => "193",
 "194" => "194",
 "195" => "195",
 "196" => "196",
 "197" => "197",
 "198" => "198",
 "199" => "199",
 "200" => "200",
 "201" => "201",
 "202" => "202",
 "203" => "203",
 "204" => "204",
 "205" => "205",
 "206" => "206",
 "207" => "207",
 "208" => "208",
 "209" => "209",
 "210" => "210",
 "211" => "211",
 "212" => "212",
 "213" => "213",
 "214" => "214",
 "215" => "215",
 "216" => "216",
 "217" => "217",
 "218" => "218",
 "219" => "219",
 "220" => "220",
 "221" => "221",
 "222" => "222",
 "223" => "223",
 "224" => "224",
 "225" => "225",
 "226" => "226",
 "227" => "227",
 "228" => "228",
 "229" => "229",
 "230" => "230",
 "231" => "231",
 "232" => "232",
 "233" => "233",
 "234" => "234",
 "235" => "235",
 "236" => "236",
 "237" => "237",
 "238" => "238",
 "239" => "239",
 "240" => "240",
 "241" => "241",
 "242" => "242",
 "243" => "243",
 "244" => "244",
 "245" => "245",
 "246" => "246",
 "247" => "247",
 "248" => "248",
 "249" => "249",
 "250" => "250",
 "251" => "251",
 "252" => "252",
 "253" => "253",
 "254" => "254",
 "255" => "255",
 "256" => "256",
 "257" => "257",
 "258" => "258",
 "259" => "259",
 "260" => "260",
 "261" => "261",
 "262" => "262",
 "263" => "263",
 "264" => "264",
 "265" => "265",
 "266" => "266",
 "267" => "267",
 "268" => "268",
 "269" => "269",
 "270" => "270",
 "271" => "271",
 "272" => "272",
 "273" => "273",
 "274" => "274",
 "275" => "275",
 "276" => "276",
 "277" => "277",
 "278" => "278",
 "279" => "279",
 "280" => "280",
 "281" => "281",
 "282" => "282",
 "283" => "283",
 "284" => "284",
 "285" => "285",
 "286" => "286",
 "287" => "287",
 "288" => "288",
 "289" => "289",
 "290" => "290",
 "291" => "291",
 "292" => "292",
 "293" => "293",
 "294" => "294",
 "295" => "295",
 "296" => "296",
 "297" => "297",
 "298" => "298",
 "299" => "299",
 "300" => "300",
 "301" => "301",
 "302" => "302",
 "303" => "303",
 "304" => "304",
 "305" => "305",
 "306" => "306",
 "307" => "307",
 "308" => "308",
 "309" => "309",
 "310" => "310",
 "311" => "311",
 "312" => "312",
 "313" => "313",
 "314" => "314",
 "315" => "315",
 "316" => "316",
 "317" => "317",
 "318" => "318",
 "319" => "319",
 "320" => "320",
 "321" => "321",
 "322" => "322",
 "323" => "323",
 "324" => "324",
 "325" => "325",
 "326" => "326",
 "327" => "327",
 "328" => "328",
 "329" => "329",
 "330" => "330",
 "331" => "331",
 "332" => "332",
 "333" => "333",
 "334" => "334",
 "335" => "335",
 "336" => "336",
 "337" => "337",
 "338" => "338",
 "339" => "339",
 "340" => "340",
 "341" => "341",
 "342" => "342",
 "343" => "343",
 "344" => "344",
 "345" => "345",
 "346" => "346",
 "347" => "347",
 "348" => "348",
 "349" => "349",
 "350" => "350",
 "351" => "351",
 "352" => "352",
 "353" => "353",
 "354" => "354",
 "355" => "355",
 "356" => "356",
 "357" => "357",
 "358" => "358",
 "359" => "359",
 "360" => "360",
 "361" => "361",
 "362" => "362",
 "363" => "363",
 "364" => "364",
 "365" => "365",
 "366" => "366",
 "367" => "367",
 "368" => "368",
 "369" => "369",
 "370" => "370",
 "371" => "371",
 "372" => "372",
 "373" => "373",
 "374" => "374",
 "375" => "375",
 "376" => "376",
 "377" => "377",
 "378" => "378",
 "379" => "379",
 "380" => "380",
 "381" => "381",
 "382" => "382",
 "383" => "383",
 "384" => "384",
 "385" => "385",
 "386" => "386",
 "387" => "387",
 "388" => "388",
 "389" => "389",
 "390" => "390",
 "391" => "391",
 "392" => "392",
 "393" => "393",
 "394" => "394",
 "395" => "395",
 "396" => "396",
 "397" => "397",
 "398" => "398",
 "399" => "399",
 "400" => "400",
 "401" => "401",
 "402" => "402",
 "403" => "403",
 "404" => "404",
 "405" => "405",
 "406" => "406",
 "407" => "407",
 "408" => "408",
 "409" => "409",
 "410" => "410",
 "411" => "411",
 "412" => "412",
 "413" => "413",
 "414" => "414",
 "415" => "415",
 "416" => "416",
 "417" => "417",
 "418" => "418",
 "419" => "419",
 "420" => "420",
 "421" => "421",
 "422" => "422",
 "423" => "423",
 "424" => "424",
 "425" => "425",
 "426" => "426",
 "427" => "427",
 "428" => "428",
 "429" => "429",
 "430" => "430",
 "431" => "431",
 "432" => "432",
 "433" => "433",
 "434" => "434",
 "435" => "435",
 "436" => "436",
 "437" => "437",
 "438" => "438",
 "439" => "439",
 "440" => "440",
 "441" => "441",
 "442" => "442",
 "443" => "443",
 "444" => "444",
 "445" => "445",
 "446" => "446",
 "447" => "447",
 "448" => "448",
 "449" => "449",
 "450" => "450",
 "451" => "451",
 "452" => "452",
 "453" => "453",
 "454" => "454",
 "455" => "455",
 "456" => "456",
 "457" => "457",
 "458" => "458",
 "459" => "459",
 "460" => "460",
 "461" => "461",
 "462" => "462",
 "463" => "463",
 "464" => "464",
 "465" => "465",
 "466" => "466",
 "467" => "467",
 "468" => "468",
 "469" => "469",
 "470" => "470",
 "471" => "471",
 "472" => "472",
 "473" => "473",
 "474" => "474",
 "475" => "475",
 "476" => "476",
 "477" => "477",
 "478" => "478",
 "479" => "479",
 "480" => "480",
 "481" => "481",
 "482" => "482",
 "483" => "483",
 "484" => "484",
 "485" => "485",
 "486" => "486",
 "487" => "487",
 "488" => "488",
 "489" => "489",
 "490" => "490",
 "491" => "491",
 "492" => "492",
 "493" => "493",
 "494" => "494",
 "495" => "495",
 "496" => "496",
 "497" => "497",
 "498" => "498",
 "499" => "499",
 "500" => "500",
 "501" => "501",
 "502" => "502",
 "503" => "503",
 "504" => "504",
 "505" => "505",
 "506" => "506",
 "507" => "507",
 "508" => "508",
 "509" => "509",
 "510" => "510",
 "511" => "511",
 "512" => "512",
 "513" => "513",
 "514" => "514",
 "515" => "515",
 "516" => "516",
 "517" => "517",
 "518" => "518",
 "519" => "519",
 "520" => "520",
 "521" => "521",
 "522" => "522",
 "523" => "523",
 "524" => "524",
 "525" => "525",
 "526" => "526",
 "527" => "527",
 "528" => "528",
 "529" => "529",
 "530" => "530",
 "531" => "531",
 "532" => "532",
 "533" => "533",
 "534" => "534",
 "535" => "535",
 "536" => "536",
 "537" => "537",
 "538" => "538",
 "539" => "539",
 "540" => "540",
 "541" => "541",
 "542" => "542",
 "543" => "543",
 "544" => "544",
 "545" => "545",
 "546" => "546",
 "547" => "547",
 "548" => "548",
 "549" => "549",
 "550" => "550",
 "551" => "551",
 "552" => "552",
 "553" => "553",
 "554" => "554",
 "555" => "555",
 "556" => "556",
 "557" => "557",
 "558" => "558",
 "559" => "559",
 "560" => "560",
 "561" => "561",
 "562" => "562",
 "563" => "563",
 "564" => "564",
 "565" => "565",
 "566" => "566",
 "567" => "567",
 "568" => "568",
 "569" => "569",
 "570" => "570",
 "571" => "571",
 "572" => "572",
 "573" => "573",
 "574" => "574",
 "575" => "575",
 "576" => "576",
 "577" => "577",
 "578" => "578",
 "579" => "579",
 "580" => "580",
 "581" => "581",
 "582" => "582",
 "583" => "583",
 "584" => "584",
 "585" => "585",
 "586" => "586",
 "587" => "587",
 "588" => "588",
 "589" => "589",
 "590" => "590",
 "591" => "591",
 "592" => "592",
 "593" => "593",
 "594" => "594",
 "595" => "595",
 "596" => "596",
 "597" => "597",
 "598" => "598",
 "599" => "599",
 "600" => "600",
 "601" => "601",
 "602" => "602",
 "603" => "603",
 "604" => "604",
 "605" => "605",
 "606" => "606",
 "607" => "607",
 "608" => "608",
 "609" => "609",
 "610" => "610",
 "611" => "611",
 "612" => "612",
 "613" => "613",
 "614" => "614",
 "615" => "615",
 "616" => "616",
 "617" => "617",
 "618" => "618",
 "619" => "619",
 "620" => "620",
 "621" => "621",
 "622" => "622",
 "623" => "623",
 "624" => "624",
 "625" => "625",
 "626" => "626",
 "627" => "627",
 "628" => "628",
 "629" => "629",
 "630" => "630",
 "631" => "631",
 "632" => "632",
 "633" => "633",
 "634" => "634",
 "635" => "635",
 "636" => "636",
 "637" => "637",
 "638" => "638",
 "639" => "639",
 "640" => "640",
 "641" => "641",
 "642" => "642",
 "643" => "643",
 "644" => "644",
 "645" => "645",
 "646" => "646",
 "647" => "647",
 "648" => "648",
 "649" => "649",
 "650" => "650",
 "651" => "651",
 "652" => "652",
 "653" => "653",
 "654" => "654",
 "655" => "655",
 "656" => "656",
 "657" => "657",
 "658" => "658",
 "659" => "659",
 "660" => "660",
 "661" => "661",
 "662" => "662",
 "663" => "663",
 "664" => "664",
 "665" => "665",
 "666" => "666",
 "667" => "667",
 "668" => "668",
 "669" => "669",
 "670" => "670",
 "671" => "671",
 "672" => "672",
 "673" => "673",
 "674" => "674",
 "675" => "675",
 "676" => "676",
 "677" => "677",
 "678" => "678",
 "679" => "679",
 "680" => "680",
 "681" => "681",
 "682" => "682",
 "683" => "683",
 "684" => "684",
 "685" => "685",
 "686" => "686",
 "687" => "687",
 "688" => "688",
 "689" => "689",
 "690" => "690",
 "691" => "691",
 "692" => "692",
 "693" => "693",
 "694" => "694",
 "695" => "695",
 "696" => "696",
 "697" => "697",
 "698" => "698",
 "699" => "699",
 "700" => "700",
 "701" => "701",
 "702" => "702",
 "703" => "703",
 "704" => "704",
 "705" => "705",
 "706" => "706",
 "707" => "707",
 "708" => "708",
 "709" => "709",
 "710" => "710",
 "711" => "711",
 "712" => "712",
 "713" => "713",
 "714" => "714",
 "715" => "715",
 "716" => "716",
 "717" => "717",
 "718" => "718",
 "719" => "719",
 "720" => "720",
 "721" => "721",
 "722" => "722",
 "723" => "723",
 "724" => "724",
 "725" => "725",
 "726" => "726",
 "727" => "727",
 "728" => "728",
 "729" => "729",
 "730" => "730",
 "731" => "731",
 "732" => "732",
 "733" => "733",
 "734" => "734",
 "735" => "735",
 "736" => "736",
 "737" => "737",
 "738" => "738",
 "739" => "739",
 "740" => "740",
 "741" => "741",
 "742" => "742",
 "743" => "743",
 "744" => "744",
 "745" => "745",
 "746" => "746",
 "747" => "747",
 "748" => "748",
 "749" => "749",
 "750" => "750",
 "751" => "751",
 "752" => "752",
 "753" => "753",
 "754" => "754",
 "755" => "755",
 "756" => "756",
 "757" => "757",
 "758" => "758",
 "759" => "759",
 "760" => "760",
 "761" => "761",
 "762" => "762",
 "763" => "763",
 "764" => "764",
 "765" => "765",
 "766" => "766",
 "767" => "767",
 "768" => "768",
 "769" => "769",
 "770" => "770",
 "771" => "771",
 "772" => "772",
 "773" => "773",
 "774" => "774",
 "775" => "775",
 "776" => "776",
 "777" => "777",
 "778" => "778",
 "779" => "779",
 "780" => "780",
 "781" => "781",
 "782" => "782",
 "783" => "783",
 "784" => "784",
 "785" => "785",
 "786" => "786",
 "787" => "787",
 "788" => "788",
 "789" => "789",
 "790" => "790",
 "791" => "791",
 "792" => "792",
 "793" => "793",
 "794" => "794",
 "795" => "795",
 "796" => "796",
 "797" => "797",
 "798" => "798",
 "799" => "799",
 "800" => "800",
 "801" => "801",
 "802" => "802",
 "803" => "803",
 "804" => "804",
 "805" => "805",
 "806" => "806",
 "807" => "807",
 "808" => "808",
 "809" => "809",
 "810" => "810",
 "811" => "811",
 "812" => "812",
 "813" => "813",
 "814" => "814",
 "815" => "815",
 "816" => "816",
 "817" => "817",
 "818" => "818",
 "819" => "819",
 "820" => "820",
 "821" => "821",
 "822" => "822",
 "823" => "823",
 "824" => "824",
 "825" => "825",
 "826" => "826",
 "827" => "827",
 "828" => "828",
 "829" => "829",
 "830" => "830",
 "831" => "831",
 "832" => "832",
 "833" => "833",
 "834" => "834",
 "835" => "835",
 "836" => "836",
 "837" => "837",
 "838" => "838",
 "839" => "839",
 "840" => "840",
 "841" => "841",
 "842" => "842",
 "843" => "843",
 "844" => "844",
 "845" => "845",
 "846" => "846",
 "847" => "847",
 "848" => "848",
 "849" => "849",
 "850" => "850",
 "851" => "851",
 "852" => "852",
 "853" => "853",
 "854" => "854",
 "855" => "855",
 "856" => "856",
 "857" => "857",
 "858" => "858",
 "859" => "859",
 "860" => "860",
 "861" => "861",
 "862" => "862",
 "863" => "863",
 "864" => "864",
 "865" => "865",
 "866" => "866",
 "867" => "867",
 "868" => "868",
 "869" => "869",
 "870" => "870",
 "871" => "871",
 "872" => "872",
 "873" => "873",
 "874" => "874",
 "875" => "875",
 "876" => "876",
 "877" => "877",
 "878" => "878",
 "879" => "879",
 "880" => "880",
 "881" => "881",
 "882" => "882",
 "883" => "883",
 "884" => "884",
 "885" => "885",
 "886" => "886",
 "887" => "887",
 "888" => "888",
 "889" => "889",
 "890" => "890",
 "891" => "891",
 "892" => "892",
 "893" => "893",
 "894" => "894",
 "895" => "895",
 "896" => "896",
 "897" => "897",
 "898" => "898",
 "899" => "899",
 "900" => "900",
 "901" => "901",
 "902" => "902",
 "903" => "903",
 "904" => "904",
 "905" => "905",
 "906" => "906",
 "907" => "907",
 "908" => "908",
 "909" => "909",
 "910" => "910",
 "911" => "911",
 "912" => "912",
 "913" => "913",
 "914" => "914",
 "915" => "915",
 "916" => "916",
 "917" => "917",
 "918" => "918",
 "919" => "919",
 "920" => "920",
 "921" => "921",
 "922" => "922",
 "923" => "923",
 "924" => "924",
 "925" => "925",
 "926" => "926",
 "927" => "927",
 "928" => "928",
 "929" => "929",
 "930" => "930",
 "931" => "931",
 "932" => "932",
 "933" => "933",
 "934" => "934",
 "935" => "935",
 "936" => "936",
 "937" => "937",
 "938" => "938",
 "939" => "939",
 "940" => "940",
 "941" => "941",
 "942" => "942",
 "943" => "943",
 "944" => "944",
 "945" => "945",
 "946" => "946",
 "947" => "947",
 "948" => "948",
 "949" => "949",
 "950" => "950",
 "951" => "951",
 "952" => "952",
 "953" => "953",
 "954" => "954",
 "955" => "955",
 "956" => "956",
 "957" => "957",
 "958" => "958",
 "959" => "959",
 "960" => "960",
 "961" => "961",
 "962" => "962",
 "963" => "963",
 "964" => "964",
 "965" => "965",
 "966" => "966",
 "967" => "967",
 "968" => "968",
 "969" => "969",
 "970" => "970",
 "971" => "971",
 "972" => "972",
 "973" => "973",
 "974" => "974",
 "975" => "975",
 "976" => "976",
 "977" => "977",
 "978" => "978",
 "979" => "979",
 "980" => "980",
 "981" => "981",
 "982" => "982",
 "983" => "983",
 "984" => "984",
 "985" => "985",
 "986" => "986",
 "987" => "987",
 "988" => "988",
 "989" => "989",
 "990" => "990",
 "991" => "991",
 "992" => "992",
 "993" => "993",
 "994" => "994",
 "995" => "995",
 "996" => "996",
 "997" => "997",
 "998" => "998",
 "999" => "999"
);
###############################################################################################3
%idotcommands = (
 "(" => "+", # Begin Line
 ")" => ".", # End Line
);
####################################################################################################
#########################################################################################################
#####################
# Some Global Vars
$figname="";
$curPtNum="";
$lastPtNum="";
$lastFigname="";
%activeStrings=();
$curIsString=0;
$lastWasString=0;
$comment=""; #lv added
$Icode=""; #lv added (Process01)
$hold = "";
$noLineCounter=1;
# ====================================================================================================
#                                             Start of Main Program
# ====================================================================================================
#                                             Syntax - process ARG1
if ($#ARGV<0)
  {
    print q{
===================================================================================
|                                                                                 |
|                         Process script requires file name                       |
|                                                                                 |
|                            Syntax:  process filename                            |
|                                                                                 |
===================================================================================
  };
    exit;
  }
$filename=$ARGV[0];
$filename =~ s/\.[^.]*$//;
open(IN,$ARGV[0]);
open(OUT1,">${filename}_all.cor");
open(OUT2,">${filename}_bridge.cor");
open(OUT3,">${filename}_ptln.cor");
open(OUT4,">${filename}_cell.cor");
# }
while (<IN>) {
 $curIsString=0;
 @in = split(/,/, substr(uc, 0, -1), 5); #note: the substr forces text to be uppercase; the split creates:
   #$in[0] = point number
   #$in[1] = northing
   #$in[2] = easting
   #$in[3] = elevation
   #$in[4] = full description (3 Letter Code-Line Number-Line Code-Comment)
 my @fsplit = split(/\s+/,$in[4],2); #added lv - this separates the Codes from the Comments
   #using the first whitespace as the separator so:
   #$fsplit[0] = 3 Letter Code-Line Number-Line Code
   #$fsplit[1] = the Comment
 my @ssplit = ($fsplit[0] =~ /(\w+)*(\W*)/); #added lv - this separtes the 3 Letter Code and
   # line number from the line coding symbol
   # \w is alpha or numeric - \W is non alpha or numeric:
   # $ssplit[0] = the 3 Letter Code and Line Number
   # $ssplit[1] = the Line Code
 $tok[0] = $ssplit[1]; #added lv:
   # $tok[0} = the Line Code
 $tok[1] = "$ssplit[0] $fsplit[1]"; #added lv:
   # $tok[1] = the code and the comment, no line code
 my @csplit = ($ssplit[0] =~ /(\w\w\w)(\d*)/); # this is for QAQC
   # $csplit[0] = 3 letter code
   # $csplit[1] = line number
 if (length($fsplit[1])>0) {##############lv
  $fsplit[1]="\/$fsplit[1]"; ########lv - adds the semi-colon before the Comment
 }
 $Icode=$pointCodes{$csplit[0]}; ## if the three letter code matches any of the codes

##############Test Section
#print OUT1 "alksdf;alkdj   $pointCodes{$csplit[0]}\n";
#print OUT5 "\n\n\n\in[0] point number      = $in[0]\n";
#print OUT5 "in[4] full code & comment      = $in[4]\n";
#print OUT5 "fsplit[0] full code no comment = $fsplit[0]\n";
#print OUT5 "fsplit[1] comment              = $fsplit[1]\n";
#print OUT5 "ssplit[0] code and line no.    = $ssplit[0]\n";
#print OUT5 "ssplit[1] line code            = $ssplit[1]\n";
#print OUT5 "tok[0] line code               = $tok[0]\n";
#print OUT5 "tok[1] code, line no., comment = $tok[1]\n";
#print OUT5 "csplit[0] alpha code           = $csplit[0]\n";
#print OUT5 "csplit[1] line number          = $csplit[1]\n";
#print OUT5 "hold                           = $hold\n";
#print OUT5 "c linecode                     = $c\n";
#print OUT5 "Icode idot code, line no.      = $Icode\n\n";
        #####################
        #Material type prefix
        if  (exists ($typePrefix{$csplit[0]})) {
          $prefix = $typePrefix{$csplit[0]};
          $csplit[1] = "$prefix$csplit[1]";
 }
 #
 ########################################Begin sorting and printing
 #################################################
   if(($csplit[0] eq 'TRC') || ( $csplit[0] eq 'TRD'))
     {
     $fsplit[1] =~ s/\D//g;
     print OUT1 "$in[0],$in[1],$in[2],$in[3],$Icode$fsplit[1]$c\n";
     }
   elsif ($c = $idotcommands{$tok[0]})
     {
     print OUT1 "$in[0],$in[1],$in[2],$in[3],$Icode$csplit[1]$c\n";
     }
   else
     {
     print OUT1 "$in[0],$in[1],$in[2],$in[3],$Icode$csplit[1]$fsplit[1]\n";
     }
   }





####################### TEST SECTION
#print OUT5 "in[0] point number             = $in[0]\n";
#print OUT5 "in[1] northing                 = $in[1]\n";
#print OUT5 "in[2] easting                  = $in[2]\n";
#print OUT5 "in[3] elevation                = $in[3]\n";
#print OUT5 "in[4] full code & comment      = $in[4]\n";
#print OUT5 "fsplit[0] full code no comment = $fsplit[0]\n";
#print OUT5 "fsplit[1] comment              = $fsplit[1]\n";
#print OUT5 "ssplit[0] code and line no.    = $ssplit[0]\n";
#print OUT5 "ssplit[1] line code            = $ssplit[1]\n";
#print OUT5 "tok[0] line code               = $tok[0]\n";
#print OUT5 "tok[1] code, line no., comment = $tok[1]\n";
#print OUT5 "csplit[0] alpha code           = $csplit[0]\n";
#print OUT5 "csplit[1] line number          = $csplit[1]\n";
#print OUT1 "hold                           = $hold\n";
#print OUT5 "c linecode                     = $c\n";
#print OUT5 "Icode idot code, line no.      = $Icode\n\n\n\n\n";


 #prepare for next loop
 if ($curIsString) {
  $activeStrings{$figname}=1; #make sure the list contains an entry for this string
 }
 $lastWasString=$curIsString;
 $lastFigname=$figname;
 $lastPtNum=$in[0];
 $figname="";
 $comment="";  #### added lv
 $Icode="";
 $prefix="";


 $fsplit[0]="";
 $fsplit[1]="";
 $ssplit[0]="";
 $ssplit[1]="";
 $tok[0]="";
 $tok[1]="";
 $csplit[0]="";
 $csplit[1]="";



close(IN);
close(OUT1);
close(OUT2);
close(OUT3);
close(OUT4);
close(OUT5);
close(OUT6);
