function firework_init()
  fireworks={}
  explosions={}
  spawned_firework=false
end

function firework_update()
  foreach(fireworks,update_fireshot)
  if (stat(52)%8 != 0) then spawned_firework = false
  elseif (not spawned_firework) then
    make_firework(p.x+4,p.y+4)
    spawned_firework = true
  end
  foreach(explosions,update_explosion)
end

function firework_draw()
  foreach(fireworks,draw_fireshot)
  foreach(explosions,draw_explosion)
end

function make_firework(target_x, target_y)
  local f = {}
  f.x = target_x-1
  f.y = 128
  f.dy = (target_y-128)/30
  f.accel = (128-target_y)/1800
  add(fireworks,f)
end

function make_explosion(x,y)
  local e = {}
  e.x = x
  e.y = y
  e.r = 8
  e.time = time()
  add(explosions,e)
end

function update_fireshot(f)
  f.dy+=f.accel
  f.y+=f.dy
  if (f.dy>0) explode_fireshot(f)
end

function update_explosion(e)
  if (check_col_radius(e)) gameover_init()
  if (time()>e.time+0.2) del(explosions,e)
end

function explode_fireshot(f)
  make_explosion(f.x,f.y)
  del(fireworks,f)
end

function draw_fireshot(f)
  spr(11,f.x,f.y)
end

function draw_explosion(e)
  if (time()<e.time+0.1) then circfill(e.x,e.y,e.r,7)
  else circfill(e.x,e.y,e.r,8) end
end

 --dv = vf - vi = -vi
 --da = af - ai = -ai

 --py = 120+v0*60+1/2a*60^2 ==> py = 120-3600a+1/2(3600a) => py = 120-1800a => a = (120-py)/1800
 -- v = v0 + at => 0 = v0 + a*60 => v0 = -60a ==> v0 = -(120-py)/30