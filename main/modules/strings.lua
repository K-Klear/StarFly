local STR = {
	en = {
		ui = {
			-- general
			[hash("")] = "",

			[hash("role_none")] = "None",
			[hash("role_pilot")] = "Pilot",
			[hash("role_engineer")] = "Engineer",
			[hash("role_medic")] = "Medic",
			[hash("role_comms")] = "Comms",
			[hash("role_gunner")] = "Gunner",
			[hash("role_passenger")] = "Passenger",

			[hash("core")] = "Core",
			[hash("frontier")] = "Frontier",
			[hash("rim")] = "Outer rim",

			[hash("megalopolis")] = "Megalopolis",
			[hash("city")] = "City",
			[hash("outpost")] = "Outpost",

			[hash("federation")] = "Federation",
			[hash("independent")] = "Independent",
			[hash("rebels")] = "Rebel",

			[hash("delivery")] = "Delivery",
			[hash("smuggling")] = "Smuggling",
			[hash("passage")] = "Passage",
			[hash("assasination")] = "Assasination",
			[hash("espionage")] = "Espionage",
			
			-- buttons
			[hash("btn_buy")] = "BUY",
			[hash("btn_repair")] = "REPAIR",
			[hash("btn_upgrade")] = "UPGRADE",
			[hash("btn_recruit")] = "RECRUIT",
			[hash("btn_crew")] = "CREW",
			[hash("btn_jobs")] = "JOBS",
			[hash("btn_travel")] = "TRAVEL",
			[hash("btn_continue")] = "CONTINUE",
			[hash("btn_land")] = "LAND",

			[hash("btn_recruit_talk")] = "INTERVIEW",
			[hash("btn_recruit_hire")] = "HIRE",
			
			[hash("btn_crew_background")] = "About",
			[hash("btn_crew_skills")] = "Skills",
			[hash("btn_crew_dismiss")] = "Dismiss",
			[hash("btn_crew_plus")] = "+",
			[hash("btn_crew_minus")] = "-",
			
			[hash("btn_jobs_accept")] = "ACCEPT",

			[hash("btn_travel_explore")] = "EXPLORE",
			[hash("btn_travel_mission")] = "MISSION",

			[hash("btn_error_ok")] = "OK",
			[hash("btn_event_done")] = "DONE",

			-- dialog titles
			[hash("title_buy")] = "BUY",
			[hash("title_repair")] = "REPAIR",
			[hash("title_upgrade")] = "UPGRADE",
			[hash("title_recruit")] = "RECRUIT",
			[hash("title_crew")] = "CREW",
			[hash("title_jobs")] = "AVAILABLE JOBS",
			[hash("title_travel")] = "TRAVEL",

			[hash("title_role_selection")] = "Assign a new role.",

			[hash("title_error_no_crew")] = "You have no crew!",
			[hash("title_error_crew_full")] = "You don't have room for more crew!",
			[hash("title_error_no_recruits")] = "There is nobody here to recruit.",
			[hash("title_error_no_jobs")] = "There are no jobs available here.",
			[hash("title_error_no_fuel")] = "You don't have enough fuel!",
			[hash("title_error_no_food")] = "You don't have enough rations!",
			[hash("title_error_no_pilot")] = "You must assign a pilot!",

			-- dialog labels
			[hash("lbl_info_fuel")] = "FUEL:",
			[hash("lbl_info_food")] = "RATIONS:",
			[hash("lbl_info_money")] = "CREDITS:",

			[hash("lbl_recruit_name")] = "NAME",

			[hash("lbl_crew_name")] = "NAME",
			[hash("lbl_crew_role")] = "ROLE",
			[hash("lbl_crew_wage")] = "WAGE %",
			[hash("lbl_crew_earnings")] = "PERCENT EARNED:",
			
			[hash("lbl_jobs_type")] = "TYPE",
			[hash("lbl_jobs_region")] = "REGION",
			[hash("lbl_jobs_wage")] = "WAGE",
			
			[hash("lbl_travel_core")] = "CORE WORLDS",
			[hash("lbl_travel_frontier")] = "FRONTIER",
			[hash("lbl_travel_rim")] = "OUTER RIM",

			-- events
			[hash("distress_signal_true/signal_detected")] = "You have detected an emergency signal from a nearby vessel. Someone may be in trouble. Or they are setting an ambush...",
			[hash("distress_signal_true/signal_missed")] = "Nothing of importance happened during travel.",
			[hash("distress_signal_true/signal_ignored")] = "Whoever sent the signal will have to fend for themselves.",
			[hash("distress_signal_true/crew_rescued")] = "You find a damaged vessel and rescue one of its crew. They agree to join you.",
			[hash("distress_signal_true/no_survivors")] = "There's nothing you can do to help here. There are no survivors and nothing of value.",
			
			[hash("distress_signal_true/link/investigate")] = "Investigate",
			[hash("distress_signal_true/link/ignore")] = "Ignore",
		},
		names = {
			[hash("male")] = {
				[hash("mal")] = "Mal", [hash("wash")] = "Wash", [hash("simon")] = "Simon", [hash("jean_luc")] = "Jean-Luc",
				[hash("wolf")] = "Wolf", [hash("wesley")] = "Wesley", [hash("crusher")] = "Crusher", [hash("chekov")] = "Chekov",
				[hash("geordi")] = "Geordi", [hash("scott")] = "Scott", [hash("odo")] = "Odo", [hash("quark")] = "Quark",
				[hash("garrus")] = "Garrus", [hash("korben")] = "Korben", [hash("cornelius")] = "Cornelius",
				[hash("ziggy")] = "Ziggy", [hash("tom")] = "Tom", [hash("reed")] = "Reed", [hash("flash")] = "Flash",
				[hash("ace")] = "Ace", [hash("gordon")] = "Gordon", [hash("memnon")] = "Memnon", [hash("cutter")] = "Cutter",
				[hash("mathesar")] = "Mathesar", [hash("rimmer")] = "Rimmer", [hash("lister")] = "Lister", [hash("spiff")] = "Spiff",
				[hash("ijon")] = "Ijon", [hash("kaidan")] = "Kaidan", [hash("jacob")] = "Jacob"
			},
			[hash("female")] = {
				[hash("nyota")] = "Nyota", [hash("deanna")] = "Deanna", [hash("kira")] = "Kira", [hash("kim")] = "Kim",
				[hash("cat")] = "Cat", [hash("holly")] = "Holly", [hash("tali")] = "Tali", [hash("ruby")] = "Ruby",
				[hash("beverley")] = "Beverley", [hash("jinx")] = "Jinx", [hash("jovia")] = "Jovia", [hash("inara")] = "Inara",
				[hash("kaylee")] = "Kaylee", [hash("zoe")] = "Zoe", [hash("river")] = "River", [hash("tawny")] = "Tawny",
				[hash("trishka")] = "Trishka", [hash("miranda")] = "Miranda", [hash("kasumi")] = "Kasumi", [hash("kelly")] = "Kelly"
			},
			[hash("both")] = {
				[hash("jayne")] = "Jayne", [hash("book")] = "Book", [hash("shepard")] = "Shepard", [hash("picard")] = "Picard",
				[hash("riker")] = "Riker", [hash("kirk")] = "Kirk", [hash("mccoy")] = "McCoy", [hash("janeway")] = "Janeway",
				[hash("laforge")] = "LaForge", [hash("obrien")] = "O'Brien", [hash("uhura")] = "Uhura", [hash("bashir")] = "Bashir",
				[hash("dax")] = "Dax", [hash("paris")] = "Paris", [hash("torres")] = "Torres", [hash("kochanski")] = "Kochanski",
				[hash("holister")] = "Holister", [hash("reynolds")] = "Reynolds", [hash("ripley")] = "Ripley",
				[hash("dallas")] = "Dallas", [hash("ashley")] = "Ashley", [hash("brannigan")] = "Brannigan", [hash("solo")] = "Solo",
				[hash("carlissan")] = "Carlissan", [hash("jameson")] = "Jameson", [hash("ripcord")] = "Ripcord",
				[hash("archer")] = "Archer", [hash("quill")] = "Quill", [hash("buzz")] = "Buzz", [hash("einsenhorn")] = "Eisenhorn",
				[hash("gaunt")] = "Gaunt", [hash("sanchez")] = "Sanchez", [hash("batty")] = "Batty", [hash("richards")] = "Richards",
				[hash("storm")] = "Storm", [hash("grimm")] = "Grimm", [hash("vanderbeam")] = "Vanderbeam",
				[hash("edgewise")] = "Edgewise", [hash("quine")] = "Quine", [hash("starr")] = "Starr", [hash("taggart")] = "Taggart",
				[hash("madison")] = "Madison", [hash("lazarus")] = "Lazarus", [hash("chen")] = "Chen", [hash("laredo")] = "Laredo",
				[hash("sarris")] = "Sarris", [hash("grayson")] = "Grayson", [hash("hunt")] = "Hunt", [hash("sarrano")] = "Sarrano",
				[hash("novak")] = "Novak", [hash("sato")] = "Sato", [hash("troi")] = "Troi", [hash("adama")] = "Adama",
				[hash("thrace")] = "Thrace", [hash("tichy")] = "Tichy", [hash("lawson")] = "Lawson", [hash("chakwas")] = "Chakwas",
				[hash("moreau")] = "Moreau", [hash("taylor")] = "Taylor", [hash("goto")] = "Goto", [hash("massani")] = "Massani",
				[hash("chambers")] = "Chambers", [hash("vega")] = "Vega", [hash("cortez")] = "Cortez", [hash("traynor")] = "Traynor",
				[hash("denton")] = "Denton", [hash("raynor")] = "Raynor"
			}
		}
	}
}

return STR