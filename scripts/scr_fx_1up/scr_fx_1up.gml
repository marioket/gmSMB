
function hud_spr_1up(obj)
{
    var y_update_timebuffer = [ 4, 4, 8, 16, 16, 16, 16, 16 ];
    
    var timer_prev;
    var player_dead = false, disable_fx = false;
    
    if ((disable_fx) || (player_dead)) 
    {
        return;
    }
    else 
    {
        timer_prev = obj.timer;
        if (timer_prev == 0) 
        {
            instance_destroy(obj);
        }
        else 
        {
            obj.timer = (timer_prev - 1);

            /*if (((y_update_timebuffer[obj.timer >> 4] & (current_time div 1)) == 0) 
            && (3 < obj.y)) 
            {
                obj.y--;
            }*/
			
			var fracmove = (1 + y_update_timebuffer[obj.timer >> 4]);
			
			if (obj.y > 3)
			{
				obj.y_frac -= fracmove;
			}
			

            if (obj.timer == 4)
            {
                instance_create_depth(x - sprite_xoffset,y - sprite_yoffset,depth - 1,o1UPSparkles);
            }
        }
    }
}


function draw_1up_text(obj)
{
    var scale_factor;
    var scale_final = 512;
	var scaling_sub = 0x00F00000;
	
	var in_view = true;
  
    if (in_view)
    {
        if (obj.timer < 5)
            obj.sprimage = 1;
        else
            obj.sprimage = 0;
                
        if (obj.timer < 32)
            scale_factor = 256;
        else if (obj.timer < 49)
            scale_factor = (((obj.timer * 0x100000 - scaling_sub >> 16) & 0xFFFFFFFF) & 0xFFFF);
        else
            scale_factor = 512;

        scale_final -= (scale_factor - 256);
        scale_final /= 512;
		
        draw_sprite_ext(s1UP,obj.sprimage,x div 1,y div 1,scale_final,scale_final,0,obj.image_blend,obj.image_alpha);
    }
}

function fx_1up_sparkles(obj, spr = sSparkles1UP)
{
    var vis_x, vis_y;
    var draw_x, draw_y, drawframe;
    var idx, manip_time;
    
    var sparkle_timeroffset = [18, 16, 14, 12, 10, 0];
    var sparkle_posoffset = [4, 8, 12, 0, 22, 6, 8, 4, 24, -2];
    var sparkle_frames = [4, 3, 2, 1, 0];
    var in_view = true;
    var player_dead = false;

    draw_x = 0;
    draw_y = 0;
    drawframe = 0;

    vis_x = obj.x div 1;
    vis_y = obj.y div 1;

    if (obj.timer == 0)
    {
        instance_destroy(obj);
        return;
    }
    else
    {
        if (!in_view)
        {
            instance_destroy(obj);
            return;
        }
        if (!player_dead)
        {
            obj.timer--;
        }
    }

    var objtimer = obj.timer;
    
    for (var i = 4; i > -1; i--)
    {
        idx = (i & 0xff);
        manip_time = (obj.timer - (sparkle_timeroffset[idx] & 0xFF)) + 10;

        if ((manip_time & 0xff) < 10)
        {
            // x position stuff I think
            draw_x = sparkle_posoffset[idx * 2] + vis_x;

            // y position
            draw_y = sparkle_posoffset[idx * 2 + 1] + vis_y;


            // this one might be the animation frames
            drawframe = sparkle_frames[(manip_time * 0x1000000 >> 0x19)];

            draw_sprite(spr,drawframe,draw_x,draw_y);
        }
    }
}