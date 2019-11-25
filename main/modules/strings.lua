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

				[hash("crew_background")] = "About",
				[hash("crew_skills")] = "Skills",
				[hash("crew_dismiss")] = "Dismiss",

				[hash("crew_plus")] = "+",
				[hash("crew_minus")] = "-",
				
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

				[hash("error_no_crew")] = "You have no crew!",
				
				[hash("error_no_jobs")] = "There are no jobs available here.",

				[hash("error_no_fuel")] = "You don't have enough fuel!",
				[hash("error_no_food")] = "You don't have enough rations!",
				[hash("error_no_pilot")] = "You must assign a pilot!",
			},
			label = {
				[hash("core")] = "Core worlds",
				[hash("frontier")] = "Frontier",
				[hash("rim")] = "Outer rim",

				[hash("role_none")] = "None",

				[hash("crew_name")] = "NAME",
				[hash("crew_role")] = "POST",
				[hash("crew_wage")] = "WAGE",
				
				[hash("jobs_type")] = "TYPE",
				[hash("jobs_region")] = "REGION",
				[hash("jobs_wage")] = "WAGE",

				[hash("job_delivery")] = "Delivery",
				[hash("job_smuggling")] = "Smuggling",
				[hash("job_passage")] = "Passage",
				[hash("job_assasination")] = "Assasination",
				[hash("job_espionage")] = "Espionage",



				[hash("jobs_accept")] = "Accept",
				
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