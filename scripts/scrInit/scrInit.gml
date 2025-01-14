function timeunits(amt)
{return (TIMESEC*room_speed)*amt}


function init()
{
	randomize();

	#macro SCREENW_WIDE 416 // 384 // 256
	#macro SCREENH_WIDE 240 // 232/240
	#macro SCREENW_BASE 256
	#macro SCREENH_BASE 240
	#macro TIMESEC 0.4
	global.fnt = font_add_sprite_ext(sFont,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-+*!.:©bredi",0,0)
	#macro VERSION "2.1"
	
	global.score = 0;
	global.coins = 0;
	global.time = -1
	global.player = "Mario"
	global.playerName = "Mario"
	global.palettesprite = sPalette_mario;
	global.paletteindex = 1;
	global.moddedSprites = ds_map_create();
	global.moddedSounds = ds_map_create();
	ImportModSprites(working_directory + "mods\\character")
	ImportModSounds(working_directory + "mods\\character")
	global.letterboxSprite = sLetterbox_Red
	global.letterboxSelected = 0
	global.letterboxDark = 0
	global.letterboxes = [
	{	
		name : "RED",
		spr : sLetterbox_Red
	},
	{	
		name : "BLUE",
		spr : sLetterbox_Blue
	},
	{	
		name : "GREEN",
		spr : sLetterbox_Green
	},
	{	
		name : "YELLOW",
		spr : sLetterbox_Yellow
	},
	{	
		name : "PINK",
		spr : sLetterbox_Pink
	},
	{	
		name : "PURPLE",
		spr : sLetterbox_Purple
	},
	{	
		name : "ORANGE",
		spr : sLetterbox_Orange
	},
	]
	global.resolutionSetting = "WIDESCREEN"
	globalvar SCREENW; SCREENW = SCREENW_WIDE
	globalvar SCREENH; SCREENH = SCREENH_WIDE
	if global.resolutionSetting == "STANDARD" {
		SCREENW = SCREENW_BASE
		SCREENH = SCREENH_BASE
	}

	global.ch[0] = -1 //Sound
	global.ch[1] = -1 //Sound
	global.ch[2] = -1 //Sound
	global.ch[3] = -1 //Sound
	global.ch[4] = -1 //Sound

	global.sfx[0] = -1 //Sound
	global.sfx[1] = 0; //Channel
	
	global.musicchannels = true
	global.volsfx = 0.5;
	global.volbgm = 0.5;
	
	global.keyr = vk_right//ord("D");
	global.keyl = vk_left//ord("A");
	global.keyu = vk_up//ord("W");
	global.keyd = vk_down//ord("S");
	global.keya = ord("Z")//vk_lcontrol;
	global.keyj = ord("X")//vk_space;
	
	//global.keyrun = vk_shift;
	
	#region environment

	enum e
	{
		overworld,
		underground,
		castle,
		underwater,
		mushroom,
		snow,
	}
	global.environment = e.overworld


	function tile_brownpalswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_tilebrown,global.environment,1)
	}
	function tile_greenpalswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_tilegreen,global.environment,1)
	}
	function tile_bluepalswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_tileblue,global.environment,1)
	}
	function bg_palswap()
	{
		shader_set(shdColorswap)
		apply_palette(sPalette_background,global.environment,1)
	}
	function tile_palreset()
	{
		shader_reset();
	}
	#endregion
	
	#region screen
	
		window_set_caption("gmSMB "+VERSION);
		//application_surface_draw_enable(false);
		
		var scrsizemult = 3;
		var displayw = display_get_width();
		var displayh = display_get_height();
		var xpos = (displayw / 2) - (SCREENW_WIDE*scrsizemult)/2;
		var ypos = (displayh / 2) - (SCREENH_WIDE*scrsizemult)/2;
		//window_set_rectangle(xpos,ypos,SCREENW_WIDE*scrsizemult,SCREENH_WIDE*scrsizemult);
		window_set_size(SCREENW_WIDE*scrsizemult,SCREENH_WIDE*scrsizemult);
		window_center()

		view_enabled = true;
		view_visible[0] = true;

		view_xport[0] = 0;
		view_yport[0] = 0;
		view_wport[0] = SCREENW;
		view_hport[0] = SCREENH;

		surface_resize(application_surface,SCREENW,SCREENH);
		//display_set_gui_size(SCREENW,SCREENH)
		
	#endregion
	
	global.hidepfp = false;
	
	
	global.debug = true;
	
	global.rtxmode = false;
	global.schutmode = false;
	global.race = false;
	global.challenge = false;
	global.freecam = false;
	global.trippymode = false;
	
	global.racepos = ds_grid_create(3,1);
	
	global.arena = 0
	global.goalofstars = 15;
	
	
	global.ip = "12345.ddns.net"
	global.port = 7676;
	global.maxplayers = 8;
	global.username = ""
	global.insertclient = false
	global.clientid = irandom_range(0,10000);
	
	global.CHAT = ds_list_create();
	global.chatfocus = false;
	
	global.level = 0;
	global.world = 0;
}
