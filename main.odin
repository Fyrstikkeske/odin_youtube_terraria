package main

import rl "vendor:raylib"
import fmt "core:fmt"

Scale: i32: 16

WorldSizeX: i32: 16

WorldSizeY: i32: 16

BlockType :: enum{
	Air,
	Stone,
	Grass,
}



main :: proc() {
	World := [WorldSizeX*WorldSizeY]BlockType{}

	for i in 0..<len(World){
		if i32(i) / 16 == 11 {
			World[i] = BlockType.Stone
		}
		if i32(i32(i) / WorldSizeY) == 10{
			World[i] = BlockType.Grass
		}
	}


    rl.InitWindow(800, 450, "what da hail")
    
	Stone := rl.LoadTexture("Textures/STONE.png")
	Grass := rl.LoadTexture("Textures/GRESS.png")
	
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
            rl.ClearBackground(rl.RAYWHITE)
            rl.DrawText("Congrats! Ill add some grass for worldgen reasons", 190, 200, 20, rl.BLACK)
			for i in 0..<len(World){
				switch World[i]{
					case BlockType.Air:
					
					case BlockType.Stone:
						DrawTextureOnWorld(Stone, i)
						
					case BlockType.Grass:
						DrawTextureOnWorld(Grass, i)
				}
				
			}
        rl.EndDrawing()
    }
	rl.UnloadTexture(Stone)
	rl.UnloadTexture(Grass)
    rl.CloseWindow()
}


//hopefully saves me some boilercode
DrawTextureOnWorld :: proc(Sprite: rl.Texture, PositionOnWorldMap: int){
	rl.DrawTextureEx(Sprite,
	 rl.Vector2{
	 f32((i32(PositionOnWorldMap) % WorldSizeX)*Scale),
	 f32((i32(PositionOnWorldMap)/WorldSizeY)*Scale)},
	 0,
	 2, 
	 rl.WHITE)
}
