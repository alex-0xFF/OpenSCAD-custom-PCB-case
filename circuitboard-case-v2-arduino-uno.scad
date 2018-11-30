///////////////////////////////////////////////////////////////////
// CIRCUIT BOARD CASING - CONFIGURATION FILE
//
// 
// Arduino Uno casing
// idea&design by: P.Eradus, 13-11-2015, p.eradus@64kb.nl
// 
//
// History:
// 2015-11-21: Restructure code, separate configuration from draw code
// 2015-11-20: Code review, cleanup, organise, draw cover option
// 2015-11-14: Initial design & code
//
// HOW TO USE?
// #1 DOWNLOAD circuitboard-case-v2.scad
// #2 DOWNLOAD circuitboard-case-<of your choice>.scad 
//
// CUSTOMIZE AND OR GENERATE your STL file with OPENSCAD FROM FILE #2
// AND PRINT :-)
//
// NOTE: 
// - adjust at least the height of the case to suit your needs,
//   as the arduino board can carry additional shields that will
//   increase your needed height!
// - put appropiate additional spacing around board if larger shield
//   is used!
//   
//
///////////////////////////////////////////////////////////////////
// CONFIG-BEGIN
//

// select what to draw: 0=case, 1=cover
selectdraw=0;   

// general case material thickness(mm)
materialthickness=2;    // [2:5]


///////////////////////////////////////////////////////////////////
// CIRCUIT BOARD DETAILS
//

// circuitboard length in mm 
board_l=68.75; // [20:0.5:200]

// circuitboard width in mm
board_b=53.40; // [20:0.5:200]

// circuitboard board max height in mm
board_h=13; // [10:0.5:100]  only arduino board
//board_h=41; // [10:0.5:100]  arduino board + proto screw shield + lcd 16x2 shield

// circuitboard case space/padding distance left
boardspace_left=10; // [1:0.5:50]     

// circuitboard case space/padding distance right
boardspace_right=10; // [1:0.5:50]         

// circuitboard case space/padding distance top
boardspace_top=10; // [1:0.5:50]           

// circuitboard case space/padding distance bottom
boardspace_bottom=10; // [1:0.5:50]        

// circuitboard mount/space height
board_height=5; // [3:1:20]     


///////////////////////////////////////////////////////////////////
// CASE DETAILS
//

// case open on left side
case_open_left=true;    // [false,true]

// case open on right side
case_open_right=false;   // [false,true]

// case open on top side
case_open_top=true;   // [false,true]  

// case open on bottom side
case_open_bottom=true; // [false,true]

//  case length (0=use board size: autosize, or specify size)
case_l=0;  

// case width  (0=use board size: autosize, or specify size)
case_b=0;  

// case height (0=use board size: autosize, or specify size)
case_h=0;  

// circuitboard mounting/spacer length&width in mm
mount_lb=5; // [3:0.5:6]

// circuitboard mounting screw hole size in radius mm
mount_holeradius=1.5; 

///////////////////////////////////////////////////////////////////
// SIDE MOUNTING BRACKETS
//

// mounting bracket width, additional surface width each side for mount
mountsurfacewidth=10; // [6:0.5:50]

// mounting bracket screw radius
mountscrewwidth=3;    // [3,4,5,6,7,8]

// create mounting bracket on top side
mounttop=false; // [false,true]

// create mounting bracket on bottom side
mountbottom=false; // [false,true]

// create mounting bracket on left side
mountleft=true; // [false,true]

// create mounting bracket on right side
mountright=true; // [false,true]

// number of circuit board mount points
mountpoints=4; // [4,5,6]

// circuit board mount points, [ [x,y], [x,y], [x,y], [x,y] ]
mountpointarray=[ [15,2.5],
                  [66,18],
                  [66,46],
                  [14,51]
                  ];


///////////////////////////////////////////////////////////////////
// TOP COVER DETAILS
//
// set height of top cover bracket
topcoverbracketheight=materialthickness*3;

// set height of top cover bracket
topcoverbracketwidth=mountsurfacewidth;

// cover bracket 0=complete, 1=corners only
topcoverbracketstyle=1;


///////////////////////////////////////////////////////////////////
// SIDE MOUNTING BRACKETS
//
// mounting bracket width, additional surface width each side for mount
mountsurfacewidth=10; // [6:0.5:50]

// mounting bracket screw radius
mountscrewwidth=3;    // [3,4,5,6,7,8]

// create mounting bracket on top side
mounttop=false; // [false,true]

// create mounting bracket on bottom side
mountbottom=false; // [false,true]

// create mounting bracket on left side
mountleft=true; // [false,true]

// create mounting bracket on right side
mountright=true; // [false,true]

///////////////////////////////////////////////////////////////////
// TOP COVER DETAILS
//
// set height of top cover bracket
topcoverbracketheight=materialthickness*3;

// set height of top cover bracket
topcoverbracketwidth=mountsurfacewidth;

// cover bracket 0=complete, 1=corners only
topcoverbracketstyle=1;

// see module drawtopcoverholes() below to apply custom cover details

// CONFIG-END
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////
// MODULE-BEGIN
//
// USE THESE MODULE FUNCTIONS TO CUSTOMIZE YOUR CASE
//
module cut_topcover()
{
    /////////////////////////////////////////////////////////////////
    // take out comments below and use this  to drill holes ;-) 
    // EXAMPLE:
    // x=20; // xpos      (0..boardlength)
    // y=20; // ypos      (0..boardwidth)
    // d=5;  // diameter  (diameter in mm)
    // translate([x,y,0])
    //    cylinder(h=board_height,r1=d,r2=d,$fn=10);
    //
    // repeat if needed more holes
    //

}

//
// MODULE-BEGIN
///////////////////////////////////////////////////////////////////



include <circuitboard-case-v2.scad>