package main

import rl "vendor:raylib"
import fmt "core:fmt"

BlockType :: enum{
	Air,
	Stone,
}



main :: proc() {
	World := [16*16]BlockType{}

	World[100] = BlockType.Stone
		
    rl.InitWindow(800, 450, "what da hail")
    
	Stone := rl.LoadTexture("Textures/STONE.png")
	
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
            rl.ClearBackground(rl.RAYWHITE)
            rl.DrawText("Congrats! WTF Int != Int32!", 190, 200, 20, rl.BLACK)
			rl.DrawTexture(Stone,100,100,rl.WHITE)
			for i in 0..<len(World){
				switch World[i]{
					case BlockType.Air:
					
					case BlockType.Stone:
						rl.DrawTexture(Stone,i32(i % 16) , i32(i/16),rl.WHITE)
				}
				
			}
        rl.EndDrawing()
    }
	rl.UnloadTexture(Stone)
    rl.CloseWindow()
}
