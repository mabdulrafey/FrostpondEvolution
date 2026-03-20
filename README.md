Game Design Project 1 - 
Game Name: Frostpond Evolution

Cooked Devs: 
    Muhammad Abdul Rafey - Producer
    Ayman Kassem - Programmer
    Emerson Schnabel - Game Designer
    Madison Pham - Arist

How to Play: 
  All player attacks are automatic. The only keys the player must press are the arrow keys for
movement, allowing for 8 directional movements (straight and diagonal).

Project Theme: 
  For the given theme of evolution, our group liked the idea of a frog surviving through a nuclear winter.
By evolving through mutations, this frog can defend the pond by defending it from incoming mutated enemies. 
The way the theme was implemented was through an upgrade system as the frog grows. As the player
accrues their score by killing enemies, they will be presented with random mutations
that upgrade their stats. This allows the frog to evolve from these mutations, growing stronger and stronger
from the masses of enemies trying to steal the frog's pond. 

Cheat Codes:
  Pressing R Key - Room Restart

Graduate Features (Graduate Student: Ayman Kassem):
  Advanced Features:
    - Particles:
        Two particle systems were implemented, both of which were for the projectile attacks
        to give visual feedback of the collision. For the player's spit attack, it creates a short, dark green
        acidic splash particle on impact. For the enemy flower's projectile attack, it creates a yellow acidic
        splash when it collides with the player. Both of these particle systems were created through GML code
        in the obj_controller object's Create Event. I used the Particle systems editor to configure the particles the way
        I desired, but was unsure how to properly implement them into the room, so I configured it as code instead.
    - Animation Curve:
        Originally, the Draw Event of the obj_enemy_tadpole and obj_enemy_tadpole_legs utilized the sine function
        to draw a hopping animation for them. Using the Animation Curve editor, I created a simple normal distribution
        graph, and mapped the Draw Event to that instead of using sine to draw the hopping for the enemy frog type.

  Room/Level Design:
    Views were used through the utilization of one viewport and camera. The room is pretty large, so the view is
    centered around the player with a 683 Width x 384 Height. The view follows obj_player at all times. The spawning mechanic
    I implemented for the enemies utilize this, and spawn within a specified range from the camera edge + buffer zone.

  Inheritence:
    The main case of inheritance found throughout the game is for the enemy types. All enemies inherit from
    obj_enemy to get their base state values and Step Event to follow the player. 

    




    
