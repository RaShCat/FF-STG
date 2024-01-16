/* /mob/living/simple_animal/hostile/zombie
	name = "Shambling Corpse"
	desc = "When there is no more room in hell, the dead will walk in outer space."
	icon = 'icons/mob/simple/simple_human.dmi'
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	speak_chance = 0
	stat_attack = HARD_CRIT //braains
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 21
	melee_damage_upper = 21
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	attack_vis_effect = ATTACK_EFFECT_BITE
	combat_mode = TRUE
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_plas" = 0, "max_plas" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	status_flags = CANPUSH
	death_message = "collapses, flesh gone in a pile of bones!"
	del_on_death = TRUE
	loot = list(/obj/effect/decal/remains/human)*/

/mob/living/simple_animal/hostile/zombie
	maxHealth = 200
	health = 200
	faction = list(ROLE_MUTANT)
	unique_name = TRUE
	initial_language_holder = /datum/language_holder/empty
	stat_attack = HARD_CRIT
	robust_searching = TRUE
	footstep_type = FOOTSTEP_MOB_CLAW
	wound_bonus = -5
	bare_wound_bonus = 10
	sharpness = SHARP_EDGED

/mob/living/simple_animal/hostile/zombie/assistant/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/wall_tearer, tear_time = 14 SECONDS, reinforced_multiplier = 1000, do_after_key = "DOAFTER_SOURCE_EVENT_ZOMBIE_INTERACTION")

/mob/living/simple_animal/hostile/zombie/engineer/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/wall_tearer, tear_time = 7 SECONDS, reinforced_multiplier = 1000, do_after_key = "DOAFTER_SOURCE_EVENT_ZOMBIE_INTERACTION")

/mob/living/simple_animal/hostile/zombie/doctor/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/regenerator, \
		regeneration_delay = 6 SECONDS, \
		brute_per_second = 5, \
		heals_wounds = TRUE, \
	)

/mob/living/simple_animal/hostile/zombie/doctor
	speed = 0.8
	outfit = /datum/outfit/zombie/doctor

/mob/living/simple_animal/hostile/zombie/clown
	speed = 5
	melee_damage_lower = 1
	melee_damage_upper = 55
	maxHealth = 750
	health = 750
	attack_verb_continuous = "honks"
	attack_verb_simple = "honk"
	attack_sound = 'sound/items/bikehorn.ogg'

	outfit = /datum/outfit/zombie/clown

/mob/living/simple_animal/hostile/zombie/engineer
	outfit = /datum/outfit/zombie/engineer

/mob/living/simple_animal/hostile/zombie/assistant
	speed = 0.5
	outfit = /datum/outfit/zombie/assistant

/datum/outfit/zombie
	ears = /obj/item/radio/headset
	var/icon = 'icons/hud/radial_ctf.dmi'
	var/icon_state = "ctf_rifleman"
	var/class_description = "Nothing to say!"

/datum/outfit/zombie/doctor
	name = "Doctor"
	class_description = "Доктор... он тоже лечит. Но уже вас, от жизни."
	suit = /obj/item/clothing/suit/toggle/labcoat
	uniform = /obj/item/clothing/under/rank/medical/doctor
	shoes = /obj/item/clothing/shoes/sneakers/white
	back = /obj/item/storage/backpack/medic

/datum/outfit/zombie/assistant
	name = "Assistant"
	class_description = "Ассистушка... Изольки и маска... Любой парашиз первым делом надевает газмаску и изольки..."
	mask = /obj/item/clothing/mask/gas
	uniform = /obj/item/clothing/under/color/grey
	shoes = /obj/item/clothing/shoes/sneakers/black
	back = /obj/item/storage/backpack
	gloves = /obj/item/clothing/gloves/color/yellow

/datum/outfit/zombie/engineer
	name = "Engineer"
	class_description = "Сильный зомби. Устал ломать стены. Теперь он будет их ломать!"
	uniform = /obj/item/clothing/under/rank/engineering/engineer
	belt = /obj/item/storage/belt/utility/full/engi
	ears = /obj/item/radio/headset/headset_eng
	head = /obj/item/clothing/head/utility/hardhat
	shoes = /obj/item/clothing/shoes/workboots

/datum/outfit/zombie/clown
	name = "Clown"
	class_description = "А это местный медленный танк. Нажрался трупов вот и жирный."
	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/cosmohonk
	mask = /obj/item/clothing/mask/gas/clown_hat
	internals_slot = ITEM_SLOT_SUITSTORE

/obj/machinery/zombie
	name = "Zombie grave"
	desc = "Zombie spawner, you know."
	icon = 'icons/obj/storage/crates.dmi'
	icon_state = "grave"
	density = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF



