SHOT_SPEED=3

function ufo_init()
  u={}
  u.x=0
  u.y=0
  u.w=8
  u.h=8
  u.dx=(121/480)*2
  spawned_shot = false
  shots_setup()
end

function ufo_update()

  if (u.x<0 or u.x>120) u.dx *=-1
  u.x += u.dx
  if (check_col(u)) gameover_init()

  if (stat(52)%4 != 0) then spawned_shot = false
  elseif (not spawned_shot) then
    make_shot(p.x+4,p.y+4)
    spawned_shot = true
  end
  
  for s in all(shots) do
    update_shot(s)
    if (check_col(s)) gameover_init() 
  end
end

function gameover_ufo_update()
  foreach(shots,update_shot)
end

function ufo_draw()
  spr(4,u.x,u.y)
  foreach(shots,draw_shot)
end

function shots_setup()
  shots={}
end

function make_shot(px,py)
  local s={}
  s.x=u.x+3
  s.y=u.y+7
  s.w=2
  s.h=2
  local vec=sqrt((px-s.x)^2+(py-s.y)^2)
  s.dx=(px-s.x)/vec
  s.dy=(py-s.y)/vec
  add(shots,s)
end

function update_shot(s)
  s.x+=s.dx * SHOT_SPEED
  s.y+=s.dy * SHOT_SPEED
  if (s.y<-8 or s.y > 128 or s.x<-8 or s.x > 128) del(shots,s)
end

function draw_shot(s)
  pset(s.x,s.y,8)
  pset(s.x+1,s.y,8)
  pset(s.x,s.y+1,8)
  pset(s.x+1,s.y+1,8)
end