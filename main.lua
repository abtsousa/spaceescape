--[[
  todo:
  - ship particle effects
  - initial text
  - progress bar
  - fix tesla ray width/height
  - worm eyes?
]]--
-- https://gvituri.itch.io/space-shooter

function _init()
  menu_init()
  start_game=false
end

function _update60()
  update()
end

function _draw()
  draw()
end

function menu_init()
  update=menu_update
  draw=menu_draw
  music(58)
end

function menu_update()
  if (btn(5)) start_game=true
  if (start_game and (stat(54)==58) and (stat(53)==0)) game_init()
end

function menu_draw()
  cls()
  spr(64,32,32,8,8)
  color(stat(53)%16)
  print_center("a game by a. b. sousa",100)
  print_center("AKA bitaites",110)
  if (not start_game) then print_center("press ❎ to start", 120)
  else print_center("starting in "..tostr((2-stat(54)%58)*32-stat(53)), 120) end
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
  --[[
  print(stat(54),3,3)
  print(stat(46),3,9)
  print(stat(47),13,9)
  print(stat(48),23,9)
  print(stat(49),33,9)
  print(stat(52),3,15)
  print(stat(56),3,21)
  ]]--
end

function gameover_init()
  --if (not btn(4)) then --DEBUG GOD MODE
    update = gameover_update
    draw = gameover_draw
    sfx(34)
    music(60)
  --end
end

function gameover_update()
  p.sprite=16
  --gameover_ufo_update()
  if (btn(5)) game_init()
end

function gameover_draw()
  cls()
  game_draw()
  --[[
  stars_draw()
  ship_draw()
  if (spawn_ufo) ufo_draw()
  if (spawn_firework) firework_draw()
  if (spawn_tesla) tesla_draw()
  if (spawn_beam) beam_draw()
  if (spawn_worm) worm_draw()
  ]]--
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
  color(stat(53)%16)
  print_center("you won!!",55)
  print_center("press ❎ to restart",61)
end

function print_center(string,y)
  local x = 4*(#string)
  print(string,64-x/2,y)
end