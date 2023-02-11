

Config = {}

Config.Zone = {
	archeewa1 = { 
		minigame = 1,                     
		minigame_true_time = 4,           
		minigame_false_time = 3,
		Animation = "cellphone_text_read_base", 
		AnimationDirect = "cellphone@", 

		Text = {
			TextHelper = 'Press ~r~ E ~w~to Read Book.',
		},

		Marker = { 
			Pos = { x =-1656.98, y =-914.0, z =12.66 },
			distant = 3 
		},

		Items = {
			{
				Get = {
					ItemName = "paper_a", 
					ItemCount = 5, 
					Text = "เเผ่น", 
					Bonus = {
						{
							ItemName = "book", 
							ItemCount = 1, 
							Text = "เล่ม",
							Percent = 50 
						},
					}
				}
			}
		}
	},

	
	

}