//
// Gameboy Color
// Theme by Mahuti
// vs. 1.0
//

class UserConfig {
	</ label="Enable Logos", help="If wheel images/logos aren't used, game titles will be shown instead.", order=1, options="show logos, show titles" />
	enable_logos="show logos";
 
}

local config = fe.get_config();

// layout was built in photoshop. all numbers in this used are based off of the photoshop file's size. 
local base_width = 1440.0; // make sure this number is followed by .0 to make it a float. 
local base_height = 1080.0; // see note above. 

// width conversion factor
local xconv = fe.layout.width / base_width; 
// height conversion factor
local yconv = fe.layout.height / base_height; 


// get a width value converted using conversion factor
function width( num )
{
    return  num * xconv; 
}
// get a height value converted using conversion factor
function height( num )
{
	return num * yconv; 
}
// get a x position converted using conversion factor
function xpos( num )
{
    return num * xconv; 
}
// get the y position value converted using conversion factor
function ypos( num )
{
	return num * yconv; 
}
// debug text to tty
function debug( text )
{
    print( "Debug: " + text + "\n" );
    return true;
}

function set_titles( unused )
{
	// Title
	local title = fe.add_text("[Title]", xpos(18), ypos(18), width(317), height(32));
 	title.charsize = 24;
	title.set_rgb(247, 35, 0);
	title.font = "Pretendo"; 
} 


//Background
local bg = fe.add_image("gbc_background.jpg", 0,0, width(1440), height(1080) );

// Snap
local snap = fe.add_artwork("snap", xpos(125), ypos(480), width(505), height(442));
snap.trigger = Transition.EndNavigation;
snap.rotation = -7.9; 

// Boxart
local flyer = fe.add_artwork("flyer", xpos(925), ypos(25), width(625), height(703));
flyer.preserve_aspect_ratio = false;
flyer.trigger = Transition.EndNavigation;
flyer.rotation = 6.5; 

if ( config["enable_logos"] == "show logos" )
{
 	// wheel
	local wheel = fe.add_artwork("wheel", xpos(1000), ypos(800), width(350), height(270));
	wheel.preserve_aspect_ratio = true;
	wheel.trigger = Transition.EndNavigation;
	
} /* else {
	// Title
	local title = fe.add_text("[Title]", xpos(1067), ypos(860), width(244), height(181));
	title.align = Align.Right;
	title.charsize = 24;
	title.set_rgb(247, 35, 0);
	title.font = "Pretendo"; 
}*/ 
 
// Gameboy Overlay
local gb_overlay = fe.add_image("gbc_foreground.png", 0, 0, width(1440), height(1080));

// Playtime
local playtime = fe.add_text("Playtime : [PlayedTime]", xpos(16), ypos(18), width(391),height(39));
playtime.align = Align.Left;
playtime.charsize = 20;
playtime.set_rgb(255, 255, 255);



