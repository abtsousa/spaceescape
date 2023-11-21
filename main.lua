-- todo ship particle effects
-- https://gvituri.itch.io/space-shooter

function _init()
  game_init()
end

function _update60()
  update()
end

function _draw()
  draw()
end

function game_init()
  update=game_update
  draw=game_draw
  stars_init()
  ship_init()
  director_init()
end

function game_update()
  stars_update()
  ship_update()
  director_update()
  if (spawn_ufo) ufo_update()
  if (spawn_firework) firework_update()
  if (spawn_tesla) tesla_update()
  if (spawn_beam) beam_update()
  if (spawn_worm) worm_update()
end

function game_draw()
  cls()
  stars_draw()
  ship_draw()
  if (spawn_ufo) ufo_draw()
  if (spawn_firework) firework_draw()
  if (spawn_tesla) tesla_draw()
  if (spawn_beam) beam_draw()
  if (spawn_worm) worm_draw()
  print(stat(54),3,3)
  print(stat(46),3,9)
  print(stat(47),13,9)
  print(stat(48),23,9)
  print(stat(49),33,9)
  print(stat(52),3,15)
  print(stat(56),3,21)
end

function gameover_init()
  if (not btn(4)) then --DEBUG GOD MODE
    update = gameover_update
    draw = gameover_draw
    sfx(34)
    music(60)
  end
end

function gameover_update()
  p.sprite=16
  --gameover_ufo_update()
  if (btn(5)) game_init()
end

function gameover_draw()
  cls()
  game_draw()
--[[  stars_draw()
  ship_draw()
  if (spawn_ufo) ufo_draw()
  if (spawn_firework) firework_draw()
  if (spawn_tesla) tesla_draw()
  if (spawn_beam) beam_draw()
  if (spawn_worm) worm_draw()]]--
  print_center("game over",55)
  print_center("press ❎ to restart",61)
end

function gamewon_init()
  update = gamewon_update
  draw = gamewon_draw
  win_init()
end

function gamewon_update()
  if (btn(5)) game_init()
  stars_update()
  ship_update()
  win_update()
end

function gamewon_draw()
  cls()
  stars_draw()
  ship_draw()
  win_draw()
  print_center("you won!!",55)
  print_center("press ❎ to restart",61)
end

function print_center(string,y)
  local x = 5*(#string)
  print(string,64-x/2,y)
end