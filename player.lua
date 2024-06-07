require 'object'

Player = Object:extend()

function Player:init(X, Y, params)
    self.params = (type(params) == 'table') and params or {}
    self.children = {}
    self.children.body = love.graphics.newImage("assets/keeny_sprites/blue_body_squircle.png")
    self.children.face = love.graphics.newImage("assets/keeny_sprites/face_a.png")
    self.children.right = love.graphics.newImage("assets/keeny_sprites/blue_hand_closed.png")
end

function Player:update()
end

function Player:draw()
end