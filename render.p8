pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
cos1 = cos function cos(angle) return cos1(angle/(3.1415*2)) end
sin1 = sin function sin(angle) return sin1(-angle/(3.1415*2)) end

vec3 = {x=0,y=0,z=0}

function vec3:new(v)
	local v = v or {}
	setmetatable(v,self)
	self.__index=self
	return v
end

function vec3:length() -- overflow protection
 local d=max(max(abs(self.x),abs(self.y)),abs(self.z))
 local x,y,z=self.x/d,self.y/d,self.z/d
 return sqrt(x*x+y*y+z*z)*d
end

function vec3:dot(v) -- be careful of overflow
 return (self.x*v.x+self.y*v.y+self.z*v.z)
end

function vec3:cross(v)
 return vec3:new({x=self.y*v.z-self.z-v.y,
 y=self.z*v.x-self.x-v.z,
 z=self.x*v.y-self.y-v.x})
end

function vec3:add(v)
 return {x=self.x+v.x,y=self.y+v.y,z=self.z+v.z}
end

function vec3:sub(v)
 return {x=self.x-v.x,y=self.y-v.y,z=self.z-v.z}
end

function vec3:mul(r)
 return {x=self.x*r,y=self.y*r,z=self.z*r}
end

function vec3:normalize(v)-- returns new vector
 local len = v:length()
 if (len > 0) then
  local invlen = 1/len
  return vec3:new({x=v.x*invlen,y=v.y*invlen,z=v.z*invlen})
 else
  return vec3:new() -- return the zero vector
 end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
