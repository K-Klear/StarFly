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

			[hash("duty_guard")] = "Guard",
			[hash("duty_repair")] = "Repair",
			[hash("duty_standby")] = "Standby",
			[hash("duty_cleaning")] = "Cleaning",
			[hash("duty_other")] = "Something",
			[hash("duty_none")] = "None",

			[hash("cockpit")] = "Cockpit",
			[hash("cargo_hold")] = "Cargo hold",
			[hash("engine")] = "Engine bay",
			[hash("gun")] = "Gun emplacement",
			[hash("comms")] = "Communications",
			[hash("medbay")] = "Infirmary",
			[hash("bunk")] = "Bunk",
			[hash("empty")] = "Empty",
			[hash("mess")] = "Mess hall",
			

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

			[hash("and")] = "and",

			[hash("btn_yes")] = "YES",
			[hash("btn_no")] = "NO",

			[hash("out_of")] = "out of",

			-- time

			[hash("stardate")] = "Stardate",
			[hash("day")] = "day",
			[hash("days")] = "days",
			[hash("hour")] = "hour",
			[hash("hours")] = "hours",
			[hash("minute")] = "minute",
			[hash("minutes")] = "minutes",
			[hash("immediately")] = "Immediately",

			
			-- buttons
			[hash("btn_ok")] = "OK",
			
			[hash("btn_buy")] = "BUY",
			[hash("btn_repair")] = "REPAIR",
			[hash("btn_upgrade")] = "UPGRADE",
			[hash("btn_recruit")] = "RECRUIT",
			[hash("btn_crew")] = "CREW",
			[hash("btn_jobs")] = "JOBS",
			[hash("btn_travel")] = "TRAVEL",
			[hash("btn_continue")] = "CONTINUE",
			[hash("btn_land")] = "LAND",

			[hash("btn_recruit_interview")] = "INTERVIEW",
			[hash("btn_recruit_hire")] = "HIRE",

			[hash("btn_crew_set_leave")] = "SET",
			
			[hash("btn_crew_background")] = "About",
			[hash("btn_crew_talk")] = "Talk",
			[hash("btn_crew_dismiss")] = "Dismiss",
			[hash("btn_crew_plus")] = "+",
			[hash("btn_crew_minus")] = "-",
			[hash("btn_crew_confirm")] = "Confirm",

			[hash("btn_crew_duty_none")] = "NONE",

			[hash("btn_crew_talk")] = "TALK",
			[hash("btn_crew_role")] = "SET ROLE",
			
			[hash("btn_jobs_accept")] = "ACCEPT",

			[hash("btn_travel_explore")] = "EXPLORE",
			[hash("btn_travel_mission")] = "MISSION",
			[hash("btn_travel_set_time")] = "SET TIME",

			[hash("btn_jettison_cargo")] = "Jettison",

			[hash("btn_comms_distress_signal")] = "Send a distress signal",

			[hash("btn_error_ok")] = "OK",
			[hash("btn_event_done")] = "DONE",
			[hash("btn_accept")] = "ACCEPT",
			[hash("btn_cancel")] = "CANCEL",

			[hash("btn_clock_normal")] = "1x",
			[hash("btn_clock_fast")] = "10x",
			[hash("btn_clock_faster")] = "100x",
			[hash("btn_clock_fastest")] = "5000x",
			
			-- dialog titles
			[hash("title_buy")] = "BUY",
			[hash("title_repair")] = "REPAIR",
			[hash("title_upgrade")] = "UPGRADE",
			[hash("title_recruit")] = "RECRUIT",
			[hash("title_crew")] = "CREW",
			[hash("title_jobs")] = "AVAILABLE JOBS",
			[hash("title_travel")] = "TRAVEL",

			[hash("title_leave_duration_selection")] = "Set leave duration",

			[hash("title_crew_duty")] = "Assign duties",

			[hash("title_travel_confirm")] = "Confirm destination",

			[hash("title_cargo_overview")] = "Cargo hold",

			[hash("title_assign_room")] = "Assign room",

			[hash("job_selection")] = "Select mission",

			[hash("title_role_selection")] = "Assign a new role",

			[hash("title_departure_time_selection")] = "Choose time to depart",
			[hash("title_departure_ready")] = "Ready for take-off",

			[hash("title_error_no_crew")] = "You have no crew!",
			[hash("title_error_crew_full")] = "You don't have room for more crew!",
			[hash("title_error_no_recruits")] = "There is nobody here to recruit.",
			[hash("title_error_no_jobs")] = "There are no jobs available here.",
			[hash("title_error_no_fuel")] = "You don't have enough fuel!",
			[hash("title_error_no_food")] = "You don't have enough rations!",
			[hash("title_error_no_pilot")] = "You must assign a pilot!",
			[hash("title_error_no_comms")] = "There's nobody at the radio!",
			[hash("title_error_not_enough_money")] = "You don't have enough money!",
			[hash("title_error_fully_stocked")] = "You are already fully stocked!",
			[hash("error_cargo_hold_full")] = "Cargo hold is full!",

			-- dialog labels
			[hash("lbl_info_fuel")] = "FUEL:",
			[hash("lbl_info_food")] = "RATIONS:",
			[hash("lbl_info_money")] = "CREDITS:",

			[hash("lbl_recruit_name")] = "NAME",

			[hash("lbl_crew_leave_duration")] = "Leave duration:",
			[hash("lbl_crew_duties")] = "DUTIES",
			[hash("lbl_crew_shipbound")] = "SHIPBOUND?",
			
			[hash("lbl_crew_name")] = "NAME",
			[hash("lbl_crew_role")] = "ROLE",
			[hash("lbl_crew_wage")] = "WAGE %",
			[hash("lbl_crew_earnings")] = "PERCENT EARNED:",
			
			[hash("lbl_jobs_type")] = "TYPE",
			[hash("lbl_jobs_region")] = "REGION",
			[hash("lbl_jobs_wage")] = "WAGE",
			[hash("lbl_jobs_planet")] = "PLANET",
			
			[hash("lbl_travel_core")] = "CORE WORLDS",
			[hash("lbl_travel_frontier")] = "FRONTIER",
			[hash("lbl_travel_rim")] = "OUTER RIM",

			[hash("lbl_travel_destination")] = "Destination: ",
			[hash("lbl_travel_departure")] = "Departure: ",
			[hash("exploration")] = "EXPLORING",
			[hash("mission")] = "MISSION",
			[hash("lbl_travel_in_the")] = " IN THE ",

			[hash("lbl_cargo_type")] = "Type",
			[hash("lbl_cargo_number")] = "Amount",

			-- conversation
			[hash("talk_says")] = " says:",
			[hash("talk_I")] = "I",
			[hash("talk_and")] = " and",

			[hash("talk_yes")] = {"OK", "Yes", "Fine", "Acknowledged", "Very well"},

			[hash("talk_greeting")] = {"Hello!", "Greetings.", "Nice to meet you.", "Hello there!", "Good day, Captain."},
			[hash("talk_my_name_is")] = {"I'm", "You can call me", "My name is", "They call me"},
			[hash("talk_no_skill")] = {"I'm not really skilled in anything in particular, but I can learn! ", "I'm afraid I'm not very skilled in anything. "},
			[hash("talk_captain")] = {"Captain", "Sir"},
			[hash("talk_we_need_to_talk")] = {"can we speak for a minute?", "there's something on my mind.", "I need to speak with you.", "can I talk to you?"},
			[hash("talk_its_about")] = {"It's about ", "I have a problem with ", "Something needs to be done about "},
			[hash("talk_among_other_things")] = {", among other things.", ". There are other issues too.", ", for starters."},
			
			[hash("talk_issue_wages")] = {"my wages", "what you promised to pay me", "my payment", "my share"},
			[hash("talk_issue_role")] = {"my role on the ship", "my function", "my assignment", "the work I do"},
			
			[hash("talk_we_can_talk")] = {"Do you need anything?", "What can I do for you?", "You wanted to talk?", "Something on your mind?"},
			[hash("talk_im_fine")] = {"I'm fine."},
			[hash("talk_yes_captain")] = {"Captain.", "See you.", "I'll get back to work, then."},
			[hash("talk_issue_can_wait")] = {"We'll talk about it some other time.", "I'll bring it up later.", "It's not that pressing."},
			[hash("talk_issue_cannot_wait")] = {"It's very important to me.", "No, we need to talk. Now.", "I want to clear it up now."},
			
			[hash("talk_goal_fun")] = {"This place is boring. I want to have some fun. ", "I'm looking for some excitement. You wouldn't believe how boring colony life can be. "},
			[hash("talk_goal_travel")] = {"I want to see all the universe has to offer. ", "I just want to see the stars. "},
			[hash("talk_goal_work")] = {"It's impossible to find a job here. Joining your crew might be my last chance. ", "Frankly? I'm after the money. I will get paid, right? ", "Honest work for honest pay, that's what I'm looking for. "},
			[hash("talk_goal_home")] = {"I want to find a place where I belong. A place I could call a home. ", "I've been drifting from place to place for too long. It's time for me to find a home."},
			[hash("talk_goal_running")] = {"Someone is after me. I need to vanish. ", "I've crossed someone. I need to get far away from here. ", "I made some mistakes. I have to run."},

			[hash("talk_wage_percent")] = {"% of the take", "%", "% of what we earn"},
			[hash("talk_wage_offer")] = {"I deserve at least ", "I think a fair wage would be ", "I'm expecting at least ", "I'm easily worth ", "You should pay me "},
			[hash("talk_wage_negotiate")] = {"I'm willing to compromise.", "I'm open to negotiations."},
			[hash("talk_wage_final_offer")] = {"That's my final offer", "That's as low as I can go.", "Take it or leave it.", "I can't really accept anything lower than that."},
			[hash("talk_wage_food_only")] = {"I'm willing to work just for food.", "You won't even have to pay me."},
			[hash("talk_wage_concession")] = {"Fine. ", "You got me. ", "I'm not happy about it, but OK. "},
			[hash("talk_wage_lower_offer")] = {"I'll take ", "I can take just ", "I can live with just "},
			[hash("talk_wage_lower_wage_impossible")] = {"I said you don't have to pay me!", "It's literally impossible to go any lower.", "How is food and shelter too much?"},

			[hash("talk_qualifier_none")] = {" don't know anything about", " have no clue when it comes to"},
			[hash("talk_qualifier_terrible")] = {" suck at", "'m terrible at", " don't have much experience with"},
			[hash("talk_qualifier_poor")] = {" have some basic expertise at", " know a little about"},
			[hash("talk_qualifier_average")] = {"'m competent at", "'m decent enough at"},
			[hash("talk_qualifier_good")] = {"'m good at", " won't let you down when"},
			[hash("talk_qualifier_great")] = {"'m excellent at", " know a lot about"},
			[hash("talk_qualifier_top")] = {"'m the best at", "'m the elite when it comes to", " know everything about", " 'm a master of"},

			[hash("talk_role_pilot")] = {"flying", "piloting", "helming the ship"},
			[hash("talk_role_mech")] = {"mechanics", "engineering", "keeping the machine in one piece"},
			[hash("talk_role_medic")] = {"keeping people healthy", "treating injuries", "healing duties", "medicine"},
			[hash("talk_role_gunner")] = {"shooting stuff out of the sky", "manning the big gun", "exploding enemies", "turning enemy ships into stardust"},
			[hash("talk_role_comms")] = {"using comm systems", "using the radio", "communications"},

			[hash("talk/recruitment/link/skills")] = "Tell me more about your skills.",
			[hash("talk/recruitment/link/wages")] = "Let's talk wages.",
			[hash("talk/recruitment/link/not_hired")] = "Sorry. Not interested.",
			[hash("talk/recruitment/link/wage_negotiate")] = "That's too much.",
			[hash("talk/recruitment/link/hired")] = "You're hired!",

			[hash("talk/crew_talk_general/link/about")] = "Tell me about yourself.",
			[hash("talk/crew_talk_general/link/skills")] = "Tell me what you can do.",
			[hash("talk/crew_talk_general/link/how_are_you")] = "How are you feeling today?",
			[hash("talk/crew_talk_general/link/carry_on")] = "That will be all for now.",
			
			[hash("talk/crew_talk_general/link/what_is_it")] = "What's the problem?",
			[hash("talk/crew_talk_general/link/can_it_wait")] = "Can it wait?",
			[hash("talk/crew_talk_general/link/not_now")] = "Not right now.",
			[hash("talk/crew_talk_general/link/let_us_talk")] = "There's something I wanted to ask.",
			

			[hash("talk_hired")] = {"Thank you, Captain!", "I'm looking forward to working with you.", "Great. Thanks for having me."},
			[hash("talk_not_hired")] = {"I'll be here if you change your mind."},

			[hash("talk_not_implemented")] = {"This part of the conversation tree is not yet implemented, captain."},
			
			-- events
			[hash("flight_nonevent/no_event")] = "Flight event happened and have been dealt with.",
			[hash("orbit_nonevent/no_event")] = "Orbit event happened and have been dealt with.",
			[hash("landing_nonevent/no_event")] = "Landing event happened and have been dealt with.",
			
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
				[hash("ijon")] = "Ijon", [hash("kaidan")] = "Kaidan", [hash("jacob")] = "Jacob", [hash("arthur")] = "Arthur",
				[hash("zaphod")] = "Zaphod", [hash("marvin")] = "Marvin", [hash("jebediah")] = "Jebediah", [hash("bill")] = "Bill",
				[hash("bob")] = "Bob",
			},
			[hash("female")] = {
				[hash("nyota")] = "Nyota", [hash("deanna")] = "Deanna", [hash("kira")] = "Kira", [hash("kim")] = "Kim",
				[hash("cat")] = "Cat", [hash("holly")] = "Holly", [hash("tali")] = "Tali", [hash("ruby")] = "Ruby",
				[hash("beverley")] = "Beverley", [hash("jinx")] = "Jinx", [hash("jovia")] = "Jovia", [hash("inara")] = "Inara",
				[hash("kaylee")] = "Kaylee", [hash("zoe")] = "Zoe", [hash("river")] = "River", [hash("tawny")] = "Tawny",
				[hash("trishka")] = "Trishka", [hash("miranda")] = "Miranda", [hash("kasumi")] = "Kasumi", [hash("kelly")] = "Kelly",
				[hash("tricia")] = "Tricia", [hash("valentina")] = "Valentina"
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
				[hash("denton")] = "Denton", [hash("raynor")] = "Raynor", [hash("dent")] = "Dent", [hash("Prefect")] = "Prefect",
				[hash("mcmillan")] = "McMillan"
			}
		},
		planets = {
			[hash("Abydos")] = "Abydos",
			[hash("Aegis")] = "Aegis",
			[hash("Aerilon")] = "Aerilon",
			[hash("Aldabra")] = "Aldabra",
			[hash("Aldebaran")] = "Aldebaran",
			[hash("Altair")] = "Altair",
			[hash("Amel")] = "Amel",
			[hash("Antar")] = "Antar",
			[hash("Arieka")] = "Arieka",
			[hash("Arrakis")] = "Arrakis",
			[hash("Athena")] = "Athena",
			[hash("Athos")] = "Athos",
			[hash("Aurelia")] = "Aurelia",
			[hash("Auriga")] = "Auriga",
			[hash("Avalon")] = "Avalon",
			[hash("Balaho")] = "Balaho",
			[hash("Ballybran")] = "Ballybran",
			[hash("Belzagor")] = "Belzagor",
			[hash("Bronson")] = "Bronson",
			[hash("Caladan")] = "Caladan",
			[hash("Caprica")] = "Caprica",
			[hash("Castiana")] = "Castiana",
			[hash("Celeschul")] = "Celeschul",
			[hash("Chiron")] = "Chiron",
			[hash("Chorus")] = "Chorus",
			[hash("Chthon")] = "Chthon",
			[hash("Corneria")] = "Corneria",
			[hash("Coruscant")] = "Coruscant",
			[hash("Creck")] = "Creck",
			[hash("Cyteen")] = "Cyteen",
			[hash("Darwin")] = "Darwin",
			[hash("Dekuuna")] = "Dekuuna",
			[hash("Doisac")] = "Doisac",
			[hash("Demeter")] = "Demeter",
			[hash("Deucalion")] = "Deucalion",
			[hash("Dosadi")] = "Dosadi",
			[hash("Eayn")] = "Eayn",
			[hash("Erna")] = "Erna",
			[hash("Erythro")] = "Erythro",
			[hash("Etheria")] = "Etheria",
			[hash("Fhloston")] = "Fhloston",
			[hash("Finisterre")] = "Finisterre",
			[hash("Fiorina")] = "Fiorina",
			[hash("Fortuna")] = "Fortuna",
			[hash("Furya")] = "Furya",
			[hash("Gallifrey")] = "Gallifrey",
			[hash("Ganesha")] = "Ganesha",
			[hash("Gehenna")] = "Gehenna",
			[hash("Genesis")] = "Genesis",
			[hash("Ghibalb")] = "Ghibalb",
			[hash("Gor")] = "Gor",
			[hash("Gorta")] = "Gorta",
			[hash("Gurun")] = "Gurun",
			[hash("Helghan")] = "Helghan",
			[hash("Helliconia")] = "Helliconia",
			[hash("Hesduros")] = "Hesduros",
			[hash("Hesikos")] = "Hesikos",
			[hash("Hiigara")] = "Hiigara",
			[hash("Hocotate")] = "Hocotate",
			[hash("Iomere")] = "Iomere",
			[hash("Ireta")] = "Ireta",
			[hash("Ishtar")] = "Ishtar",
			[hash("Iszm")] = "Iszm",
			[hash("Kaelarot")] = "Kaelarot",
			[hash("Karava")] = "Karava",
			[hash("Kerbin")] = "Kerbin",
			[hash("Kharak")] = "Kharak",
			[hash("Kobol")] = "Kobol",
			[hash("Kregen")] = "Kregen",
			[hash("Krishna")] = "Krishna",
			[hash("Krull")] = "Krull",
			[hash("Kulkulkan")] = "Kulkulkan",
			[hash("Kulthea")] = "Kulthea",
			[hash("Kyrian")] = "Kyrian",
			[hash("Lagash")] = "Lagash",
			[hash("Leera")] = "Leera",
			[hash("Lithia")] = "Lithia",
			[hash("Acheron")] = "Acheron",
			[hash("Maethrillian")] = "Maethrillian",
			[hash("Magrathea")] = "Magrathea",
			[hash("Majipoor")] = "Majipoor",
			[hash("Malurok")] = "Malurok",
			[hash("Medea")] = "Medea",
			[hash("Melmac")] = "Melmac",
			[hash("Metaluna")] = "Metaluna",
			[hash("Midkemia")] = "Midkemia",
			[hash("Minerva")] = "Minerva",
			[hash("Miron")] = "Miron",
			[hash("Mongo")] = "Mongo",
			[hash("Muloqt")] = "Muloqt",
			[hash("Nacre")] = "Nacre",
			[hash("Nibiru")] = "Nibiru",
			[hash("Nidor")] = "Nidor",
			[hash("Nihil")] = "Nihil",
			[hash("Nirn")] = "Nirn",
			[hash("Nessus")] = "Nessus",
			[hash("Oa")] = "Oa",
			[hash("Omicron")] = "Omicron",
			[hash("Ormazd")] = "Ormazd",
			[hash("Orthe")] = "Orthe",
			[hash("Oth")] = "Oth",
			[hash("Palamok")] = "Palamok",
			[hash("Pandarve")] = "Pandarve",
			[hash("Pandora")] = "Pandora",
			[hash("Pax")] = "Pax",
			[hash("Perdide")] = "Perdide",
			[hash("Pern")] = "Pern",
			[hash("Petaybee")] = "Petaybee",
			[hash("Pharagos")] = "Pharagos",
			[hash("Picon")] = "Picon",
			[hash("Prysmos")] = "Prysmos",
			[hash("Pyrrus")] = "Pyrrus",
			[hash("Reach")] = "Reach",
			[hash("Regis")] = "Regis",
			[hash("Remulak")] = "Remulak",
			[hash("Requiem")] = "Requiem",
			[hash("Reverie")] = "Reverie",
			[hash("Rubanis")] = "Rubanis",
			[hash("Rylos")] = "Rylos",
			[hash("Ryn")] = "Ryn",
			[hash("Sanghelios")] = "Sanghelios",
			[hash("Sangre")] = "Sangre",
			[hash("Seiren")] = "Seiren",
			[hash("Sera")] = "Sera",
			[hash("Shikasta")] = "Shikasta",
			[hash("Shora")] = "Shora",
			[hash("Skaro")] = "Skaro",
			[hash("Solaris")] = "Solaris",
			[hash("Soror")] = "Soror",
			[hash("Stroggos")] = "Stroggos",
			[hash("Suen")] = "Suen",
			[hash("Tallon")] = "Tallon",
			[hash("Tanis")] = "Tanis",
			[hash("Targ")] = "Targ",
			[hash("Tau")] = "Tau",
			[hash("Tencton")] = "Tencton",
			[hash("Terminus")] = "Terminus",
			[hash("Thalassa")] = "Thalassa",
			[hash("Thra")] = "Thra",
			[hash("Thessia")] = "Thessia",
			[hash("Thoth")] = "Thoth",
			[hash("Tiamat")] = "Tiamat",
			[hash("Tormance")] = "Tormance",
			[hash("Tralfamadore")] = "Tralfamadore",
			[hash("Tran")] = "Tran",
			[hash("Tranai")] = "Tranai",
			[hash("Trantor")] = "Trantor",
			[hash("Tristane")] = "Tristane",
			[hash("Tschai")] = "Tschai",
			[hash("Tuchanka")] = "Tuchanka",
			[hash("Ulgethon")] = "Ulgethon",
			[hash("Valyanop")] = "Valyanop",
			[hash("Vekta")] = "Vekta",
			[hash("Vishnu")] = "Vishnu",
			[hash("Vhilinyar")] = "Vhilinyar",
			[hash("Worlorn")] = "Worlorn",
			[hash("Zahir")] = "Zahir",
			[hash("Zarathustra")] = "Zarathustra",
			[hash("Zarkon")] = "Zarkon",
			[hash("Zavron")] = "Zavron",
			[hash("Zebes")] = "Zebes",
			[hash("Zeist")] = "Zeist",
			[hash("Zillikian")] = "Zillikian",
			[hash("Zyrgon")] = "Zyrgon"
		}
	}
}

function STR.STRING(input, id)
	local str = ""
	if type(input) == "table" then
		for key, val in ipairs(input) do
			str = str..STR.STRING(val, id)
		end
	elseif type(input) == "function" then
		str = str..STR.STRING({input(id)})
	elseif type(input) == "number" or type(input) == "string" then
		str = str..input
	else
		local val = STR.en.ui[input] or STR.en.planets[input]
		if type(val) == "string" or type(val) == "number" then
			str = str..val
		elseif type(val) == "table" then
			str = str..val[math.random(1, #val)]
		elseif input then
			print("Unknown string:", input)
			str = str.."//bad_string//"
			--error("Unexpected type in the lookup table! "..type(val))
		end
	end
	return str
end

STR.titles = {}

function STR.save_title(title)
	if title == hash("") then return title end
	local id = 0
	repeat
		id = id + 1
	until not STR.titles[hash(id)]
	STR.titles[hash(id)] = STR.STRING(title)
	return hash(id)
end

return STR