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
  ufo_init()
  music(1)
end

function game_update()
  stars_update()
  ship_update()
  ufo_update()
end

function game_draw()
  cls()
  stars_draw()
  ship_draw()
  ufo_draw()
  print(stat(54),3,3)
  print(stat(46),3,9)
  print(stat(47),9,9)
  print(stat(48),15,9)
  print(stat(49),21,9)
  print(stat(52),3,15)
  print(stat(56),3,21)
end

function gameover_init()
  update = gameover_update
  draw = gameover_draw
  sfx(34)
  music(60)
end

function gameover_update()
  p.sprite=5
  gameover_ufo_update()
  if (btn(5)) game_init()
end

function gameover_draw()
  cls()
  stars_draw()
  ship_draw()
  ufo_draw()
  print("game over",44,55)
  print("press ❎ to restart",24,61)
end
