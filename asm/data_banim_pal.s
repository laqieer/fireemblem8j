	.section .data.data_banim_pal, "aw", %progbits
	.align 2
@ Character battle-anim palettes (banim_pal_*), JP bytes 0x08ef9000..0x08efb2e0.
@ Region-different content (4 localized bytes) at boundaries pinned by the
@ region-same banim_pal_chara table; incbinned from baserom.gba (tier-2 asset).
	.global banim_pal_mer
banim_pal_mer:
	.incbin "baserom.gba", 0xEF9000, 0x54
	.global banim_pal_ame
banim_pal_ame:
	.incbin "baserom.gba", 0xEF9054, 0x68
	.global banim_pal_gil
banim_pal_gil:
	.incbin "baserom.gba", 0xEF90BC, 0x6C
	.global banim_pal_bre
banim_pal_bre:
	.incbin "baserom.gba", 0xEF9128, 0x6C
	.global banim_pal_saa
banim_pal_saa:
	.incbin "baserom.gba", 0xEF9194, 0x6C
	.global banim_pal_mar
banim_pal_mar:
	.incbin "baserom.gba", 0xEF9200, 0x68
	.global banim_pal_com
banim_pal_com:
	.incbin "baserom.gba", 0xEF9268, 0x50
	.global banim_pal_jho
banim_pal_jho:
	.incbin "baserom.gba", 0xEF92B8, 0x64
	.global banim_pal_bon
banim_pal_bon:
	.incbin "baserom.gba", 0xEF931C, 0x64
	.global banim_pal_baz
banim_pal_baz:
	.incbin "baserom.gba", 0xEF9380, 0x64
	.global banim_pal_ass
banim_pal_ass:
	.incbin "baserom.gba", 0xEF93E4, 0x5C
	.global banim_pal_nat
banim_pal_nat:
	.incbin "baserom.gba", 0xEF9440, 0x5C
	.global banim_pal_mul
banim_pal_mul:
	.incbin "baserom.gba", 0xEF949C, 0x5C
	.global banim_pal_irv
banim_pal_irv:
	.incbin "baserom.gba", 0xEF94F8, 0x5C
	.global banim_pal_ewa
banim_pal_ewa:
	.incbin "baserom.gba", 0xEF9554, 0x5C
	.global banim_pal_gar
banim_pal_gar:
	.incbin "baserom.gba", 0xEF95B0, 0x50
	.global banim_pal_ros
banim_pal_ros:
	.incbin "baserom.gba", 0xEF9600, 0x64
	.global banim_pal_xys
banim_pal_xys:
	.incbin "baserom.gba", 0xEF9664, 0x50
	.global banim_pal_doz
banim_pal_doz:
	.incbin "baserom.gba", 0xEF96B4, 0x54
	.global banim_pal_ros_2
banim_pal_ros_2:
	.incbin "baserom.gba", 0xEF9708, 0x54
	.global banim_pal_tet
banim_pal_tet:
	.incbin "baserom.gba", 0xEF975C, 0x50
	.global banim_pal_cug
banim_pal_cug:
	.incbin "baserom.gba", 0xEF97AC, 0x5C
	.global banim_pal_cug_2
banim_pal_cug_2:
	.incbin "baserom.gba", 0xEF9808, 0x5C
	.global banim_pal_gle
banim_pal_gle:
	.incbin "baserom.gba", 0xEF9864, 0x64
	.global banim_pal_kno
banim_pal_kno:
	.incbin "baserom.gba", 0xEF98C8, 0x54
	.global banim_pal_ewa_2
banim_pal_ewa_2:
	.incbin "baserom.gba", 0xEF991C, 0x54
	.global banim_pal_tur
banim_pal_tur:
	.incbin "baserom.gba", 0xEF9970, 0x54
	.global banim_pal_van
banim_pal_van:
	.incbin "baserom.gba", 0xEF99C4, 0x54
	.global banim_pal_syr
banim_pal_syr:
	.incbin "baserom.gba", 0xEF9A18, 0x50
	.global banim_pal_gar_2
banim_pal_gar_2:
	.incbin "baserom.gba", 0xEF9A68, 0x50
	.global banim_pal_ros_3
banim_pal_ros_3:
	.incbin "baserom.gba", 0xEF9AB8, 0x50
	.global banim_pal_one
banim_pal_one:
	.incbin "baserom.gba", 0xEF9B08, 0x50
	.global banim_pal_xys_2
banim_pal_xys_2:
	.incbin "baserom.gba", 0xEF9B58, 0x58
	.global banim_pal_mer_2
banim_pal_mer_2:
	.incbin "baserom.gba", 0xEF9BB0, 0x58
	.global banim_pal_ber
banim_pal_ber:
	.incbin "baserom.gba", 0xEF9C08, 0x40
	.global banim_pal_ame_2
