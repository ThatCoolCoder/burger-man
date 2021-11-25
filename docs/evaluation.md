# Evaluation

Over the past 7 weeks, I've been creating (programming, designing and arting) a game using the Godot engine. Overall, I'm pleased with the result, given that I wasn't trying as hard on this as some of my other projects - spending under 48 hours of time on it. It's not the best game I ever made, but it's still good. Most importantly it's fun to play and is satisfying visually and aurally.

My game has a solid gameplay loop and has two distinct phases of play of different paces - collecting food and then shooting enemies. There's a decent amount of variety with 3 major classes of enemy, and 5 distinct types. Unlike my previous games, this has a solid simple tutorial shown to players on the first time they play (and also accessible later). It avoids the "wall of text" syndrome by using pictures for the essential information. The art is clean and neat. Some people think the game is way too hard, but I think they just need to play it more than once. It takes a bit of time to work out the best techniques and the fine points of all the mechanics.

Playtesters found that the onions were quite annoying (this was my intent). They wished for a slightly different experience at the start of a round - more burgers briefly and a pause before the first enemies spawned. Overall, they said that it was fun.

My game deviates quite a lot from the initial plan, but that's okay. The main differences are the theming (which minor as I never actually drew items in the old theme) and the scoring system.

I was forced to change the scoring after I realised the game was too hard. The original scoring was based on your size when you died. This was fine when the enemies killed you instantly, but this didn't work when I made them just shrink you and made you die when your size shrunk below a certain threshold. Obviously, if you always died at the same size, then you'd always score the same amount. I realised that the game also needed a better incentive to kill enemies, so I decided to switch the scoring over to an kill-based system. The score you got from killing an enemy was based on its scale and a species multiplier.

I didn't really have any major technical problems with this game as all of the mechanics are fairly simple and I had sufficient prior experience with the engine. Most of my issues were with creating neat, extensible systems for spawning, shooting and dying. These systemic issues were simply solved with thinking about them to create elegant solutions. Many times through the project I had to reference the documentation for certain features, but I don't count these as problems - just learning.

I guess the main improvements that could be made are further variety of enemies and addition of power ups. I know I've been talking about adding power ups for weeks without doing anything, but they would increase the addiction factor exponentially. Adding more enemy types 

The code spawning the enemies is interesing and is more extensible and cleaner than other more primitive systems. Every frame, there are a number of enemy types that may be spawned if the player is within a size threshold. If the enemy can spawn, then a random generator is used to determine if it will spawn (typically 1/60 chance) and a size is chosen for it between two bounds. The primitive way of achieving this would be to use a chain of if-statements but this would lead to duplicated code and make it time-consuming to add new types. Instead, I created a class to represent an enemy type and the associated spawning information (size constraints, etc). Then I created a list of these classes in the enemy spawner script:
```gdscript
var enemy_types = [
	EnemyType.new(0.6, 1.0,
		0, 200,
		0.3 / 60.0, preload("res://scenes/enemies/TomatoEnemy.tscn")),
	EnemyType.new(1, 1.5,
		90, 100000,
		0.15 / 60.0, preload("res://scenes/enemies/RangedCarrotEnemy.tscn")),
	EnemyType.new(0.7, 1.2,
		90, 100000,
		0.15 / 60.0, preload("res://scenes/enemies/FastOnionEnemy.tscn")),
	EnemyType.new(1.5, 2,
		110, 100000,
		0.3 / 60.0, preload("res://scenes/enemies/TomatoEnemy.tscn")),
	EnemyType.new(0.8, 1.2,
		150, 100000,
		0.15 / 60.0, preload("res://scenes/enemies/PumpkinEnemy.tscn"))
]
```
The parameters supplied to each constructor are: `min radius, max radius, min player radius, max player radius, prefab object`. Every frame, I loop through this list and check if the spawning conditions are right. If so, a random scale is chosen and the prefab is spawned. This can be summarised by the following pseudocode:
```pseudocode
every frame:
    for each enemy type:
        if player_radius < min_spawn_radius and player_radius < max_spawn_radius
            and random_float_0_to_1() < spawn_chance:
            instance enemy prefab and place it at random position on the edge of screen.
```