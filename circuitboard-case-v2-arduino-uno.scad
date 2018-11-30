///////////////////////////////////////////////////////////////////
// CIRCUIT BOARD CASING - CONFIGURATION FILE
//

// select what to draw: 0=case, 1=cover
select_draw=0;   

// general case material thickness(mm)
material_thickness=2;    // [2:5]


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
board_space_left=10; // [1:0.5:50]     

// circuitboard case space/padding distance right
board_space_right=10; // [1:0.5:50]         

// circuitboard case space/padding distance top
board_space_top=10; // [1:0.5:50]           

// circuitboard case space/padding distance bottom
board_space_bottom=10; // [1:0.5:50]        

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
mount_hole_radius=1.5; 

///////////////////////////////////////////////////////////////////
// PCB MOUNTING POINTS
//

// number of circuit board mount points
mount_points=4; // [4,5,6]

// circuit board mount points, [ [x,y], [x,y], [x,y], [x,y] ]
mount_points_array=[ [15,2.5],
                  [66,18],
                  [66,46],
                  [14,51]
                  ];

///////////////////////////////////////////////////////////////////
// SIDE MOUNTING BRACKETS
//
// mounting bracket width, additional surface width each side for mount
mount_surface_width=10; // [6:0.5:50]

// mounting bracket screw radius
mount_screw_width=3;    // [3,4,5,6,7,8]

// create mounting bracket on top side
mount_top=false; // [false,true]

// create mounting bracket on bottom side
mount_bottom=false; // [false,true]

// create mounting bracket on left side
mount_left=true; // [false,true]

// create mounting bracket on right side
mount_right=true; // [false,true]

///////////////////////////////////////////////////////////////////
// TOP COVER DETAILS
//
// set height of top cover bracket
top_cover_bracket_height=material_thickness*3;

// set height of top cover bracket
top_cover_bracket_width=mount_surface_width;

// cover bracket 0=complete, 1=corners only
top_cover_bracket_style=1;

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