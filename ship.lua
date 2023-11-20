function ship_init()
  p={}
  p.x=60     -- x coordinate
  p.y=112    -- y coordinate
  p.w=8      -- width
  p.h=8      -- height
  p.dx=0     -- instant delta x
  p.dy=0     -- instant delta y
  p.maxsp=3  -- max speed
  p.acc=1    -- acceleration
  p.drg=0.85 -- drag (friction)
  p.sprite=1
  p.alive=true
end

function ship_update()
  if (btn(0)) p.dx-=p.acc
  if (btn(1)) p.dx+=p.acc
  if (btn(2)) p.dy-=p.acc
  if (btn(3)) p.dy+=p.acc

  p.dx=mid(-p.maxsp,p.dx,p.maxsp)
  p.dy=mid(-p.maxsp,p.dy,p.maxsp)

  if (abs(p.dx)>0) p.dx*=p.drg
  if (abs(p.dy)>0) p.dy*=p.drg
  if (abs(p.dx)<0.02) p.dx=0
  if (abs(p.dy)<0.02) p.dy=0

  p.x=mid(0,p.x+p.dx,128-p.w)
  p.y=mid(0,p.y+p.dy,128-p.h)

  if (p.dx>1) then p.sprite=3
  elseif (p.dx<-1) then p.sprite=2
  else p.sprite=1 end
end

function ship_draw()
  spr(p.sprite,p.x,p.y)
end