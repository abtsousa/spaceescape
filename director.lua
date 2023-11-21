function director_init()
  music(1)
  spawn_ufo=false
  spawn_firework=false
end

function director_update()
  if (stat(54) == 3 and not spawn_ufo) then ufo_init(); spawn_ufo=true end
  if (stat(54) == 5 and not spawn_firework) then firework_init(); spawn_firework=true end
end