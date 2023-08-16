package main

import rl "vendor:raylib"
import fmt "core:fmt"

ImageSizeInPixels: i32: 8

WorldSizeX: i32: 100

WorldSizeY: i32: 11

BlockType :: enum{
	Air,
	Stone,
	Grass,
}

BlockTypeTexturesStruct :: struct{
	Stone,
	Grass,
	: rl.Texture
}


main :: proc() {

	World := [WorldSizeX][WorldSizeY]BlockType{}
	
	for x in 0..<len(World){
	for y in 0..<len(World[x]){
			if y == 10{
				World[x][y] = BlockType.Grass
			}
			if y == 9{
				World[x][y] = BlockType.Stone
			} 
	}
	}


	PlayerCamera := rl.Camera2D{rl.Vector2{200,200}, rl.Vector2{400,225},0,1}
	
	

    rl.InitWindow(800, 450, "i shoulda done this sooner")

	BlockTypeTextures := BlockTypeTexturesStruct{
		Stone = rl.LoadTexture("Textures/STONE.png"),
		Grass = rl.LoadTexture("Textures/GRESS.png"),
	}
	
    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
            rl.ClearBackground(rl.RAYWHITE)
            rl.DrawText("Congrats! changed worldrender to 2d array?", 190, 200, 20, rl.BLACK)
            rl.BeginMode2D(PlayerCamera)
				RenderTheWorld(World,BlockTypeTextures)
			rl.EndMode2D()
        rl.EndDrawing()
    }
    
    rl.UnloadTexture(BlockTypeTextures.Stone)
    rl.UnloadTexture(BlockTypeTextures.Grass)
    
    rl.CloseWindow()
}

RenderTheWorld :: proc(World:[WorldSizeX][WorldSizeY]BlockType, BlockTypeTextures: BlockTypeTexturesStruct){
	for x in 0..<len(World){
	for y in 0..<len(World[x]){
		switch World[x][y]{
			case BlockType.Air:
			
			case BlockType.Stone:
				DrawTextureOnWorld(BlockTypeTextures.Stone, x,y)
			
			case BlockType.Grass:
				DrawTextureOnWorld(BlockTypeTextures.Grass, x,y)
		}
	}	
	}
}


//hopefully saves me some boilercode
DrawTextureOnWorld :: proc(Sprite: rl.Texture, XPosition: int, YPosition: int){
	rl.DrawTexture(Sprite,
	 i32(XPosition)*ImageSizeInPixels,
	 400-i32(YPosition)* ImageSizeInPixels, 
	 rl.WHITE)
}
