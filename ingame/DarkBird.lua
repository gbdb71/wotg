local Enemy = require("ingame.Enemy")
local Bird = require("ingame.Bird")
local Seed = require("ingame.Seed")
local Attack = require("ingame.Attack")

local DarkBird = class("DarkBird", Bird)

DarkBird.static.MAX_HP = 80
DarkBird.static.DASH_SPEED = 150

function DarkBird:initialize(x, y, dir)
	Enemy.initialize(self, x, y, 0, "darkbird")

	self.dir = dir
	self.xspeed = 0
	self.yspeed = 0

	self.state = Bird.static.STATE_FLY
	self.time = 0
	self.blink = 0
	self.hp = DarkBird.static.MAX_HP
	self.slot = nil
	self.dash_cooldown = 0
	self.dash_speed = DarkBird.static.DASH_SPEED
	self.player_range = 110

	self.animator = Animator(Resources.getAnimator("darkbird.lua"))
	self.collider = BoxCollider(12, 12)
end

function DarkBird:getScore()
	return 400
end

return DarkBird
