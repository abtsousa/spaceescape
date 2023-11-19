-- todo ship particle effects
-- https://gvituri.itch.io/space-shooter

function _init()
  stars_init()
  ship_init()
end

function _update60()
  stars_update()
  ship_update()
end

function _draw()
  cls()
  stars_draw()
  ship_draw()
end