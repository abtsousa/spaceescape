function stars_init()
  --variables
  STARS={}
  STAR_COLS={1,5,6,7,12}
  WARP_FACTOR=3

  --create stars
  for i=1,#STAR_COLS do
    for j=1,10 do
      local s={
        x=rnd(128),
        y=rnd(128),
        z=1+rnd(#STAR_COLS-1),
        c=STAR_COLS[i]
      }
      add(STARS,s)
    end
  end
    
end

function stars_update()
  --move stars
  for s in all(STARS) do
    s.y+=s.z*WARP_FACTOR/10
    if s.y>128 then
      s.y=0
      s.x=rnd(128)
    end
  end
end

function stars_draw()
  for s in all(STARS) do
    pset(s.x,s.y,s.c)
  end
end

