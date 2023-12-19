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
  if (prev_tick!=flr(stat(56)/5)%WORM_SIZE) then
    prev_tick=flr(stat(56)/5)%WORM_SIZE
    move_worm(prev_tick)
  end
  if (check_col(worm_head)) ship_hit()
  for w in all(worm) do if(check_col(w)) ship_hit() end
end

function worm_draw()
  for i=1,WORM_SIZE,1 do draw_worm(worm[(prev_tick+i)%WORM_SIZE+1]) end
  --pd_rotate(worm_head.x+4,worm_head.y+4,atan2(worm_head.dy, worm_head.dx),0,0,1,false,1)
  spr(14,worm_head.x,worm_head.y)
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
  if (stat(50)%8 != 0) then changedir=false
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

--123 tokens with scaling and arbitrary size
function pd_rotate(x,y,rot,mx,my,w,flip,scale)
  scale=scale or 1
  local halfw, cx=scale*-w/2, mx + .5
  local cy,cs,ss=my-halfw/scale,cos(rot)/scale,sin(rot)/scale
  local sx, sy, hx, hy=cx+cs*halfw, cy+ss*halfw, w*(flip and -4 or 4)*scale, w*4*scale
  for py=y-hy, y+hy do
  tline(x-hx, py, x+hx, py, sx -ss*halfw, sy + cs*halfw, cs/8, ss/8)
  halfw+=.125
  end
end