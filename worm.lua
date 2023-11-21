WORM_SPEED = 2
WORM_SIZE = 16
local prev_tick, changedir

function worm_init()
  changedir=false
  prev_tick=stat(50)%8
  worm={} --worm body
  make_wormhead()
  for i=1,WORM_SIZE,1 do
    add(worm,make_worm())
  end
end

function worm_update()
  move_wormhead()
  update_wormhead_direction()
  if (prev_tick!=(stat(56)/15)%WORM_SIZE) then
    move_worm(prev_tick%WORM_SIZE)
    prev_tick=(stat(56)/15)%WORM_SIZE
  end
  if (check_col(worm_head)) gameover_init()
  for w in all(worm) do if(check_col(w)) gameover_init() end
end

function worm_draw()
  foreach(worm,draw_worm)
  draw_worm(worm_head)
end

function make_wormhead()
  worm_head=make_worm()
  update_wormhead_direction()
end

function make_worm()
  local w={}
  w.x = 60
  w.y = 128
  w.w = 8
  w.h = 8
  return w
end

function move_wormhead()
  worm_head.x += worm_head.dx
  worm_head.y += worm_head.dy
end

function move_worm(tick)
  worm[tick+1].x = worm_head.x
  worm[tick+1].y = worm_head.y
end

function update_wormhead_direction()
  if (stat(56)%8 != 0) then changedir=false
  elseif (not changedir) then
    update_worm_direction_xy(worm_head,p.x,p.y) -- worm head
    changedir=true
  end
end

function update_worm_direction_xy(w,px,py)
  local vec=sqrt((px-w.x)^2+(py-w.y)^2)
  w.dx = ((px-w.x)/vec) * WORM_SPEED
  w.dy = ((py-w.y)/vec) * WORM_SPEED
end

function draw_worm(w)
  spr(15,w.x,w.y)
end