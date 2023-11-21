function win_init()
  fireworks={}
  explosions={}
  spawned_firework=false
end

function win_update()
  foreach(fireworks,update_fireshot)
  if (stat(52)%4 != 0) then spawned_firework = false
  elseif (not spawned_firework) then
    for i=0,12,1 do make_firework(5+10*i,rnd(128)) end
    spawned_firework = true
  end
  foreach(explosions,win_update_explosion)
end

function win_draw()
  foreach(fireworks,draw_fireshot)
  foreach(explosions,draw_explosion)
end

function win_update_explosion(e)
  if (time()>e.time+0.2) del(explosions,e)
end