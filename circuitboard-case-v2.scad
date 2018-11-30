//
// THIS FILE DOES NOT RUN STANDALONE
//

//////////////////////////////////////////////
// DRAW MOUNTING BRACKETS FOR CIRCUIT BOARD
//
module drawmount(x,y,z)
{
    difference()
    {
        translate([x-((mount_lb/2)),y-((mount_lb/2)),-board_height])
            cube([mount_lb,mount_lb,board_height],
                center=false);
        
        translate([x,y,-board_height])
            cylinder(h=board_height,r1=mount_hole_radius,r2=mount_hole_radius,$fn=10);
    }

}

///////////////////////////////
// GENERIC DRAW OF BASIC CASE
//
module genericcase()
{
    x2=max(board_l+(board_space_left+board_space_right)+(material_thickness*2),case_l);
    y2=max(board_b+(board_space_top+board_space_bottom)+(material_thickness*2),case_b);
    z2=max(board_h+(board_space_bottom*2)+(material_thickness*2),case_h);

    xa=mount_surface_width;
    xb=x2-(mount_surface_width+material_thickness);
    ya=mount_surface_width;
    yb=y2-(mount_surface_width+material_thickness);
    
    difference()
    {
        translate([-(material_thickness+board_space_left),-(material_thickness+board_space_bottom),-(material_thickness+board_height)])
            cube([  x2,
                    y2,
                    z2
                ],center=false);
    
    // case space is now at 0,0,0
        translate([-board_space_left,-board_space_bottom,-board_height])
            cube([x2-(material_thickness*2),y2-(material_thickness*2),z2+material_thickness+(board_space_bottom*2)],center=false);
    }
    
    //color([0,0,1])
    //    translate([0,0,-board_space_bottom])
    //        cube([board_l,board_b,material_thickness]);
    
    for(i = [0 : mount_points-1]) // for each mountpoint
    {   
        drawmount(mount_points_array[i][0], mount_points_array[i][1],-board_height);
    }
    
    // case mounts
    if (mount_top) 
    {
        translate([-(material_thickness+board_space_left),y2-(material_thickness+board_space_bottom),-(material_thickness+board_height)])
            difference()
            {
                cube([x2,mount_surface_width,material_thickness],center=false);
                
                translate([xa,mount_surface_width*0.25,0])
                    cube([mount_screw_width,mount_surface_width*0.75,material_thickness],center=false);
                
                translate([xb,mount_surface_width*0.25,0])
                    cube([mount_screw_width,mount_surface_width*0.75,material_thickness],center=false);
            }
    }
    
    if (mount_bottom) 
    {
        translate([-(material_thickness+board_space_left),-(mount_surface_width+board_space_bottom+material_thickness),-(material_thickness+board_height)])
            difference()
            {
                cube([x2,mount_surface_width+1,material_thickness],center=false);
                
                translate([xa,0,0])
                    cube([mount_screw_width,mount_surface_width*0.75,material_thickness],center=false);
                
                translate([xb,0,0])
                    cube([mount_screw_width,mount_surface_width*0.75,material_thickness],center=false);
            }
    }
    
    // case mounts
    if (mount_left) 
    {
        translate([-(mount_surface_width+board_space_left+material_thickness),-(board_space_bottom+material_thickness),-(material_thickness+board_height)])
            difference()
            {
                cube([mount_surface_width,y2,material_thickness],center=false);
                
                translate([0,ya,0])
                    cube([mount_surface_width*0.75,mount_screw_width,material_thickness],center=false);
                
                translate([0,yb,0])
                    cube([mount_surface_width*0.75,mount_screw_width,material_thickness],center=false);
                
                
            }
    }
    
    if (mount_right) 
    {
        translate([x2-(board_space_left+material_thickness),-(board_space_bottom+material_thickness),-(material_thickness+board_height)])
            difference()
            {
                cube([mount_surface_width,y2,material_thickness],center=false);
                
                translate([(mount_surface_width*0.25),ya,0])
                    cube([mount_surface_width*0.75,mount_screw_width,material_thickness],center=false);
                
                translate([(mount_surface_width*0.25),yb,0])
                    cube([mount_surface_width*0.75,mount_screw_width,material_thickness],center=false);
                
                
            }
    }
}   


///////////////////////////////////
// DRAW OF CASE WITH ALL DETAILS
//
module drawcase()
{   
    x2=max(board_l+(board_space_left+board_space_right)+(material_thickness*2),case_l)-(board_space_left+(material_thickness*2));
    y2=max(board_b+(board_space_top+board_space_bottom)+(material_thickness*2),case_b)-(board_space_bottom+(material_thickness*2));
    z2=max(board_h+(board_space_bottom+board_space_top)+(material_thickness*2),case_h);

    difference()
    {
        genericcase();
        
        if (case_open_top)
        {
            translate([0,y2,0])
                cube([board_l,material_thickness,z2]);
        }
        
        if (case_open_bottom)
        {
            translate([0,-board_space_bottom-material_thickness,0])
                cube([board_l,material_thickness,z2]);
        }
        
        if (case_open_left)
        {
            translate([-board_space_left-material_thickness,0,0])
                cube([material_thickness,board_b,z2]);
        }
        
        if (case_open_right)
        {
            translate([x2,0,0])
                cube([material_thickness,board_b,z2]);
        }
        
    }
    
}

///////////////////////////////////
// DRAW TOP COVER
//
module drawtopcover()
{
    x2=max(board_l+(board_space_left+board_space_right)+(material_thickness*2),case_l);
    y2=max(board_b+(board_space_top+board_space_bottom)+(material_thickness*2),case_b);
    
    cube([x2,y2,material_thickness]);
    
    difference()
    {
        translate([material_thickness,material_thickness,material_thickness])
            cube([x2-(material_thickness*2),y2-(material_thickness*2),top_cover_bracket_height]);
        
        translate([material_thickness*2,material_thickness*2,material_thickness])
            cube([x2-(material_thickness*4),y2-(material_thickness*4),top_cover_bracket_height]);
        
//        translate([material_thickness+coverbracketwidth,material_thickness,material_thickness])
  //          cube([x2-((material_thickness*4)+(coverbracketwidth*2)),y2,coverbracketheight]);
        
        if (coverbracketstyle==1) // corner only style
        {
            translate([material_thickness+coverbracketwidth,material_thickness,material_thickness])
                cube([x2-((material_thickness*2)+(top_cover_bracket_width*2)),y2,top_cover_bracket_height]);
        
            translate([material_thickness,material_thickness+coverbracketwidth,material_thickness])
                cube([x2,y2-((material_thickness*2)+(top_cover_bracket_width*2)),top_cover_bracket_height]);
        }
    }
}

//
// MODULE-END
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////
// DRAW-BEGIN
//
if (select_draw==0) 
{
    drawcase();
}
else if (select_draw==1)
{   
    difference()
    {
        drawtopcover();
        
        cut_topcover();
    }
}

//
// DRAW-BEGIN
//////////////////