banim_pal_ame_2:
	.incbin "baserom.gba", 0xEF9C48, 0x54
	.global banim_pal_gil_2
banim_pal_gil_2:
	.incbin "baserom.gba", 0xEF9C9C, 0x54
	.global banim_pal_vig
banim_pal_vig:
	.incbin "baserom.gba", 0xEF9CF0, 0x3C
	.global banim_pal_tir
banim_pal_tir:
	.incbin "baserom.gba", 0xEF9D2C, 0x3C
	.global banim_pal_for
banim_pal_for:
	.incbin "baserom.gba", 0xEF9D68, 0x6C
	.global banim_pal_fra
banim_pal_fra:
	.incbin "baserom.gba", 0xEF9DD4, 0x54
	.global banim_pal_gil_3
banim_pal_gil_3:
	.incbin "baserom.gba", 0xEF9E28, 0x54
	.global banim_pal_kyl
banim_pal_kyl:
	.incbin "baserom.gba", 0xEF9E7C, 0x54
	.global banim_pal_ame_3
banim_pal_ame_3:
	.incbin "baserom.gba", 0xEF9ED0, 0x50
	.global banim_pal_dus
banim_pal_dus:
	.incbin "baserom.gba", 0xEF9F20, 0x64
	.global banim_pal_aia
banim_pal_aia:
	.incbin "baserom.gba", 0xEF9F84, 0x3C
	.global banim_pal_lut
banim_pal_lut:
	.incbin "baserom.gba", 0xEF9FC0, 0x54
	.global banim_pal_ewa_3
banim_pal_ewa_3:
	.incbin "baserom.gba", 0xEFA014, 0x58
	.global banim_pal_xys_3
banim_pal_xys_3:
	.incbin "baserom.gba", 0xEFA06C, 0x58
	.global banim_pal_zon
banim_pal_zon:
	.incbin "baserom.gba", 0xEFA0C4, 0x3C
	.global banim_pal_ewa_4
banim_pal_ewa_4:
	.incbin "baserom.gba", 0xEFA100, 0x50
	.global banim_pal_lar
banim_pal_lar:
	.incbin "baserom.gba", 0xEFA150, 0x50
	.global banim_pal_lut_2
banim_pal_lut_2:
	.incbin "baserom.gba", 0xEFA1A0, 0x50
	.global banim_pal_cel
banim_pal_cel:
	.incbin "baserom.gba", 0xEFA1F0, 0x3C
	.global banim_pal_ass_2
banim_pal_ass_2:
	.incbin "baserom.gba", 0xEFA22C, 0x54
	.global banim_pal_jho_2
banim_pal_jho_2:
	.incbin "baserom.gba", 0xEFA280, 0x5C
	.global banim_pal_mar_2
banim_pal_mar_2:
	.incbin "baserom.gba", 0xEFA2DC, 0x5C
	.global banim_pal_ame_4
banim_pal_ame_4:
	.incbin "baserom.gba", 0xEFA338, 0x60
	.global banim_pal_for_2
banim_pal_for_2:
	.incbin "baserom.gba", 0xEFA398, 0x50
	.global banim_pal_set
banim_pal_set:
	.incbin "baserom.gba", 0xEFA3E8, 0x48
	.global banim_pal_fra_2
banim_pal_fra_2:
	.incbin "baserom.gba", 0xEFA430, 0x50
	.global banim_pal_kyl_2
banim_pal_kyl_2:
	.incbin "baserom.gba", 0xEFA480, 0x50
	.global banim_pal_ols
banim_pal_ols:
	.incbin "baserom.gba", 0xEFA4D0, 0x3C
	.global banim_pal_van_2
banim_pal_van_2:
	.incbin "baserom.gba", 0xEFA50C, 0x50
	.global banim_pal_tur_2
banim_pal_tur_2:
	.incbin "baserom.gba", 0xEFA55C, 0x50
	.global banim_pal_ros_4
banim_pal_ros_4:
	.incbin "baserom.gba", 0xEFA5AC, 0x50
	.global banim_pal_nat_2
banim_pal_nat_2:
	.incbin "baserom.gba", 0xEFA5FC, 0x64
	.global banim_pal_com_2
banim_pal_com_2:
	.incbin "baserom.gba", 0xEFA660, 0x54
	.global banim_pal_mul_2
banim_pal_mul_2:
	.incbin "baserom.gba", 0xEFA6B4, 0x5C
	.global banim_pal_ren
banim_pal_ren:
	.incbin "baserom.gba", 0xEFA710, 0x60
	.global banim_pal_lut_3
banim_pal_lut_3:
	.incbin "baserom.gba", 0xEFA770, 0x50
	.global banim_pal_ass_3
