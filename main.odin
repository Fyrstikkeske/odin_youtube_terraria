package main

import rl "vendor:raylib"
import fmt "core:fmt"

ImageSizeInPixels: i32: 8
TargetBlockPixelSize: i32: 24 //idfk is this is accurate

WorldSizeX: i32: 40

WorldSizeY: i32: 24

BlockType :: enum{
	Air,
	Stone,
	Grass,
}



main :: proc() {
	World := [WorldSizeX][WorldSizeY]BlockType{}
	
	for x in 0..<len(World){
	for y in 0..<len(World[x]){
			if y == 10{
				World[x][y] = BlockType.Grass
			} 
	}
	}


    rl.InitWindow(800, 450, "i shoulda done this sooner")
    
	Stone := rl.LoadTexture("Textures/STONE.png")
	Grass := rl.LoadTexture("Textures/GRESS.png")
	
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
            rl.ClearBackground(rl.RAYWHITE)
            rl.DrawText("Congrats! changed worldrender to 2d array?", 190, 200, 20, rl.BLACK)
			for x in 0..<len(World){
			for y in 0..<len(World[x]){
			
				switch World[x][y]{
					case BlockType.Air:
						
					case BlockType.Stone:
						DrawTextureOnWorld(Stone, x,y)
						
					case BlockType.Grass:
						DrawTextureOnWorld(Grass, x,y)
				}
			}	
			}
        rl.EndDrawing()
    }
	rl.UnloadTexture(Stone)
	rl.UnloadTexture(Grass)
    rl.CloseWindow()
}


//hopefully saves me some boilercode
DrawTextureOnWorld :: proc(Sprite: rl.Texture, XPosition: int, YPosition: int){
	rl.DrawTextureEx(Sprite,
	 rl.Vector2{
	 f32(i32(XPosition)*TargetBlockPixelSize),
	 f32(i32(YPosition)* TargetBlockPixelSize)},
	 0,
	 f32(TargetBlockPixelSize/ImageSizeInPixels),   //could just precompute, but why care for performance :troll: 
	 rl.WHITE)
}
