function savesettings()
{
	var sav = "gmsmbsave.ini"
	
	//if file_exists(sav) {file_delete(sav);}
	ini_open(sav);
	
	var charname = global.player
	var charid = global.playerName
	var charpalette = global.palettesprite
	var charpaletteindex = global.paletteindex
	var username = global.username
	var serverip = global.ip
	var serverport = global.port
	var sfxvolume = global.volsfx
	var bgmvolume = global.volbgm
	var classicaudio = global.musicchannels
	var hidediscordpfp = global.hidepfp
	var ku = global.keyu;
	var kd = global.keyd;
	var kl = global.keyl;
	var kr = global.keyr;
	var ka = global.keya;
	var kj = global.keyj;
	var resolution = global.resolutionSetting
	var letterbox = global.letterboxSelected
	var letterboxdark = global.letterboxDark
	
	var secCHAR = "character/costume"
	ini_write_string(secCHAR,"charname",charname);
	ini_write_string(secCHAR, "charid", charid);
	ini_write_real(secCHAR,"charpalette",charpalette);
	ini_write_real(secCHAR,"charpaletteindex",charpaletteindex);
	var secONLINE = "online"
	ini_write_string(secONLINE,"username",username);
	ini_write_string(secONLINE,"serverip",serverip);
	ini_write_real(secONLINE,"serverport",serverport);
	var secAUDIO = "audio"
	ini_write_real(secAUDIO,"sfxvolume",sfxvolume);
	ini_write_real(secAUDIO,"bgmvolume",bgmvolume);
	ini_write_real(secAUDIO,"classicaudio",classicaudio);
	var secETC = "etc"
	ini_write_real(secETC,"hidediscordpfp",hidediscordpfp);
	ini_write_string(secETC, "res", resolution);
	ini_write_real(secETC, "letterbox", letterbox);
	ini_write_real(secETC, "letterboxdark", letterboxdark);
	var secCTRL = "controls"
	ini_write_real(secCTRL,"ku",ku)
	ini_write_real(secCTRL,"kd",kd)
	ini_write_real(secCTRL,"kl",kl)
	ini_write_real(secCTRL,"kr",kr)
	ini_write_real(secCTRL,"ka",ka)
	ini_write_real(secCTRL,"kj",kj)
	
	ini_close();
}

function loadsettings()
{
	var sav = "gmsmbsave.ini"
	
	if file_exists(sav)
	{
		ini_open(sav);
	
		var secCHAR = "character/costume"
		var secONLINE = "online"
		var secAUDIO = "audio"
		var secETC = "etc"
		var secCTRL = "controls"
		
		var charname = ini_read_string(secCHAR,"charname","Mario");
		var charid = ini_read_string(secCHAR, "charid", "Mario");
		var charpalette = ini_read_real(secCHAR,"charpalette",0);
		var charpaletteindex = ini_read_real(secCHAR,"charpaletteindex",0);
		var username = ini_read_string(secONLINE,"username",string(random_range(0,10000)));
		var serverip = ini_read_string(secONLINE,"serverip","123.456.89-0");
		var serverport = ini_read_real(secONLINE,"serverport",7676);
		var sfxvolume = ini_read_real(secAUDIO,"sfxvolume",1);
		var bgmvolume = ini_read_real(secAUDIO,"bgmvolume",1);
		var classicaudio = ini_read_real(secAUDIO,"classicaudio",1);
		var hidediscordpfp = ini_read_real(secETC,"hidediscordpfp",0);
		var resolution = ini_read_string(secETC, "res", "WIDESCREEN");
		var letterboxdark = ini_read_real(secETC, "letterboxdark", 0);
		var letterbox = ini_read_real(secETC, "letterbox", 0);
		var ku = ini_read_real(secCTRL,"ku",global.keyu)
		var kd = ini_read_real(secCTRL,"kd",global.keyd)
		var kl = ini_read_real(secCTRL,"kl",global.keyl)
		var kr = ini_read_real(secCTRL,"kr",global.keyr)
		var ka = ini_read_real(secCTRL,"ka",global.keya)
		var kj = ini_read_real(secCTRL,"kj",global.keyj)
		
		global.player = charname;
		global.playerName = charid
		global.palettesprite = charpalette
		global.paletteindex = charpaletteindex
		global.username = username;
		global.ip = serverip;
		global.port = serverport;
		global.volsfx = sfxvolume
		global.volbgm = bgmvolume
		global.musicchannels = classicaudio
		global.hidepfp = hidediscordpfp
		global.keyu = ku
		global.keyd = kd
		global.keyl = kl
		global.keyr = kr
		global.keya = ka
		global.keyj = kj
		global.resolutionSetting = resolution
		global.letterboxSelected = letterbox
		global.letterboxDark = letterboxdark
		global.letterboxSprite = global.letterboxes[global.letterboxSelected].spr
	
		ini_close();
		
		//update res
		SCREENW = SCREENW_WIDE
		SCREENH = SCREENH_WIDE
		if global.resolutionSetting == "STANDARD" {
			SCREENW = SCREENW_BASE
			SCREENH = SCREENH_BASE
		}
		camera_set_view_size(view_camera[0], SCREENW, SCREENH)
		surface_resize(application_surface,SCREENW,SCREENH)
		var scrsizemult = 3;
		window_set_size(SCREENW_WIDE*scrsizemult,SCREENH_WIDE*scrsizemult);
		window_center()
	}
}