banim_pal_ass_3:
	.incbin "baserom.gba", 0xEFA7C0, 0x54
	.global banim_pal_ewa_5
banim_pal_ewa_5:
	.incbin "baserom.gba", 0xEFA814, 0x54
	.global banim_pal_kno_2
banim_pal_kno_2:
	.incbin "baserom.gba", 0xEFA868, 0x54
	.global banim_pal_mul_3
banim_pal_mul_3:
	.incbin "baserom.gba", 0xEFA8BC, 0x54
	.global banim_pal_sal
banim_pal_sal:
	.incbin "baserom.gba", 0xEFA910, 0x54
	.global banim_pal_ewa_6
banim_pal_ewa_6:
	.incbin "baserom.gba", 0xEFA964, 0x54
	.global banim_pal_kno_3
banim_pal_kno_3:
	.incbin "baserom.gba", 0xEFA9B8, 0x54
	.global banim_pal_nov
banim_pal_nov:
	.incbin "baserom.gba", 0xEFAA0C, 0x3C
	.global banim_pal_ewa_7
banim_pal_ewa_7:
	.incbin "baserom.gba", 0xEFAA48, 0x50
	.global banim_pal_kno_4
banim_pal_kno_4:
	.incbin "baserom.gba", 0xEFAA98, 0x48
	.global banim_pal_hea
banim_pal_hea:
	.incbin "baserom.gba", 0xEFAAE0, 0x54
	.global banim_pal_mer_3
banim_pal_mer_3:
	.incbin "baserom.gba", 0xEFAB34, 0x58
	.global banim_pal_ame_5
banim_pal_ame_5:
	.incbin "baserom.gba", 0xEFAB8C, 0x50
	.global banim_pal_fra_3
banim_pal_fra_3:
	.incbin "baserom.gba", 0xEFABDC, 0x50
	.global banim_pal_kyl_3
banim_pal_kyl_3:
	.incbin "baserom.gba", 0xEFAC2C, 0x50
	.global banim_pal_for_3
banim_pal_for_3:
	.incbin "baserom.gba", 0xEFAC7C, 0x50
	.global banim_pal_mur
banim_pal_mur:
	.incbin "baserom.gba", 0xEFACCC, 0x3C
	.global banim_pal_ish
banim_pal_ish:
	.incbin "baserom.gba", 0xEFAD08, 0x3C
	.global banim_pal_hey
banim_pal_hey:
	.incbin "baserom.gba", 0xEFAD44, 0x3C
	.global banim_pal_fad
banim_pal_fad:
	.incbin "baserom.gba", 0xEFAD80, 0x3C
	.global banim_pal_jho_3
banim_pal_jho_3:
	.incbin "baserom.gba", 0xEFADBC, 0x54
	.global banim_pal_mar_3
banim_pal_mar_3:
	.incbin "baserom.gba", 0xEFAE10, 0x54
	.global banim_pal_com_3
banim_pal_com_3:
	.incbin "baserom.gba", 0xEFAE64, 0x48
	.global banim_pal_car
banim_pal_car:
	.incbin "baserom.gba", 0xEFAEAC, 0x3C
	.global banim_pal_lar_2
banim_pal_lar_2:
	.incbin "baserom.gba", 0xEFAEE8, 0x64
	.global banim_pal_nat_3
banim_pal_nat_3:
	.incbin "baserom.gba", 0xEFAF4C, 0x64
	.global banim_pal_lar_3
banim_pal_lar_3:
	.incbin "baserom.gba", 0xEFAFB0, 0x54
	.global banim_pal_gar_3
banim_pal_gar_3:
	.incbin "baserom.gba", 0xEFB004, 0x50
	.global banim_pal_ros_5
banim_pal_ros_5:
	.incbin "baserom.gba", 0xEFB054, 0x50
	.global banim_pal_bin
banim_pal_bin:
	.incbin "baserom.gba", 0xEFB0A4, 0x3C
	.global banim_pal_tur_3
banim_pal_tur_3:
	.incbin "baserom.gba", 0xEFB0E0, 0x5C
	.global banim_pal_van_3
banim_pal_van_3:
	.incbin "baserom.gba", 0xEFB13C, 0x58
	.global banim_pal_cug_3
banim_pal_cug_3:
	.incbin "baserom.gba", 0xEFB194, 0x5C
	.global banim_pal_wal
banim_pal_wal:
	.incbin "baserom.gba", 0xEFB1F0, 0x3C
	.global banim_pal_geb
banim_pal_geb:
	.incbin "baserom.gba", 0xEFB22C, 0x3C
	.global banim_pal_pab
banim_pal_pab:
	.incbin "baserom.gba", 0xEFB268, 0x3C
	.global banim_pal_cet
banim_pal_cet:
	.incbin "baserom.gba", 0xEFB2A4, 0x3C
