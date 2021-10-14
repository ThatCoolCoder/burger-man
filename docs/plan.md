# Plan

## Brainstorm:

This is just a brainstorm of everything. I'm currently quite lacking in ideas because I did a game jam last week. Ideas that I like are made bold.

Game types:
- **Platformer w/ multiple levels**
- Platformer with one big level to explore
- **Game where you try to get a higher score in the same level**
    - Score based on time
    - Score based on pickups
    - Score based on kills
- **Top-down thing (not RPG)**

Core mechanics and ideas:
- Definitely not a multiplayer game, even locally networked
- The goal and spikes switch around when you press something/when you touch a button
- A platformer where you can't stop moving
- A puzzle-platformer where you can't move and the platforms move
- A really hard platformer
    - Hard because the base level has many spikes or whatever
    - Hard because the spikes are always changing
- A car racing game
    - You try and beat AI
    - You try and beat a specific time
    - **The track is changing as you drive**
        - The shape changes
        - Holes and blockages appear
        - Based on the other vehicles' movement (overscope)
            - They leave trails behind them
                - Which slow you down
                - Which give you speed boost
                - Which do both
                - Which can't be used at all
            - They make holes in the track as they go
    - The goal direction/finish point keeps changing
- You have to change characters to finish. Quite overused and probably overscoping.
- Limited number of jumps. Already lots of this exists.
- Gravity changes
    - When you move
    - Randomly
    - When you jump, gravity reverses
    - Different sections of the world have different gravity
- Top-down shooter
    - Have to shoot enemies
    - **Have to *not* shoot enemies**
- Have to survive but can't kill enemies
- **Balance collecting a currency and using it to kill enemies**
    - Your goal is to get snowballs but you have to throw them
    - You collect things and grow bigger but you have to throw parts of you
- Factory game (overscoping)
    - Have to meet a quota
    - Replay trying to beat production levels
    - Have to not build things
    - Have to sabotage the factory

Worlds:
- Fire world
- Rock world
- Spaceship
- Underwater
- Forest
- Arctic

## Final idea:

A top-down, play-die-repeat game where you try to beat your previous score and (as an extension) potentially progress through a meta-game.

#### Objective

To gain as many points as possible, which is achieved by growing to the largest size. 

#### Win condition

There is no explicit win condition, but a player may feel as if they have won if they manage to beat their high score.

#### Losing condition

If you touch/get shot by an enemy then you die. If this feels too hard then a health meter where different enemies do different amounts of damage can be implemented.

#### Core mechanics

Player movement mechanic
- The player can move up/down/left/right
- They have acceleration and their speed is capped
- The movement is controlled by arrow keys/WASD

Growth mechanic
- If the player picks up a growth item, then their size will increase
- The amount that they grow is variable leading to them

Shooting mechanic
- To avoid being killed by the enemies, the player can shoot balls made of their material at the enemies.
- Triggered by mouse release and controlled by mouse position
- (Maybe) by holding the mouse down for extended periods of time, the size of the shot item is bigger, which can do more damage/kill multiple enemies

#### Theming

Artic/ice theme

Player is a pile of snow/snowman who tries to collect pieces of snow to grow. Enemies are ?

#### Extensibility

The base product will be fairly small but it should allow for the following extensibility:
- More enemy types
    - Enemies that are harder
    - Enemies that you can catch to not die
- In-level power ups
- Out-of-level power ups (store)
- Skin store (no practical purpose but people like it)