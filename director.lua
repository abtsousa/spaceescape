function director_init()
  music(1)
  spawn_ufo=false
  spawn_firework=false
  spawn_tesla=false
  spawn_beam=false
  spawn_worm=false
end

function director_update()
  if (not spawn_textA and stat(54) == 1) then spawn_textA=true end
  if (not spawn_textB and stat(54) == 1 and stat(53)>=16) then spawn_textB=true end
  if (not spawn_textC and stat(54) == 2) then spawn_textC=true end
  if (stat(54) == 3) then spawn_textA=false; spawn_textB=false; spawn_textC=false; end
  if (not spawn_ufo and stat(54) == 3) then spawn_ufo=true; ufo_init(); end
  if (not spawn_firework and stat(54) == 5) then spawn_firework=true; firework_init(); end
  if (not spawn_tesla and stat(54) == 9) then spawn_ufo=false; spawn_firework=false; spawn_tesla=true; tesla_init(); end
  if (not spawn_beam and stat(54) == 12) then spawn_beam=true; beam_init(); end
  if (not spawn_worm and stat(54) == 17) then spawn_tesla=false; spawn_beam=false; spawn_worm=true; worm_init(); end
  if (not spawn_ufo and stat(54) == 21) then spawn_ufo=true; ufo_init(); end
  if (stat(54) == 25) then spawn_worm=false; spawn_ufo=false; gamewon_init(); end
end