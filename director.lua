function director_init()
  music(16)
  spawn_ufo=false
  spawn_firework=false
  spawn_tesla=false
  spawn_beam=false
  spawn_worm=false
end

function director_update()
  if (stat(54) == 3 and not spawn_ufo) then ufo_init(); spawn_ufo=true end
  if (stat(54) == 5 and not spawn_firework) then firework_init(); spawn_firework=true end
  --if (stat(54) == 9 and not spawn_tesla) then tesla_init(); spawn_ufo=false; spawn_firework=false; spawn_tesla=true end
  if (stat(54) == 12 and not spawn_beam) then beam_init(); spawn_beam=true end
  if (stat(54) == 17 and not spawn_worm) then worm_init(); spawn_beam=false; spawn_worm=true end
end