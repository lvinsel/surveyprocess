use strict;
use warnings;
#################################
my %legalCodes = (
 "ACU" => "legal", # Air Conditioning Unit
 "AEM" => "legal", # Electric Above Ground Main - Center of Tower
 "B62" => "legal", # B6-24 Curb - added v6 - depreciated
 "B6B" => "legal", # B6-12 Top Back Curb - depreciated
 "B6F" => "legal", # added back v18 - depreciated
 "BAB" => "legal", # The outline of the face,sides, and top of the abutment.  A 3d line.
 "BAL" => "legal", # The outline of the face of the abutment and the face of the
                   # Wingwalls.  A 2d line, usually collected prismless.
 "BAR" => "legal", # Stop Bar - Painted
 "BAS" => "legal", # Bridge Approach Slab
 "BBA" => "legal", # Bridge Deck - AGG
 "BBB" => "legal", # Bridge Deck - BIT/HMA
 "BBC" => "legal", # Bridge Deck - Concrete
 "BBG" => "legal", # Buffalo Box - Gas
 "BBR" => "legal", # Bridge Deck - Bridk
 "BBS" => "legal", # The bridge seat elevation.  For elevation only.  Usually collected
                   # with the "hook".
 "BBW" => "legal", # Buffalo Box - Water
 "BBU" => "legal", # Buffalo Box - Gas
 "BCB" => "legal", # The top front of any curb or median on a bridge.
 "BDB" => "legal", # The line of the bit bridge deck.  A 3d line.
 "BDC" => "legal", # The line of the conc bridge deck.  A 3d line.
 "BDP" => "legal", # Bridge Deck Plate
 "BDT" => "legal", # Bridge Deck Timber
 "BEX" => "legal", # The bridge expansion joint.  A 3d line.
 "BHR" => "legal", # Building# Bridge Handrail.  A 3D line.
 "BLD" => "legal", # Building
 "BLC" => "legal", # The bottom of the concrete bridge beams.  Usually taken at
                   # the beginning middle and end oof each span of the bridge beams.
                   # Usually only required on the outside (upstream and downstream) beams.
 "BLS" => "legal", # The bottom of the steel bridge beams.  Usually taken at
                   # the beginning middle and end oof each span of the bridge beams.
                   # Usually only required on the outside (upstream and downstream) beams.
 "BLT" => "legal", # The bottom of the timber bridge beams.  Usually taken at
                   # the beginning middle and end oof each span of the bridge beams.
                   # Usually only required on the outside (upstream and downstream) beams.
 "BOL" => "legal", # Bollard
 "BOR" => "legal", # Boring/Coring
 "BPA" => "legal", # The bridge parapet. A 3d line.
 "BPC" => "legal", # The outline of the face of the pier cap. A 2d line usually
                   # collected "prismless".
 "BPR" => "legal", # The outline of the face, sides and top of the pier cap.  A 3d line.
 "BPT" => "legal", # The pier cap elevation,  For elevation only.  Usually collected
                   # with the "hook".
 "BRK" => "legal", # Break Line
 "BRR" => "legal", # Barrier Wall - base
 "BSC" => "legal", # Bridge Scupper
 "BSH" => "legal", # Bush / Shrub
 "BSL" => "legal", # Bush line / Hedgerow
 "BSS" => "legal", # Bridge Structural Steel
 "BUC" => "legal", # Building - Commercial
 "BUP" => "legal", # Building - Public
 "BUR" => "legal", # Building - Residential
 "BWC" => "legal", # Bridge Deck Sidewalk Conc
 "BWL" => "legal", # The outline of the face and sides of the bridge back wall.  A 3d line.
 "BWW" => "legal", # The outline of the face and sides of the wingwall.  A 3d line with
                   # points at each elevation change.
 "CBM" => "legal", # Catch Basin - Round Open
 "CKH" => "legal", # Control Point Check - Horizontal
 "CKV" => "legal", # Control Point Check - Vertical
 "CLR" => "legal", # Centerline Railroad Track - depreciated
 "CNP" => "legal", # Canopy
 "CNT" => "legal", # Traffic Signal Cantelever/Mast Arm
 "CNA" => "legal", # Crown of roadway - Agg - use where there is no stripeing
 "CNB" => "legal", # Crown of roadway - HMA - use where there is no stripeing
 "CNC" => "legal", # Crown of roadway - CONC - use where there is no stripeing
 "CNR" => "legal", # Crown of roadway - BRICK - use where there is no stripeing
 "COL" => "legal", # Column
 "CPH" => "legal", # Control Point Horizontal
 "CRB" => "legal", # Curb - Top Back - Concrete - this was changed back after a brief period of confusion
 "CRN" => "legal", # Crown Line - this was changed back after a brief period of confusion
 "CRP" => "legal", # Crop Line
 "CRW" => "legal", # Crosswalk
 "CUB" => "legal", # Culvert - Box
 "CUE" => "legal", # Culvert - Elliptical
 "CUP" => "legal", # Culvert - Pipe
 "DAM" => "legal", # Levee/Dam Top
 "DCA" => "legal", # Driveway/Commercial Aggregate
 "DCB" => "legal", # Driveway/Commercial BIT/HMA
 "DCC" => "legal", # Driveway/Commercial Concrete
 "DCG" => "legal", # Driveway/Commercial Ground
 "DCK" => "legal", # Deck
 "DCR" => "legal", # Driveway/Commercial Brick
 "DFA" => "legal", # Driveway/Field Aggregate
 "DFB" => "legal", # Driveway/Field BIT/HMA
 "DFC" => "legal", # Driveway/Field Concrete
 "DFG" => "legal", # Driveway/Field Ground
 "DFR" => "legal", # Driveway/Field Brick
 "DPA" => "legal", # Driveway/Private-Residential Aggregate
 "DPB" => "legal", # Driveway/Private-Residential BIT/HMA
 "DPC" => "legal", # Driveway/Private-Residential Concrete
 "DPG" => "legal", # Driveway/Private-Residential Ground
 "DPR" => "legal", # Driveway/Private-Residential Brick
 "DRB" => "legal", # Driveway/Entrance HMA
 "DRV" => "legal", # Driveway/Entrance
 "DRA" => "legal", # Driveway/Entrance Aggregate
 "DRB" => "legal", # Driveway/Entrance HMA
 "DRC" => "legal", # Driveway/Entrance Concrete
 "DRG" => "legal", # Field Entrance
 "DRR" => "legal", # Driveway/Entrance Brick
 "DSP" => "legal", # Downspout
 "DTH" => "legal", # Ditch Flowline
 "DTP" => "legal", # Paved Ditch Centerline
 "EOA" => "legal", # Edge of Pavement - Aggregate
 "EOB" => "legal", # Edge of Pavement - BIT/HMA
 "EOC" => "legal", # Edge of Pavement - Concrete
 "EOL" => "legal", # Edge of Lanes - added v6
 "EOP" => "legal", # Edge of Pavement
 "EOR" => "legal", # Edge of Pavement - Brick
 "FES" => "legal", # Flared End Section
 "FFL" => "legal", # Finish Floor Elevation
 "FNC" => "legal", # Fence Line
 "FND" => "legal", # Found Survey Evidence
 "FNG" => "legal", # Fence Gate Post
 "FNI" => "legal", # Fence Line - Iron
 "FNL" => "legal", # Fence Line - Chain Link
 "FNT" => "legal", # Fence Line - Wood
 "FNV" => "legal", # Fence Line - Vinyl
 "FNW" => "legal", # Fence Line - Wire
 "FNX" => "legal", # Fence Line - Barbed Wire
 "FOU" => "legal", # Foundation
 "GCC" => "legal", # Building Commercial Concrete
 "GCF" => "legal", # Building Commercial Wood Frame
 "GCM" => "legal", # Building Commercial Masonry
 "GCR" => "legal", # Building Commercial Brick
 "GCS" => "legal", # Building Commercial Steel
 "GCT" => "legal", # Building Commercial Timber/Log
 "GND" => "legal", # Ground Shot
 "GPC" => "legal", # Building Public Concrete
 "GPF" => "legal", # Building Public Wood Frame
 "GPM" => "legal", # Building Public Masonry
 "GPR" => "legal", # Building Public Brick
 "GPS" => "legal", # Building Public Steel
 "GPT" => "legal", # Building Public Timber/Log
 "GRC" => "legal", # Building Residential Concrete
 "GRF" => "legal", # Building Residential Wood Frame
 "GRL" => "legal", # Guard Rail
 "GRM" => "legal", # Building Residential Masonry
 "GRR" => "legal", # Building Residential Brick
 "GRS" => "legal", # Building Residential Steel
 "GRT" => "legal", # Building Residential Timber/Log
 "GUP" => "legal", # Guy Pole
 "GUT" => "legal", # Gutter/Flowline
 "GUY" => "legal", # Guy Wire
 "H2O" => "legal", # Edge of Water
 "HHD" => "legal", # Handhole - Traffic Signal - Double
 "HHE" => "legal", # Handhole - Electric
 "HHF" => "legal", # Handhole - Fiber Optic
 "HHR" => "legal", # Handhole - Traffic
 "HHT" => "legal", # Handhole - Telephone
 "HHV" => "legal", # Handhole - TV
 "HWL" => "legal", # Headwall
 "HYD" => "legal", # Hydrant
 "INL" => "legal", # Inlet - Rectangular
 "JUE" => "legal", # QL-B Paint Mark Line - Electric
 "JUF" => "legal", # QL-B Paint Mark Line - Fiber Optic
 "JUG" => "legal", # QL-B Paint Mark Line - Gas
 "JUM" => "legal", # QL-B Paint Mark Line - Storm
 "JUN" => "legal", # QL-B Paint Mark Line - Sanitary
 "JUR" => "legal", # QL-B Paint Mark Line - Traffic Signal
 "JUS" => "legal", # QL-B Paint Mark Line - Traffic Signal Fiber Optic
 "JUT" => "legal", # QL-B Paint Mark Line - Telephone
 "JUV" => "legal", # QL-B Paint Mark Line - Television
 "JUW" => "legal", # QL-B Paint Mark Line - Water
 "LNB" => "legal", # Lane Line - BIT/HMA
 "LNC" => "legal", # Lane Line - Concrete
 "LND" => "legal", # Landscape Edge
 "LNM" => "legal", # Lane Paint Mark
 "MBX" => "legal", # Mailbox
 "MCS" => "legal", # Misc Concrete Slab
 "MED" => "legal", # Top Front of Median
 "MHE" => "legal", # Manhole Electrical
 "MHF" => "legal", # Manhole Fiber Optic
 "MHG" => "legal", # Manhole Gas
 "MHM" => "legal", # Mahhole Storm
 "MHN" => "legal", # Manhole Sanitary
 "MHT" => "legal", # Manhole Telephone/Communications
 "MHV" => "legal", # Manhole Cable TV
 "MHW" => "legal", # Manhole Water
 "MHS" => "legal", # Manhole Traffic Fiber Optic
 "MSC" => "legal", # Misc - added v6
 "MTE" => "legal", # Meter Electrical
 "MTG" => "legal", # Meter Gas
 "MTW" => "legal", # Meter Water
 "MWL" => "legal", # Monitoring/Inspection Well
 "NPS" => "legal", # No Pass Stripe
 "PAA" => "legal", # Patio Edge - Aggregate/Gravel
 "PAB" => "legal", # Patio Edge - Bit
 "PAC" => "legal", # Patio Edge - Conc
 "PAN" => "legal", # Patio Edge - Stone
 "PAR" => "legal", # Patio Edge - Brick
 "PBB" => "legal", # A spot elevation on a bit bridge deck
 "PBC" => "legal", # A spot elevation on a conc bridge deck
 "PDE" => "legal", # Pedestal Electric
 "PDF" => "legal", # Pedestal Fiber Optic
 "PDT" => "legal", # Pedestal Telephone/Communications
 "PDV" => "legal", # Pedestal Cable TV
 "PHB" => "legal", # Phone Booth
 "PLF" => "legal", # Flag Pole
 "PLT" => "legal", # Pole Light Only
 "PMA" => "legal", # Spot - Aggregate
 "PMB" => "legal", # Spot - HMA/BIT
 "PMC" => "legal", # Spot - Concrete
 "PMR" => "legal", # Spot - Brick
 "PMT" => "legal",
 "PPL" => "legal", # Pole Utility with Light
 "PPT" => "legal", # Pole Utility with Transformer
 "PPU" => "legal", # Pole Utility
 "PUG" => "legal", # Gas Pump
 "RCK" => "legal", # Rock or Boulder
 "PRK" => "legal", # Parking Meter
 "RCL" => "legal", # Railroad Centerline
 "RDR" => "legal", # RR Derailer
 "RGG" => "legal", # Regulator Gas
 "RIP" => "legal", # Rip Rap
 "ROW" => "legal", # ROW Monument
 "RPB" => "legal", # Ramp - Bit
 "RPC" => "legal", # Ramp - Conc
 "RPN" => "legal", # Ramp - Stone
 "RPR" => "legal", # Ramp - Brick
 "RPS" => "legal", # Ramp - Steel
 "RPT" => "legal", # Ramp - Wood
 "RRF" => "legal", # RR Point of Frog - 1" point
 "RRC" => "legal", # RR Signal Cabinet
 "RRG" => "legal", # RR Crossing Gate
 "RRH" => "legal", # RR Switch Heater
 "RRM" => "legal", # RR Mile Post
 "RRP" => "legal", # RR Semaphore
 "RRR" => "legal", # RR Rail - Top
 "RRS" => "legal", # RR Point of Switch take shot on side of switch box
 "RRT" => "legal", # RR Tie/Sleeper
 "RRW" => "legal", # RR Switch Box
 "RSE" => "legal", # Riser - Electricial
 "RSF" => "legal", # Riser - Fiber optic
 "RSG" => "legal", # Riser - Gas
 "RSM" => "legal", # Riser - Storm
 "RSN" => "legal", # Riser - Sanitary
 "RSR" => "legal", # Riser - Traffic
 "RSS" => "legal", # Riser - Traffic Fiber Optic
 "RST" => "legal", # Riser - Telephone
 "RSV" => "legal", # Riser - TV
 "RSW" => "legal", # Riser - Water
 "RVT" => "legal", # Revetment Mat
 "RWC" => "legal", # Retaining Wall - Concrete
 "RWL" => "legal", # Retaining Wall
 "RWN" => "legal", # Retaining Wall - Stone/Rock
 "RWM" => "legal", # Retaining Wall - Masonry
 "RWR" => "legal", # Retaining Wall - Brick
 "RWS" => "legal", # Retaining Wall - Steel
 "RWT" => "legal", # Retaining Wall - Timber
 "SBE" => "legal", # Splice Box - Electrical
 "SBF" => "legal", # Splice Box - Fiber Optic
 "SBR" => "legal", # Splice Box - Traffic Signals
 "SBT" => "legal", # Splice Box - Telephone
 "SBV" => "legal", # Splice Box - Television
 "SBW" => "legal", # Splice Box - Water Sprinkler
 "SHA" => "legal", # Shoulder - Aggregate
 "SHB" => "legal", # Shoulder - HMA/BIT
 "SHC" => "legal", # Shoulder - Concrete
 "SLA" => "legal", # Slab - Aggregate/Gravel
 "SLB" => "legal", # Slab - Bit
 "SLC" => "legal", # Slab  - Conc
 "SLN" => "legal", # Slab  - Stone
 "SLR" => "legal", # Slab  - Brick
 "SNC" => "legal", # Sign - Commercial
 "SNE" => "legal", # Sign - Warning - UG Electric
 "SNF" => "legal", # Sign - Warning - Fiber Optic
 "SNG" => "legal", # Sign - Warning - Gas
 "SNL" => "legal", # Sign - For Line Coding
 "SNN" => "legal", # Sign - Warning - Sanitary Line
 "SNP" => "legal", # Sign - Warning - Petroleum
 "SNR" => "legal", # Sign - Traffic
 "SNT" => "legal", # Sign - Warning - Telephone/Communications
 "SNV" => "legal", # Sign - Warning - Cable TV
 "SNW" => "legal", # Sign - Warning - Water line
 "SPA" => "legal", # Survey Point - Traverse Point
 "SPB" => "legal", # Survey Point - Axle
 "SPC" => "legal", # Survey Point - Cut Cross
 "SPD" => "legal", # Survey Point - Concrete Monument
 "SPE" => "legal", # Survey Point - Crimp Pipe
 "SPF" => "legal", # Survey Point - Benchmark
 "SPG" => "legal", # Survey Point - GPS Monument
 "SPH" => "legal", # Survey Point - Control Point
 "SPI" => "legal", # Survey Point - Iron Pipe
 "SPJ" => "legal", # Survey Point - Nail
 "SPK" => "legal", # Survey Point - Nail & Washer/Shiner
 "SPL" => "legal", # Survey Point - PK Nail
 "SPM" => "legal", # Survey Point - Mag Nail
 "SPN" => "legal", # Survey Point - ROW Marker
 "SPO" => "legal", # Survey Point - RR Spike
 "SPP" => "legal", # Survey Point - Pole Barn Spike
 "SPQ" => "legal", # Survey Point - Stone
 "SPR" => "legal", # Survey Point - Cotton Picker Spindle
 "SPS" => "legal", # Survey Point - Hub
 "SPT" => "legal", # Survey Point - Cut Square
 "SPU" => "legal", # Survey Point - Rebar
 "SPV" => "legal", # Survey Point - Drill Hole
 "SPW" => "legal", # Survey Point - Brass Marker
 "SPX" => "legal", # Survey Point - Iron Rod/Pin
 "SPY" => "legal", # Survey Point -
 "SPZ" => "legal", # Survey Point - Other
 "STR" => "legal", # Stairs/Porch
 "SWK" => "legal", # Sidewalk
 "SWA" => "legal", # Sidewalk - Agg
 "SWB" => "legal", # Sidewalk - HMA/BIT
 "SWC" => "legal", # Sidewalk - Conc
 "SWR" => "legal", # Sidewalk - Brick
 "TIL" => "legal", # Tile
 "TNG" => "legal", # Gas Tank
 "TNP" => "legal", # Oil Tank
 "TOE" => "legal", # Toe of Slope
 "TOP" => "legal", # Top of Slope
 "TRC" => "legal", # Tree - Coniferous
 "TRD" => "legal", # Tree - Deciduous
 "TRE" => "legal", # Transformer
 "TRF" => "legal", # Traffic Signal
 "TRL" => "legal", # Traffic Loop Detector
 "THW" => "legal", # Thalweg - Lowest Point
 "TWR" => "legal", # Transmission Tower
 "UND" => "legal", # Underdrain
 "VLB" => "legal", # Valve - Box
 "VLG" => "legal", # Valve - Gas
 "VLN" => "legal", # Valve - Sanitary
 "VLW" => "legal", # Valve - Water (By Hydrant)
 "VLE" => "legal", # Valve - Electric
 "VNG" => "legal", # Vent - Gas
 "VNT" => "legal", # Vent - Gas
 "VNN" => "legal", # Vent - Sanitary
 "WAC" => "legal", # Wall - Not Retaining -Concrete
 "WAF" => "legal", # Wall - Not Retaining -Frame
 "WAL" => "legal", # Wall - Not Retaining
 "WAN" => "legal", # Wall - Not Retaining -Stone/Rock
 "WAM" => "legal", # Wall - Not Retaining -Masonry
 "WAR" => "legal", # Wall - Not Retaining -Brick
 "WAS" => "legal", # Wall - Not Retaining -Steel
 "WAT" => "legal", # Wall - Not Retaining -Timber
 "WDE" => "legal", # Wooded Edge
 "WEL" => "legal", # Well
 "WET" => "legal", # Wetland
 "WTR" => "legal", # Water - Top Elevation
###
 "103" => "legal",
 "111" => "legal",
 "112" => "legal",
 "118" => "legal",
 "119" => "legal",
 "134" => "legal",
 "135" => "legal",
 "200" => "legal",
 "207" => "legal",
 "210" => "legal", # parcel corner ILI
 "213" => "legal",
 "220" => "legal",
 "222" => "legal",
 "223" => "legal",
 "224" => "legal",
 "225" => "legal",
 "226" => "legal",
 "252" => "legal",
 "253" => "legal",
 "254" => "legal",
 "255" => "legal",
 "265" => "legal",
 "274" => "legal",
 "275" => "legal",
 "279" => "legal", # crosswalk
 "280" => "legal",
 "282" => "legal",
 "283" => "legal",
 "284" => "legal",
 "285" => "legal",
 "286" => "legal",
 "288" => "legal",
 "289" => "legal",
 "291" => "legal",
 "294" => "legal",
 "296" => "legal",
 "297" => "legal",
 "300" => "legal",
 "302" => "legal",
 "303" => "legal",
 "304" => "legal",
 "307" => "legal",
 "309" => "legal",
 "311" => "legal",
 "318" => "legal",
 "319" => "legal",
 "320" => "legal",
 "323" => "legal",
 "329" => "legal",
 "330" => "legal",
 "331" => "legal",
 "335" => "legal",
 "337" => "legal",
 "339" => "legal",
 "342" => "legal",
 "343" => "legal",
 "344" => "legal",
 "346" => "legal",
 "350" => "legal",
 "351" => "legal",
 "354" => "legal",
 "359" => "legal",
 "361" => "legal",
 "363" => "legal",
 "369" => "legal",
 "377" => "legal",
 "379" => "legal",
 "381" => "legal",
 "400" => "legal",
 "405" => "legal",
 "406" => "legal",
 "408" => "legal",
 "410" => "legal",
 "411" => "legal",
 "412" => "legal",
 "414" => "legal",
 "415" => "legal",
 "417" => "legal",
 "418" => "legal",
 "419" => "legal",
 "420" => "legal",
 "423" => "legal",
 "424" => "legal",
 "450" => "legal",
 "451" => "legal",
 "455" => "legal",
 "456" => "legal",
 "458" => "legal",
 "461" => "legal", # RR Mile Post
 "462" => "legal",
 "463" => "legal",
 "466" => "legal",
 "501" => "legal",
 "509" => "legal",
 "516" => "legal", # B6-24 added v6
 "575" => "legal",
 "578" => "legal",
 "579" => "legal", # Barrier Wall
 "600" => "legal",
 "601" => "legal",
 "602" => "legal",
 "604" => "legal",
 "605" => "legal",
 "606" => "legal",
 "607" => "legal",
 "609" => "legal",
 "611" => "legal",
 "612" => "legal",
 "613" => "legal",
 "615" => "legal",
 "616" => "legal",
 "618" => "legal",
 "619" => "legal",
 "620" => "legal",
 "621" => "legal",
 "623" => "legal",
 "624" => "legal",
 "626" => "legal",
 "627" => "legal",
 "628" => "legal",
 "629" => "legal",
 "631" => "legal",
 "633" => "legla",
 "634" => "legal",
 "635" => "legal",
 "640" => "legal",
 "641" => "legal",
 "649" => "legal",
 "650" => "legal",
 "652" => "legal",
 "654" => "legal",
 "656" => "legal",
 "664" => "legal",
 "666" => "legal",
 "668" => "legal",
 "669" => "legal",
 "673" => "legal",
 "674" => "legal",
 "678" => "legal", # Edge of Lanes - added v6
 "682" => "legal",
 "683" => "legal",
 "689" => "legal",
 "691" => "legal",
 "694" => "legal",
 "695" => "legal",
 "699" => "legal", # Misc - added v6
 "760" => "legal", # V14
 "776" => "legal", #
 "795" => "legal",
 "858" => "legal",
 "860" => "legal",
 "861" => "legal",
 "867" => "legal",
 "881" => "legal",
 "930" => "legal",
 "942" => "legal",
 "960" => "legal",
 "962" => "legal",
);
my %requiredComments = (
 "ACU" => "AC UNIT",
 "AEM" => "MAIN",
 "BAB" => "ABUTMENT CAP",
 "BAL" => "LOCATION ONLY",
 "BBA" => "AGG",
 "BBB" => "HMA",
 "BBC" => "CONC",
 "BBG" => "GAS BUFFALO BOX",
 "BBW" => "WATER BUFFALO BOX",
 "BBR" => "BRICK",
 "BBS" => "ELEV ONLY",
 "BDB" => "HMA",
 "BDC" => "CONC",
 "BDP" => "BRIDGE DECK PLATE",
 "BDT" => "TIMBER",
 "BHR" => "HANDRAIL",
 "BPC" => "LOCATION ONLY",
 "BPR" => "PIER CAP",
 "BPT" => "ELEV ONLY",
 "BSC" => "SCUPPER",
 "BSS" => "STRUCTURAL STEEL",
 "BWC" => "SIDEWALK CONC",
 "BWL" => "BACKWALL",
 "CNA" => "AGG",
 "CNB" => "HMA",
 "CNC" => "CONC",
 "CNR" => "BRICK",
 "COL" => "COLUMN",
 "DRA" => "AGG",
 "DRB" => "HMA",
 "DRC" => "CONC",
 "DRG" => "FIELD ENTRANCE",
 "DRR" => "BRICK",
 "DCA" => "AGG",
 "DCB" => "HMA",
 "DCC" => "CONC",
 "DCG" => "FIELD ENTRANCE",
 "DCR" => "BRICK",
 "DFA" => "AGG",
 "DFB" => "HMA",
 "DFC" => "CONC",
 "DFG" => "FIELD ENTRANCE",
 "DFR" => "BRICK",
 "DPA" => "AGG",
 "DPB" => "HMA",
 "DPC" => "CONC",
 "DPG" => "FIELD ENTRANCE",
 "DPR" => "BRICK",
 "DSP" => "DOWNSPOUT",
 "EOA" => "AGG",
 "EOB" => "HMA",
 "EOC" => "CONC",
 "EOR" => "BRICK",
 "ERB" => "BIT W/ BIT SHLD",
 "ERC" => "CONC W/ BIT SHLD",
 "ESC" => "CONC W/ CONC SHLD",
 "ETB" => "BIT W/ BIT SHLD & CURB",
 "ETC" => "CONC W/ BIT SHLD & CURB",
 "EUB" => "BIT W/ CURB",
 "EUC" => "CONC W/ CURB",
 "EWC" => "CONC W/ CONC SHLD & CURB",
 "FFL" => "FINISH FLOOR",
 "FNI" => "IRON",
 "FNL" => "CHAIN LINK",
 "FNT" => "WOOD",
 "FNV" => "VINYL",
 "FNW" => "WIRE",
 "FNX" => "BARBED WIRE",
 "GCC" => "CONC",
 "GCF" => "FRAME",
 "GCM" => "MASONRY",
 "GCR" => "BRICK",
 "GCS" => "STEEL",
 "GCT" => "TIMBER",
 "GPC" => "CONC",
 "GPF" => "FRAME",
 "GPM" => "MASONRY",
 "GPR" => "BRICK",
 "GPS" => "STEEL",
 "GPT" => "TIMBER",
 "GRC" => "CONC",
 "GRF" => "FRAME",
 "GRM" => "MASONRY",
 "GRR" => "BRICK",
 "GRS" => "STEEL",
 "GRT" => "TIMBER",
 "HHE" => "ELECTRIC",
 "HHF" => "FIBER OPTIC",
 "HHR" => "TRAFFIC SIGNAL",
 "HHT" => "TELEPHONE",
 "HHV" => "CABLE TV",
 "JUN" => "SANITARY QL-B",
 "JUT" => "COMM QL-B",
 "JUS" => "FIBER OPTIC QL-B",
 "JUV" => "TV QL-B",
 "JUW" => "WATER QL-B",
 "LNB" => "HMA",
 "LNC" => "CONC",
 "MHM" => "STORM",
 "MHT" => "COMM",
 "MHE" => "ELEC",
 "MHF" => "FIBER",
 "MHG" => "GAS",
 "MHN" => "SANITARY",
 "MHV" => "CABLE TV",
 "MHS" => "TRAFFIC FIBER OPTIC",
 "MHW" => "H2O",
 "MTE" => "ELEC",
 "MTW" => "H2O",
 "PAA" => "PATIO - AGG",
 "PAB" => "PATIO - HMA",
 "PAC" => "PATIO - CONC",
 "PAN" => "PATIO - STONE",
 "PAR" => "PATIO - BRICK",
 "PBB" => "HMA",
 "PBC" => "CONC",
 "PDE" => "ELEC",
 "PDF" => "FIBER OPTIC",
 "PMA" => "AGG",
 "PMB" => "HMA",
 "PMC" => "CONC",
 "PMR" => "BRICK",
 "RCK" => "BOULDER",
 "RPB" => "HMA",
 "RPC" => "CONC",
 "RPN" => "STONE",
 "RPR" => "BRICK",
 "RPS" => "STEEL",
 "RPT" => "WOOD",
 "RRH" => "RR SWITCH HEATER",
 "RRT" => "RR TIE",
 "RWC" => "CONC",
 "RWN" => "STONE",
 "RWM" => "MASONRY",
 "RWR" => "BRICK",
 "RWS" => "STEEL",
 "RWT" => "TIMBER",
 "SBT" => "TELEPHONE",
 "SBW" => "SPRINKLER SYSTEM",
 "SBF" => "FIBER OPTIC",
 "SHA" => "AGG",
 "SHB" => "HMA",
 "SHC" => "CONC",
 "SNE" => "ELEC",
 "SNF" => "FIBER",
 "SNG" => "GAS",
 "SNN" => "SANITARY",
 "SNP" => "PETRL",
 "SNT" => "COMM",
 "SNV" => "TV",
 "SNW" => "WATER",
 "SPA" => "TRAVERSE POINT",
 "SPB" => "AXLE",
 "SPC" => "CUT CROSS",
 "SPD" => "CONC MONUMENT",
 "SPE" => "CRIMP PIPE",
 "SPF" => "BENCHMARK",
 "SPG" => "GPS MONUMENT",
 "SPH" => "CONTROL POINT",
 "SPI" => "IRON PIPE",
 "SPJ" => "NAIL",
 "SPK" => "NAIL & WASHER",
 "SPL" => "PK NAIL",
 "SPM" => "MAG NAIL",
 "SPN" => "ROW MARKER",
 "SPO" => "RR SPIKE",
 "SPP" => "POLE BARN SPIKE",
 "SPQ" => "STONE",
 "SPR" => "COTTON PICKER SPINDLE",
 "SPS" => "HUB",
 "SPT" => "CUT SQUARE",
 "SPU" => "REBAR",
 "SPV" => "DRILL HOLE",
 "SPW" => "BRASS MARKER",
 "SPX" => "IRON ROD",
 "SPZ" => "AXLE",
 "SWA" => "AGG",
 "SWB" => "HMA",
 "SWC" => "CONC",
 "SWR" => "BRICK",
 "TIL" => "TILE",
 "TRE" => "TRANSFORMER",
 "VLB" => "VALVE BOX",
 "VLN" => "VALVE SANITARY",
 "VNG" => "GAS VALVE",
 "VLW" => "WATER VALVE",
 "WAC" => "CONC",
 "WAF" => "FRAME",
 "WAN" => "STONE",
 "WAM" => "MASONRY",
 "WAR" => "BRICK",
 "WAS" => "STEEL",
 "WAT" => "TIMBER",
 "WTR" => "TOP ELEV",
);
my @flagCodes = (
 "RANDOM",
 "CKH",
 "CKV",
 "TMP",
);
#  %IDOTmiscCodes = (
#   "701" => "Traverse Survey Point",
#   "702" => "X-Section Survey Point",
#   "703" => "Topo Survey Point",
#   "707" => "Cut Square",
#   "711" => "Close Figure",
#   "741" => "Broken",
#   "742" => "Tubeco",
#   "743" => "App. Line of Poss.",
#   "744" => "Possible",
#   "745" => "On-Skew",
#   "746" => "Bent",
#   "748" => "Aboveground",
#   "749" => "Underground",
#   "750" => "Abandoned",
#   "751" => "Aerial",
#   "752" => "AGG",
#   "753" => "Aluminum",
#   "754" => "Axle",
#   "755" => "Back",
#   "756" => "Barb",
#   "757" => "BL",
#   "758" => "Beginning",
#   "759" => "BIT",
#   "760" => "Bolt",
#   "761" => "Bottom",
#   "762" => "BRK",
#   "763" => "Buried",
#   "764" => "Cable",
#   "765" => "Cable TV",
#   "766" => "Cast Iron",
#   "767" => "Center",
#   "768" => "CL",
#   "769" => "Chain Link",
#   "770" => "Chiseled X",
#   "771" => "Clay",
#   "772" => "CMP",
#   "773" => "CMPA",
#   "774" => "CONC",
#   "775" => "Concrete Block",
#   "776" => "Corner",
#   "777" => "Cross Cut",
#   "778" => "Crushed Stone",
#   "779" => "CS",
#   "780" => "Dirt",
#   "781" => "Disk",
#   "782" => "Door Sill",
#   "783" => "Drill Hole",
#   "784" => "Duct. Iron Pipe",
#   "785" => "Edge",
#   "786" => "Edge of Water",
#   "787" => "Electrical",
#   "788" => "End",
#   "789" => "Face",
#   "790" => "Field",
#   "791" => "Flag",
#   "792" => "Floor",
#   "793" => "FL",
#   "794" => "Found",
#   "795" => "Foundation",
#   "796" => "Front",
#   "797" => "Garage",
#   "798" => "Gas",
#   "799" => "Gasoline",
#   "800" => "Gravel",
#   "801" => "HSE",
#   "802" => "Inside",
#   "803" => "Intersection",
#   "804" => "Iron",
#   "805" => "Meanderline",
#   "806" => "Metal",
#   "807" => "Midpoint",
#   "808" => "Multiple Use",
#   "809" => "Nail",
#   "810" => "Oiled Earth",
#   "811" => "Oil & Chips",
#   "812" => "Ornamental",
#   "813" => "Outside",
#   "814" => "Overhang",
#   "815" => "Painted",
#   "816" => "PC",
#   "817" => "PCC",
#   "818" => "Perm. Survey Marker",
#   "819" => "Petro",
#   "820" => "PI",
#   "821" => "Pin",
#   "822" => "Pinch Pipe",
#   "823" => "Pipe",
#   "824" => "PK Nail",
#   "825" => "Plate",
#   "826" => "Plug",
#   "827" => "POBTE",
#   "828" => "Rebar",
#   "829" => "POC",
#   "830" => "POFT",
#   "831" => "POFTE",
#   "832" => "POT",
#   "833" => "PRC",
#   "834" => "Private",
#   "835" => "PT",
#   "836" => "PVC",
#   "837" => "PVC Pipe",
#   "838" => "Rail Road Spike",
#   "839" => "Ramp",
#   "840" => "RCP",
#   "841" => "RCPA",
#   "842" => "Roof Bolt",
#   "843" => "Rubber",
#   "844" => "Transitline",
#   "845" => "Sanitary",
#   "846" => "SC",
#   "847" => "Set",
#   "848" => "Shed",
#   "849" => "Square Rod",
#   "850" => "ST",
#   "851" => "Steel",
#   "852" => "Step",
#   "853" => "Stone",
#   "854" => "Storm",
#   "855" => "Structure Entrance",
#   "856" => "Survey",
#   "857" => "Telephone",
#   "858" => "Thalweg",
#   "859" => "Timber",
#   "860" => "Toe",
#   "861" => "Top",
#   "862" => "Top of Bank",
#   "863" => "TS",
#   "864" => "Vegetation Line",
#   "865" => "Vitrified Clay",
#   "866" => "Vit. Clay Encased",
#   "867" => "Water",
#   "868" => "Wood Stake",
#   "869" => "Wood",
#   "870" => "Woven Wire",
#  ) ;
# --------------------------------------------------
# --------------------------------------------------
# --------------------------------------------------
# Some Global Vars
my $cflag = "XXXcontrolXXX";
my $aflag = "XXXalphaXXX";
my $oflag = "XXXoutlierXXX";
my $figname="";
my %activeStrings=();
my $curIsString=0;
my $lastWasString=0;
my @secondSplit;
# undef @secondSplit;
my @thirdsplit;
undef @thirdsplit;
my $_nextAutogenPtNum;
my $processLineCode;
my $commentFlag = "";
my $finalComment = "";
# --------------------------------------------------
my $pointNo          = "";
my $northing         = "";
my $easting          = "";
my $elevation        = "";
my $fullDescription  = "";
my $fullCode         = "";
my $comment          = "";
my $mpsCodeAndLineNo = "";
my $fieldLineCode    = "";
my $mpsCode          = "";
my $lineNo           = "";
# --------------------------------------------------
# --------------------------------------------------
# --------------------------------------------------
sub generateNextPtNum {
	return $_nextAutogenPtNum++;
}
##########
####################################### Start of Main Program
if ($#ARGV<0) {
	die "Syntax:\nperl fbk.pl <input file name> <start ptnum for new pts>\n";
}
my $fname=$ARGV[0];
$fname =~ s/\.[^.]*$//;
open(IN,$ARGV[0]);
open(OUT,">${fname}.csv");
if ($#ARGV>0) {
	$_nextAutogenPtNum=$ARGV[1];
}
else {
	$_nextAutogenPtNum=100000;
}
while (<IN>) {
	$curIsString=0;
	my @in = split(/,/, substr(uc, 0, -1), 5); #note: forces text to be uppercase
		$pointNo         = $in[0]; # point number
		$northing        = $in[1]; # northing
		$easting         = $in[2]; # easting
		$elevation       = $in[3]; # elevation
		$fullDescription = $in[4]; # full description (3 Letter Code-Line Number-Line Code-Comment)
	my @firstSplit = split(/\s+/,$fullDescription,2); #added lv - this separates the code from the comments
	  #using the first? whitespace as the separator so:
		$fullCode    = $firstSplit[0]; # 3 Letter Code-Line Number-Line Code
		$comment     = $firstSplit[1]; # the Comment
			print OUT "fullCode = $fullCode\n";
			print OUT "comment = $comment\n";
	if ($fullCode =~ m/[^a-zA-Z0-9]/){
		@secondSplit = ($fullCode =~ /(\w+)(\D*)/); # This separates the 3 letter Code and the line
		# number from the line coding symbol
		# using the first non-numeric/non-alpha character as the separator so:
			$mpsCodeAndLineNo = $secondSplit[0]; # the 3 Letter Code and Line Number
			$fieldLineCode    = $secondSplit[1]; # the Line Code
				print OUT "mpsCodeAndLineNo from if = $mpsCodeAndLineNo\n";
				print OUT "fieldLineCode from if = $fieldLineCode\n";
	} else {
			$mpsCodeAndLineNo = $fullCode; # the 3 Letter Code and Line Number
			$fieldLineCode    = ""; # the Line Code
				print OUT "mpsCodeAndLineNo from else = $mpsCodeAndLineNo\n";
				print OUT "fieldLineCode from else = $fieldLineCode\n";
	}
				print OUT "mpsCodeAndLineNo before thirdSplit = $mpsCodeAndLineNo\n";
	my @thirdSplit = ($mpsCodeAndLineNo =~ /(\w\w\w)(\d*)/);
			print OUT "thirdSplit[0] = $thirdSplit[0]\n";
			print OUT "thirdSplit[1] = $thirdSplit[1]\n";
		$mpsCode  = $thirdSplit[0];
		$lineNo   = $thirdSplit[1];
			print OUT "mpsCode = $mpsCode\n";
			print OUT "lineNo = $lineNo\n";
				print OUT "mpsCodeAndLineNo after thirdSplit = $mpsCodeAndLineNo\n";
	#---------------------------------------------------------------
	#---------------------------------------------------------------
	# IDOT MISC CODES
	# This section tests to see if anyone used the IDOT Misc Codes as comments
	# if they did it pulls the text from the IDOT code list and inserts it into
	# the comment.
	# No one has used this function to-date so I'm disabling it for now.
		# if ($comment =~ /\d\d\d/)  {
		#   $possibleMiscCode = $&;
		#   $description = $IDOTmiscCodes{$possibleMiscCode};
		# }
		# if ($description) {
		#   $fieldComment = $comment;
		#   $fieldComment =~ s/$possibleMiscCode/$description/;
		# }
		# else {
		# $fieldComment = $comment;
		# }
	#------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	#####1.B sEARCH FOR DELETEABLE CODES
	if ($fullDescription =~ /RANDOM|CKH|CKV/) {
		my $commentFlag = $cflag;
	}
	#---------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	####2 SEARCH FOR REQUIRED COMMENTS
	my $commentText = $requiredComments{$mpsCode};
	# if ($CommentText) {
	#   print OUT "mpsCode = $mpsCode\n";
	#   print OUT "variblec2 = $commentText\n";
	my $reqComment = $commentText;
	# }
	#---------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	#### 3.B. sEARCH FOR OUTLIERS
	my $isLegal = $legalCodes{$mpsCode};
	# print OUT "varibleisLegal = $isLegal\n";
	unless ($isLegal) {
		$commentFlag = $oflag;
	}
	#---------------------------------------------
	#--------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	# Handling all line code changes in this switch statement
	# This is a one time conversion  - the conversion in process.pl is being removed
		print OUT "fieldLineCode before if-elsif segment = $fieldLineCode\n";
	if ($fieldLineCode eq ".." ) { # /\.\./) {
		$processLineCode = "X";
	} elsif ($fieldLineCode eq "@") {
		$processLineCode = "X";
	} elsif ($fieldLineCode eq "." ) { #/\.$/) {
		$processLineCode = "L";
	} elsif ($fieldLineCode eq "-") {
		$processLineCode = "C";
	} elsif ($fieldLineCode eq "+") {
		$processLineCode = "E";
	} elsif ($fieldLineCode eq "%PC") {
		$processLineCode = "PC";
	} elsif ($fieldLineCode eq "%NT") {
		$processLineCode = "NTC";
	} elsif ($fieldLineCode eq "%SA") {
		$processLineCode = "SAP";
	} elsif ($fieldLineCode eq "%CC") {
		$processLineCode = "CC";
	} elsif ($fieldLineCode eq "%TT") {
		$processLineCode = "NTT";
	} elsif ($fieldLineCode eq "%PT") {
		$processLineCode = "PT";
	} elsif ($fieldLineCode eq "%OC") {
		$processLineCode = "OC*";
	} elsif ($fieldLineCode eq "%CS") {
		$processLineCode = "CS";
	} elsif ($fieldLineCode eq "%CD") {
		$processLineCode = "CD*";
	} elsif ($fieldLineCode eq "%CR") {
		$processLineCode = "CR*";
	} elsif ($fieldLineCode eq "%RE") {
		$processLineCode = "RECT";
	} elsif ($fieldLineCode eq "%DS") {
		$processLineCode = "DIST";
	} elsif ($fieldLineCode eq "%JP") {
		$processLineCode = "JPT";
	} elsif ($fieldLineCode eq "%TM") {
		$processLineCode = "TMPL";
	}
	print OUT "fieldLineCode after if-elsif segment = $fieldLineCode\n";
	print OUT "processLineCode after if-elsif segment = $processLineCode\n";
	# ----------------------------------------------
	# ----------------------------------------------
	# combine the elements of the finalComment
	if ($comment) {
		if ($reqComment) {
			$finalComment = " $reqComment $comment $commentFlag";
		} else {
			$finalComment = " $comment $commentFlag";
		}
	} else {
		if ($reqComment) {
			$finalComment = " $reqComment $commentFlag";
		} else {
			$finalComment = " $commentFlag";
		}
	}
	my $checkInCode = "$mpsCodeAndLineNo$processLineCode$finalComment";
	$checkInCode =~ s/  / /g;
	$checkInCode =~ s/  / /g;
	#---------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	# Print Section
	#
	print OUT "$pointNo,$northing,$easting,$elevation,$checkInCode\n";
	#
	#---------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	#  TEST SECTION
	# print OUT "in[0] point number             = $pointNo\n";
	# print OUT "in[1] northing                 = $northing\n";
	# print OUT "in[2] easting                  = $easting\n";
	# print OUT "in[3] elevation                = $elevation\n";
	# print OUT "fullDescription full code & comment      = $fullDescription\n";
	# print OUT "fullCode full code no comment = $fullCode\n";
	# print OUT "$finalComment finalComment              = $finalComment\n";
	# print OUT "mpsCodeAndLineNo code and line no.    = $mpsCodeAndLineNo\n";
	# print OUT "lineCode line code            = $lineCode\n";
	# print OUT "tok[0] line code               = $tok[0]\n";
	# print OUT "tok[1] code, line no., comment = $tok[1]\n";
	# print OUT "mpsCode code                 = $mpsCode\n";
	# print OUT "lineNo line number          = $lineNo\n";
	# print OUT "possibleMiscCode               = $possibleMiscCode\n";
	# print OUT "field comment                  = $fieldComment\n";
	# print OUT "commentFlag                    = $commentFlag\n";
	# print OUT "cFlag  control                 = $cflag\n";
	# print OUT "aFlag  alpha                   = $aflag\n";
	# print OUT "oFlag  outlier                 = $oflag\n";
	# print OUT "reqComment                       = $reqComment\n";
	# print OUT "isLegal                             = $isLegal\n";
	# print OUT "processLineCode                       = $processLineCode\n";
	# print OUT "comment                        = $comment\n";
	# print OUT "checkInCode                    = $checkInCode\n\n";
	#---------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	#---------------------------------------------
	#prepare for next loop
	if ($curIsString) {
		$activeStrings{$figname}=1; #make sure the list contains an entry for this string
	}
	$lastWasString=$curIsString;
	$figname="";
	$mpsCodeAndLineNo="";
	$fullCode="";
	$processLineCode="";
	$finalComment="";
	$mpsCode="";
	$lineNo="";
	$reqComment="";
	$isLegal="";
	$comment="";
	$checkInCode="";
	$commentFlag="";
	$commentText="";
}
close(IN);
close(OUT);

