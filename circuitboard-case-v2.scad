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
            cylinder(h=board_height,r1=mount_holeradius,r2=mount_holeradius,$fn=10);
    }

}

///////////////////////////////
// GENERIC DRAW OF BASIC CASE
//
module genericcase()
{
    x2=max(board_l+(boardspace_left+boardspace_right)+(materialthickness*2),case_l);
    y2=max(board_b+(boardspace_top+boardspace_bottom)+(materialthickness*2),case_b);
    z2=max(board_h+(boardspace_bottom*2)+(materialthickness*2),case_h);

    xa=mountsurfacewidth;
    xb=x2-(mountsurfacewidth+materialthickness);
    ya=mountsurfacewidth;
    yb=y2-(mountsurfacewidth+materialthickness);
    
    difference()
    {
        translate([-(materialthickness+boardspace_left),-(materialthickness+boardspace_bottom),-(materialthickness+board_height)])
            cube([  x2,
                    y2,
                    z2
                ],center=false);
    
    // case space is now at 0,0,0
        translate([-boardspace_left,-boardspace_bottom,-board_height])
            cube([x2-(materialthickness*2),y2-(materialthickness*2),z2+materialthickness+(boardspace_bottom*2)],center=false);
    }
    
    //color([0,0,1])
    //    translate([0,0,-boardspace_bottom])
    //        cube([board_l,board_b,materialthickness]);
    
    for(i = [0 : mountpoints-1]) // for each mountpoint
    {   
        drawmount(mountpointarray[i][0], mountpointarray[i][1],-board_height);
    }
    
    // case mounts
    if (mounttop) 
    {
        translate([-(materialthickness+boardspace_left),y2-(materialthickness+boardspace_bottom),-(materialthickness+board_height)])
            difference()
            {
                cube([x2,mountsurfacewidth,materialthickness],center=false);
                
                translate([xa,mountsurfacewidth*0.25,0])
                    cube([mountscrewwidth,mountsurfacewidth*0.75,materialthickness],center=false);
                
                translate([xb,mountsurfacewidth*0.25,0])
                    cube([mountscrewwidth,mountsurfacewidth*0.75,materialthickness],center=false);
            }
    }
    
    if (mountbottom) 
    {
        translate([-(materialthickness+boardspace_left),-(mountsurfacewidth+boardspace_bottom+materialthickness),-(materialthickness+board_height)])
            difference()
            {
                cube([x2,mountsurfacewidth+1,materialthickness],center=false);
                
                translate([xa,0,0])
                    cube([mountscrewwidth,mountsurfacewidth*0.75,materialthickness],center=false);
                
                translate([xb,0,0])
                    cube([mountscrewwidth,mountsurfacewidth*0.75,materialthickness],center=false);
            }
    }
    
    // case mounts
    if (mountleft) 
    {
        translate([-(mountsurfacewidth+boardspace_left+materialthickness),-(boardspace_bottom+materialthickness),-(materialthickness+board_height)])
            difference()
            {
                cube([mountsurfacewidth,y2,materialthickness],center=false);
                
                translate([0,ya,0])
                    cube([mountsurfacewidth*0.75,mountscrewwidth,materialthickness],center=false);
                
                translate([0,yb,0])
                    cube([mountsurfacewidth*0.75,mountscrewwidth,materialthickness],center=false);
                
                
            }
    }
    
    if (mountright) 
    {
        translate([x2-(boardspace_left+materialthickness),-(boardspace_bottom+materialthickness),-(materialthickness+board_height)])
            difference()
            {
                cube([mountsurfacewidth,y2,materialthickness],center=false);
                
                translate([(mountsurfacewidth*0.25),ya,0])
                    cube([mountsurfacewidth*0.75,mountscrewwidth,materialthickness],center=false);
                
                translate([(mountsurfacewidth*0.25),yb,0])
                    cube([mountsurfacewidth*0.75,mountscrewwidth,materialthickness],center=false);
                
                
            }
    }
}   


///////////////////////////////////
// DRAW OF CASE WITH ALL DETAILS
//
module drawcase()
{   
    x2=max(board_l+(boardspace_left+boardspace_right)+(materialthickness*2),case_l)-(boardspace_left+(materialthickness*2));
    y2=max(board_b+(boardspace_top+boardspace_bottom)+(materialthickness*2),case_b)-(boardspace_bottom+(materialthickness*2));
    z2=max(board_h+(boardspace_bottom+boardspace_top)+(materialthickness*2),case_h);

    difference()
    {
        genericcase();
        
        if (case_open_top)
        {
            translate([0,y2,0])
                cube([board_l,materialthickness,z2]);
        }
        
        if (case_open_bottom)
        {
            translate([0,-boardspace_bottom-materialthickness,0])
                cube([board_l,materialthickness,z2]);
        }
        
        if (case_open_left)
        {
            translate([-boardspace_left-materialthickness,0,0])
                cube([materialthickness,board_b,z2]);
        }
        
        if (case_open_right)
        {
            translate([x2,0,0])
                cube([materialthickness,board_b,z2]);
        }
        
    }
    
}

///////////////////////////////////
// DRAW TOP COVER
//
module drawtopcover()
{
    x2=max(board_l+(boardspace_left+boardspace_right)+(materialthickness*2),case_l);
    y2=max(board_b+(boardspace_top+boardspace_bottom)+(materialthickness*2),case_b);
    
    cube([x2,y2,materialthickness]);
    
    difference()
    {
        translate([materialthickness,materialthickness,materialthickness])
            cube([x2-(materialthickness*2),y2-(materialthickness*2),topcoverbracketheight]);
        
        translate([materialthickness*2,materialthickness*2,materialthickness])
            cube([x2-(materialthickness*4),y2-(materialthickness*4),topcoverbracketheight]);
        
//        translate([materialthickness+coverbracketwidth,materialthickness,materialthickness])
  //          cube([x2-((materialthickness*4)+(coverbracketwidth*2)),y2,coverbracketheight]);
        
        if (coverbracketstyle==1) // corner only style
        {
            translate([materialthickness+coverbracketwidth,materialthickness,materialthickness])
                cube([x2-((materialthickness*2)+(topcoverbracketwidth*2)),y2,topcoverbracketheight]);
        
            translate([materialthickness,materialthickness+coverbracketwidth,materialthickness])
                cube([x2,y2-((materialthickness*2)+(topcoverbracketwidth*2)),topcoverbracketheight]);
        }
    }
}

//
// MODULE-END
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////
// DRAW-BEGIN
//
if (selectdraw==0) 
{
    drawcase();
}
else if (selectdraw==1)
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
