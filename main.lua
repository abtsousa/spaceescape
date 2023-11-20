-- todo ship particle effects
-- https://gvituri.itch.io/space-shooter

function _init()
  --stars_init()
  ship_init()
  ufo_init()
  music(0)
end

function _update60()
  --stars_update()
  ship_update()
  ufo_update()
end

function _draw()
  cls()
  --stars_draw()
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