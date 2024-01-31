/obj/machinery/zombie
	name = "Zombie grave"
	desc = "Zombie spawner, you know."
	icon = 'icons/obj/storage/crates.dmi'
	icon_state = "grave"
	density = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/zombie/spawner
	var/list/zombie_gear = list("Doctor" = /datum/outfit/zombie/doctor, "Assistant" = /datum/outfit/zombie/assistant, "Engineer" = /datum/outfit/zombie/engineer , "Clown" = /datum/outfit/zombie/clown)

/obj/machinery/zombie/spawner/Initialize(mapload)
	. = ..()
	SSpoints_of_interest.make_point_of_interest(src)

/obj/machinery/zombie/spawner/attack_ghost(mob/user)
	if(!SSticker.HasRoundStarted())
		to_chat(user, span_warning("Please wait until the round has started."))
		return

	to_chat(user, span_userdanger("You are now a member of ZOMBIES. Get the enemy BRAINS and EAT THEM!"))
	var/client/new_zombie = user.client
	spawn_team_member(new_zombie)

/obj/machinery/zombie/spawner/Topic(href, href_list)
	if(href_list["join"])
		var/mob/dead/observer/ghost = usr
		if(istype(ghost))
			attack_ghost(ghost)

/obj/machinery/zombie/spawner/proc/spawn_team_member(client/new_zombie)
	var/datum/outfit/chosen_class
	if(zombie_gear.len == 1) //no choices to make
		for(var/key in zombie_gear)
			chosen_class = zombie_gear[key]

	else //There's a choice to make, present a radial menu
		var/list/display_classes = list()

		for(var/key in zombie_gear)
			var/datum/outfit/zombie/class = zombie_gear[key]
			var/datum/radial_menu_choice/option = new
			option.image  = image(icon = initial(class.icon), icon_state = initial(class.icon_state))
			option.info = span_boldnotice("[initial(class.class_description)]")
			display_classes[key] = option
		sort_list(display_classes)
		var/choice = show_radial_menu(new_zombie.mob, src, display_classes, radius = 38)
		chosen_class = zombie_gear[choice]

	var/turf/spawn_point = pick(get_adjacent_open_turfs(get_turf(src)))
	switch(chosen_class)
		if(/datum/outfit/zombie/doctor)
			var/mob/living/simple_animal/hostile/zombie/doctor/player_mob = new(spawn_point)
			player_mob.ckey = new_zombie.ckey
		if(/datum/outfit/zombie/assistant)
			var/mob/living/simple_animal/hostile/zombie/assistant/player_mob = new(spawn_point)
			player_mob.ckey = new_zombie.ckey
		if(/datum/outfit/zombie/engineer)
			var/mob/living/simple_animal/hostile/zombie/engineer/player_mob = new(spawn_point)
			player_mob.ckey = new_zombie.ckey
		if(/datum/outfit/zombie/clown)
			var/mob/living/simple_animal/hostile/zombie/clown/player_mob = new(spawn_point)
			player_mob.ckey = new_zombie.ckey
