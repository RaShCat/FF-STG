GLOBAL_LIST_INIT(PoZ_verbs, list(
	/client/proc/check_zombies,
	/client/proc/toggle_day_night
	))
GLOBAL_PROTECT(PoZ_verbs)
GLOBAL_VAR_INIT(is_night, FALSE)
GLOBAL_LIST_EMPTY(day_lights)

/obj/effect/light_emitter/interlink/Initialize(mapload)
	. = ..()
	GLOB.day_lights += src // Используем позже.

/client/proc/remove_PoZ_verbs()
	remove_verb(src, GLOB.PoZ_verbs)


/client/proc/check_zombies()
	set name = "Check Zombies"
	set category = "PoZ"
	if(!check_rights(R_ADMIN))
		return
	to_chat(world, span_warning("Zombies: + [length(GLOB.zombie_list)]"))

/client/proc/toggle_day_night()
	var/started = FALSE
	set name = "Toggle Day|Night"
	set category = "PoZ"
	if(!check_rights(R_ADMIN))
		return
	if(started)
		return
	started = TRUE
	var/area/area = GLOB.areas_by_type[/area/centcom/interlink]
	for (var/list/zlevel_turfs as anything in area.get_zlevel_turf_lists())
		for(var/turf/area_turf as anything in zlevel_turfs)
			if(GLOB.is_night)
				for(var/mob/living/simple_animal/hostile/zombie/z in area_turf)
					to_chat(z, span_warning("Oh. It was a sunlight!"))
					z.dust(TRUE)
			for(var/obj/effect/light_emitter/light in area_turf)
				if(GLOB.is_night)
					light.set_light(4, 0.5, "#F9DFCF")
				else
					light.set_light(0.1, 0.1, "#BAACC7")
				stoplag()
	GLOB.is_night = !GLOB.is_night
	if(!GLOB.is_night)
		for(var/mob/living/simple_animal/hostile/zombie/z in GLOB.zombie_under_sunlight)
			to_chat(z, span_warning("Oh. It was a sunlight!"))
			GLOB.zombie_under_sunlight -= z
			z.dust(TRUE)
	started = FALSE

/client/New()
	. = ..()
	PoZ_datum_set()


/client/proc/PoZ_datum_set()
	if(is_admin(src)) // admin with no mentor datum? let's fix that
		add_verb(src, GLOB.PoZ_verbs)

