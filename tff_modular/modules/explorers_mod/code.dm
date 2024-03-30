/datum/mod_theme/expeditior
	name = "NanoTrasen Expeditionary Corps MOD - \"Vanguard\" model"
	desc = "The \"Vanguard\" model is designed for primary reconnaissance and terrain clearing. Suitable for use in harsh environments. It has all the necessary systems for operation."
	default_skin = "expeditior"
	armor_type = /datum/armor/mod_theme_expeditior
	resistance_flags = FIRE_PROOF|ACID_PROOF
	atom_flags = PREVENT_CONTENTS_EXPLOSION_1
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	siemens_coefficient = 0
	complexity_max = DEFAULT_MAX_COMPLEXITY + 4
	slowdown_inactive = 0.50
	slowdown_active = 0.20
	allowed_suit_storage = list(
		/obj/item/ammo_box,
		/obj/item/ammo_casing,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
	)
	skins = list(
		"expeditior" = list(
			MOD_ICON_OVERRIDE = 'tff_modular/modules/explorers_mod/icons/exp_mod_icon.dmi',
			MOD_WORN_ICON_OVERRIDE = 'tff_modular/modules/explorers_mod/icons/exp_mod_worn.dmi',
			HELMET_FLAGS = list(
				UNSEALED_LAYER = null,
				UNSEALED_CLOTHING = SNUG_FIT|THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE|HEADINTERNALS,
				UNSEALED_INVISIBILITY = HIDEEARS|HIDEHAIR,
				SEALED_INVISIBILITY = HIDEFACIALHAIR|HIDEMASK|HIDEEYES|HIDEFACE|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
			),
			CHESTPLATE_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
			),
			GAUNTLETS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
			),
			BOOTS_FLAGS = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
			),
		),
	)

/datum/armor/mod_theme_expeditior
	melee = 30
	bullet = 30
	laser = 25
	energy = 60
	bomb = 55
	bio = 100
	fire = 80
	acid = 90
	wound = 10

/obj/item/mod/control/pre_equipped/expeditior
	worn_icon = 'tff_modular/modules/explorers_mod/icons/exp_mod_worn.dmi'
	icon = 'tff_modular/modules/explorers_mod/icons/exp_mod_icon.dmi'
	icon_state = "expeditior-control"
	theme = /datum/mod_theme/expeditior
	applied_cell = /obj/item/stock_parts/cell/super
	applied_modules = list(
		/obj/item/mod/module/active_sonar,
		/obj/item/mod/module/status_readout,
		/obj/item/mod/module/jump_jet,
		/obj/item/mod/module/joint_torsion,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/quick_carry/advanced,
		/obj/item/mod/module/springlock/contractor,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/holster,
		/obj/item/mod/module/emp_shield/advanced,
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/shove_blocker,
	)
	default_pins = list(
		/obj/item/mod/module/jump_jet,
		/obj/item/mod/module/status_readout,
		/obj/item/mod/module/flashlight,
	)

/obj/item/mod/control/pre_equipped/expeditior/set_mod_skin(new_skin)
	. = ..()
	if(new_skin == "expeditior")
		helmet.worn_icon_muzzled = 'tff_modular/modules/explorers_mod/icons/exp_mod_worn_anthro.dmi'
		chestplate.worn_icon_digi = 'tff_modular/modules/explorers_mod/icons/exp_mod_worn_anthro.dmi'
		boots.worn_icon_digi = 'tff_modular/modules/explorers_mod/icons/exp_mod_worn_anthro.dmi'
