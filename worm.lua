WORM_SPEED = 3

function worm_init()
  w_count=0
  worm={}
  make_worm()
end

function worm_update()
  if (#worm < 8) then
    w_count+=1;
    if (w_count%3) make_worm()
  end
  move_worm(worm[1])
  for worm_i,w in ipairs(worm) do
    if (check_col(w)) gameover_init()
    update_worm_direction(worm_i,w)
  end
end

function worm_draw()
  foreach(worm,draw_worm)
end

function make_worm()
  local w={}
  w.x = 60
  w.y = 128
  w.w = 8
  w.h = 8
  update_worm_direction(#worm+1,w)
  add(worm,w)
end

function move_worm(w)
  w.x += w.dx
  w.y += w.dy
end

function update_worm_direction(i,w)
  if (i == 1) then --head 
    if (stat(50)%8 != 0) then w.changedir=false
    elseif (not w.changedir) then
      update_worm_direction_xy(w,p.x,p.y) -- worm head
      w.changedir=true
    end
  else w.x,w.y = worm[i-1].x, worm[i-1].y end --update_worm_direction_xy(w,worm[1].x,worm[1].y) -- worm body
end

function update_worm_direction_xy(w,px,py)
  local vec=sqrt((px-w.x)^2+(py-w.y)^2)
  w.dx = ((px-w.x)/vec) * WORM_SPEED
  w.dy = ((py-w.y)/vec) * WORM_SPEED
end

function draw_worm(w)
  spr(15,w.x,w.y)
end