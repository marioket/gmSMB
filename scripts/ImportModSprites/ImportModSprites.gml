function addplist(name,creator,_id = name)
{
	ds_list_add(playerlist,name);
	ds_list_add(creatorlist,creator);
	ds_list_add(idlist, _id)
}

function ImportModSounds(_directory) {
	show_debug_message("doing sounds or sum")
	var directoryArray = []
	var myDirArray = file_find_first($"{_directory}\\*", fa_directory)
	while myDirArray != "" {
			array_push(directoryArray, $"{_directory}\\{myDirArray}")
		myDirArray = file_find_next()
	}
	for (var i = 0; i < array_length(directoryArray); i++) {
		var soundFolder = $"{directoryArray[i]}\\sound\\"
		var mySoundCurrent = file_find_first($"{soundFolder}*", fa_none)
		while mySoundCurrent != "" {
			show_debug_message(mySoundCurrent)
			var soundAdded = audio_create_stream($"{soundFolder}{mySoundCurrent}")
			var soundName = string_replace(string_replace(mySoundCurrent, $"{directoryArray[i]}\\sound\\", ""), ".ogg", "")
			show_debug_message(soundName)
			ds_map_add(global.moddedSounds, soundName, soundAdded)
			show_debug_message(ds_map_find_value(global.moddedSounds, soundName))
			if ds_map_find_value(global.moddedSounds, soundName) != undefined 
				show_debug_message($"Added sound {soundAdded} to ds map global.moddedSounds under {soundName}")
			mySoundCurrent = file_find_next()
		}
	}
}

function ImportModSprites(_directory){
	var directoryArray = []
	var myDirArray = file_find_first($"{_directory}\\*", fa_directory)
	while myDirArray != "" {
			array_push(directoryArray, $"{_directory}\\{myDirArray}")
		myDirArray = file_find_next()
	}
	//show_debug_message($"{directoryArray[0]}\\main.ini")
	for (var i = 0; i < array_length(directoryArray); i++) {
		ini_open($"{directoryArray[i]}\\main.ini")
		var sprArray = []
		show_debug_message(directoryArray[i])
		var myFile = file_find_first($"{directoryArray[i]}\\*.png", fa_none)
		while myFile != "" {
			array_push(sprArray, myFile)
			myFile = file_find_next()
		}
		show_debug_message(sprArray)
		for (var j = 0; j < array_length(sprArray); j++) {
			var bigMario = string_pos("_b_", sprArray[j])
			var smallMario = string_pos("_s_", sprArray[j])
			var mySection = ""
			if bigMario == 0 && smallMario != 0 {
				mySection = "small_spritecount"
			} else {
				mySection = "big_spritecount"
			}
			var mySpriteNoPng = string_replace(sprArray[j], ".png", "")
			//show_debug_message(mySpriteNoPng)
			var defaultXOrig = ini_read_real(mySection, "xOrigin", 8)
			var defaultYOrig = ini_read_real(mySection, "yOrigin", 15)
			var myXOrig = ini_read_real(mySection, $"{mySpriteNoPng}xOrigin", defaultXOrig)
			var myYOrig = ini_read_real(mySection, $"{mySpriteNoPng}yOrigin", defaultYOrig)
			var myCount = ini_read_real(mySection, mySpriteNoPng, 1)
			var mySpr = sprite_add($"{directoryArray[i]}\\{sprArray[j]}", myCount, false, false, myXOrig, myYOrig)
			ds_map_add(global.moddedSprites, mySpriteNoPng, mySpr)
			if ds_map_find_value(global.moddedSprites, mySpriteNoPng) != undefined 
				show_debug_message($"Added sprite {mySpr} to ds map global.moddedSprites under {mySpriteNoPng}")
			else
				show_debug_message($"Failed to add {mySpr} to ds map global.moddedSprites")
			show_debug_message($"Added sprite {mySpr} {sprArray[j]} from {mySection} with {myCount} frames with an origin of {myXOrig} {myYOrig}")
		}
		ini_close()	
	}
}

function ImportModCharacter(_directory) {
	var directoryArray = []
	var myDirArray = file_find_first($"{_directory}\\*", fa_directory)
	while myDirArray != "" {
		array_push(directoryArray, $"{_directory}\\{myDirArray}")
		myDirArray = file_find_next()
	}
	for (var i = 0; i < array_length(directoryArray); i++) {
		ini_open($"{directoryArray[i]}\\main.ini")
		var myName = ini_read_string("main_info", "name", "No Name Set")
		var myID = ini_read_string("main_info", "id", "NoIDSet")
		var myCreator = ini_read_string("main_info", "creator", "No Creator Set")
		ini_close()
		addplist(myName, myCreator, myID)
	}
}