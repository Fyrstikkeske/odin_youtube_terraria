package main

import rl "vendor:raylib"
import fmt "core:fmt"

main :: proc() {
    rl.InitWindow(800, 450, "what is this")

	Stone := rl.LoadTexture("Textures/STONE.png")
	
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
            rl.ClearBackground(rl.RAYWHITE)
            rl.DrawText("Congrats! You created your first window!", 190, 200, 20, rl.LIGHTGRAY)
			rl.DrawTexture(Stone,100,100,rl.WHITE)
        rl.EndDrawing()
    }
	rl.UnloadTexture(Stone)
    rl.CloseWindow()
}
