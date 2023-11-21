function director_init()
  music(1)
  spawn_ufo=false
  spawn_firework=false
  spawn_tesla=false
  spawn_beam=false
  spawn_worm=false
end

function director_update()
  if (stat(54) == 3 and not spawn_ufo) then spawn_ufo=true; ufo_init(); end
  if (stat(54) == 5 and not spawn_firework) then spawn_firework=true; firework_init(); end
  if (stat(54) == 9 and not spawn_tesla) then spawn_ufo=false; spawn_firework=false; spawn_tesla=true; tesla_init(); end
  if (stat(54) == 12 and not spawn_beam) then spawn_beam=true; beam_init(); end
  if (stat(54) == 17 and not spawn_worm) then spawn_tesla=false; spawn_beam=false; spawn_worm=true; worm_init(); end
  if (stat(54) == 21 and not spawn_ufo) then spawn_ufo=true; ufo_init(); end
  if (stat(54) == 25) then spawn_worm=false; spawn_ufo=false; gamewon_init(); end
end