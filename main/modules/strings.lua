local STR = {
	en = {
		ui = {
			button = {
				[hash("")] = "",
				
				[hash("buy")] = "BUY",
				[hash("repair")] = "REPAIR",
				[hash("upgrade")] = "UPGRADE",
				[hash("recruit")] = "RECRUIT",
				[hash("crew")] = "CREW",
				[hash("jobs")] = "JOBS",
				[hash("travel")] = "TRAVEL",

				[hash("jobs_accept")] = "ACCEPT",

				[hash("travel_explore")] = "EXPLORE",
				[hash("travel_mission")] = "MISSION",

				[hash("error_ok")] = "OK",
			},
			dialog_title = {
				[hash("buy")] = "BUY",
				[hash("repair")] = "REPAIR",
				[hash("upgrade")] = "UPGRADE",
				[hash("recruit")] = "RECRUIT",
				[hash("crew")] = "CREW",
				[hash("jobs")] = "AVAILABLE JOBS",
				[hash("travel")] = "TRAVEL",

				[hash("error_no_fuel")] = "You don't have enough fuel!",
				[hash("error_no_food")] = "You don't have enough rations!",
				[hash("error_no_pilot")] = "You must assign a pilot!",
			},
			label = {
				[hash("jobs_type")] = "TYPE",
				[hash("jobs_region")] = "REGION",
				[hash("jobs_wage")] = "WAGE",
				
				[hash("travel_core")] = "CORE WORLDS",
				[hash("travel_frontier")] = "FRONTIER",
				[hash("travel_rim")] = "OUTER RIM",

			}
		},
		names = {
			[hash("male")] = {
				"Mal", "Wash", "Simon", "Jean-Luc", "Wolf", "Wesley", "Crusher", "Chekov", "Geordi", "Scott", "Odo",
				"Quark", "Garrus", "Korben", "Cornelius", "Ziggy", "Tom", "Reed", "Flash", "Ace",
				"Gordon", "Memnon", "Cutter", "Mathesar", "Rimmer", "Lister", "Spiff", "Ijon", "Kaidan", "Jacob"
			},
			[hash("female")] = {
				"Nyota", "Deanna", "Kira", "Kim", "Cat", "Holly", "Tali", "Ruby", "Beverley", "Jinx",
				"Jovia", "Inara", "Kaylee", "Zoe", "River", "Tawny", "Trishka", "Miranda", "Kasumi", "Kelly"
			},
			[hash("both")] = {
				"Jayne", "Book", "Shepard", "Picard", "Riker", "Kirk", "McCoy", "Janeway", "LaForge", "O'Brien",
				"Uhura", "Bashir", "Dax", "Paris", "Torres", "Kochanski", "Holister", "Reynolds", "Ripley", "Dallas",
				"Ashley", "Brannigan", "Solo", "Carlissan", "Jameson", "Ripcord", "Archer", "Quill", "Buzz", "Eisenhorn",
				"Gaunt", "Sanchez", "Batty", "Richards", "Storm", "Grimm", "Vanderbeam", "Edgewise", "Quine", "Starr",
				"Taggart", "Madison", "Lazarus", "Chen", "Laredo", "Sarris", "Grayson", "Hunt", "Sarrano", "Novak", "Sato",
				"Troi", "Adama", "Thrace", "Tichy", "Lawson", "Chakwas", "Moreau", "Taylor", "Goto", "Massani", "Chambers",
				"Vega", "Cortez", "Traynor", "Denton"
			}
		}
	}
}

return STR