GLOBAL_LIST_INIT(PoZ_verbs, list(
	/client/proc/check_zombies,
	/client/proc/toggle_day_night
	))
GLOBAL_PROTECT(PoZ_verbs)
GLOBAL_VAR_INIT(is_night_toggled, FALSE)
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

/client/proc/toggle_day_night()
	set name = "Toggle Day|Night"
	set category = "PoZ"
	if(!check_rights(R_ADMIN))
		return
	var/area/area = GLOB.areas_by_type[/area/centcom/interlink]
	for(var/turf/area_turf as anything in area.get_contained_turfs())
		for(var/obj/effect/light_emitter/light in area_turf)
			if(GLOB.is_night_toggled)
				light.set_light(4, 0.5, "#F9DFCF")
			else
				light.set_light(0.1, 0.1, "#BAACC7")
			stoplag()
	GLOB.is_night_toggled = !GLOB.is_night_toggled

/client/New()
	. = ..()
	PoZ_datum_set()


/client/proc/PoZ_datum_set()
	if(is_admin(src)) // admin with no mentor datum? let's fix that
		add_verb(src, GLOB.PoZ_verbs)

