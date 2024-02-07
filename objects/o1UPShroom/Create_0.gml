event_inherited()

grounded = false;

pufunc = function()
{
    //points(8000,true)
    
    instance_create_depth(x div 1, y div 1, depth - 1, o1UP);
    sfx(snd1UP,0);
    instance_destroy();
}

face = 1;