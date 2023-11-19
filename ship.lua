SHIP_SPEED=5

function ship_init()
  SHIP={}
  SHIP.x=60
  SHIP.y=112
  SHIP.dx=0
  SHIP.dy=0
  SHIP.sprite=1
  SHIP.alive=true
end

function ship_update()
  if (btnp(2)) then SHIP.dy=-SHIP_SPEED
  elseif (btnp(3)) then SHIP.dy=SHIP_SPEED
  else SHIP.dy=0 end
  if (btnp(0)) then SHIP.dx=-SHIP_SPEED
  elseif (btnp(1)) then SHIP.dx=SHIP_SPEED
  else SHIP.dx=0 end

  SHIP.x+=SHIP.dx
  SHIP.y+=SHIP.dy
end

function ship_draw()
  spr(SHIP.sprite,SHIP.x,SHIP.y)
end