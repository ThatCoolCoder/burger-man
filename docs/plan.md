# Plan

## What is Godot?

Godot is a cross platform game engine written largely in c++. It's open source and under constant development. The editor runs on Windows, Linux, Mac and possibly BSD systems. Games can be exported to Windows, Linux, Mac, IOS, Android and HTML5.

## What can be made in Godot?

A number of successful games have been made in the Godot engine, although I haven't played any of them (I play a small amount of games). These are some popular games made with Godot (compiled from Wikipedia and Godot's website):
- TailQuest Defense
- Kingdoms of the Dump
- Cruelty Squad
- City Game Studio

Godot stands out for its specialized 2D engine, which unlike Unity, works in pixel coordinates and **doesn't involve quaternions**. It also has a respectable 3D engine, although it's currently inferior to those of Unity and Unreal Engine.

## Structure of projects and options for coding

Godot uses a node system to structure games. Each node has properties (eg is RigidBody) and uses its subnodes to determine aspects of itself (such as setting the collision shape). The three basic components required to make games in Godot are scenes, nodes and scripts. Assets (art or 3d models) are probably going to be wanted however.

Here is a list of the different methods of coding in Godot:
- using GDScript
- using the C# api
- in another community-supplied binding such as Lua
- there's possibly a visual scripting system; I haven't looked into it much though.

I'll be using GDScript as it's the default option and has worked for me on previous projects. It's a bit idiosyncratic sometimes but it's better than trying to get mono working

## Possible achievement

I have 6 weeks to program the game. At a rate of 2 double lessons per week, this is 24 hours total work time - the time one might spend on a 3-day jam. Obviously, I could achieve more by working at home but my free time is not guaranteed and I don't want to count on it. Because of the limited time frame, I'll stick to making a 2D game.

## Detailed planning

#### Brainstorm:

This is just a brainstorm of everything. I'm currently quite lacking in ideas because I did a game jam last week. Ideas that I like are made bold.

Game types:
- **Platformer w/ multiple levels**
- Platformer with one big level to explore
- **Game where you try to get a higher score in the same level**

Core mechanics and ideas:
- The goal and spikes switch around when you press something/when you touch a button
- A platformer where you can't stop moving
- A puzzle-platformer where you can't move and the platforms move
- A really hard platformer
    - Hard because the base level has many spikes or whatever
    - Hard because the spikes are always changing
- A car racing game
    - You try and beat AI
    - You try and beat a specific time
    - The track is changing as you drive
- Gravity changes based on your position.
- You have to change characters to finish. Quite overused and probably overscoping.
- Limited number of jumps. Already lots of this exists.
- Gravity changes
    - When you move
    - Randomly
- Top-down shooter
    - Have to shoot enemies
    - Have to *not* shoot enemies
- Have to survive without killing enemies

#### Final idea:

No idea yet