	.section .data.data_banim_pal, "aw", %progbits
	.align 2
@ Character battle-anim palettes (banim_pal_*), JP bytes 0x08ef9000..0x08efb2e0.
@ Region-different content (4 localized bytes) at boundaries pinned by the
@ region-same banim_pal_chara table; incbinned from baserom.gba (tier-2 asset).
	.global banim_pal_mer
banim_pal_mer:
	.incbin "data/residual/banim_pal_mer.bin"
	.global banim_pal_ame
banim_pal_ame:
	.incbin "data/residual/banim_pal_ame.bin"
	.global banim_pal_gil
banim_pal_gil:
	.incbin "data/residual/banim_pal_gil.bin"
	.global banim_pal_bre
banim_pal_bre:
	.incbin "data/residual/banim_pal_bre.bin"
	.global banim_pal_saa
banim_pal_saa:
	.incbin "data/residual/banim_pal_saa.bin"
	.global banim_pal_mar
banim_pal_mar:
	.incbin "data/residual/banim_pal_mar.bin"
	.global banim_pal_com
banim_pal_com:
	.incbin "data/residual/banim_pal_com.bin"
	.global banim_pal_jho
banim_pal_jho:
	.incbin "data/residual/banim_pal_jho.bin"
	.global banim_pal_bon
banim_pal_bon:
	.incbin "data/residual/banim_pal_bon.bin"
	.global banim_pal_baz
banim_pal_baz:
	.incbin "data/residual/banim_pal_baz.bin"
	.global banim_pal_ass
banim_pal_ass:
	.incbin "data/residual/banim_pal_ass.bin"
	.global banim_pal_nat
banim_pal_nat:
	.incbin "data/residual/banim_pal_nat.bin"
	.global banim_pal_mul
banim_pal_mul:
	.incbin "data/residual/banim_pal_mul.bin"
	.global banim_pal_irv
banim_pal_irv:
	.incbin "data/residual/banim_pal_irv.bin"
	.global banim_pal_ewa
banim_pal_ewa:
	.incbin "data/residual/banim_pal_ewa.bin"
	.global banim_pal_gar
banim_pal_gar:
	.incbin "data/residual/banim_pal_gar.bin"
	.global banim_pal_ros
banim_pal_ros:
	.incbin "data/residual/banim_pal_ros.bin"
	.global banim_pal_xys
banim_pal_xys:
	.incbin "data/residual/banim_pal_xys.bin"
	.global banim_pal_doz
banim_pal_doz:
	.incbin "data/residual/banim_pal_doz.bin"
	.global banim_pal_ros_2
banim_pal_ros_2:
	.incbin "data/residual/banim_pal_ros_2.bin"
	.global banim_pal_tet
banim_pal_tet:
	.incbin "data/residual/banim_pal_tet.bin"
	.global banim_pal_cug
banim_pal_cug:
	.incbin "data/residual/banim_pal_cug.bin"
	.global banim_pal_cug_2
banim_pal_cug_2:
	.incbin "data/residual/banim_pal_cug_2.bin"
	.global banim_pal_gle
banim_pal_gle:
	.incbin "data/residual/banim_pal_gle.bin"
	.global banim_pal_kno
banim_pal_kno:
	.incbin "data/residual/banim_pal_kno.bin"
	.global banim_pal_ewa_2
banim_pal_ewa_2:
	.incbin "data/residual/banim_pal_ewa_2.bin"
	.global banim_pal_tur
banim_pal_tur:
	.incbin "data/residual/banim_pal_tur.bin"
	.global banim_pal_van
banim_pal_van:
	.incbin "data/residual/banim_pal_van.bin"
	.global banim_pal_syr
banim_pal_syr:
	.incbin "data/residual/banim_pal_syr.bin"
	.global banim_pal_gar_2
banim_pal_gar_2:
	.incbin "data/residual/banim_pal_gar_2.bin"
	.global banim_pal_ros_3
banim_pal_ros_3:
	.incbin "data/residual/banim_pal_ros_3.bin"
	.global banim_pal_one
banim_pal_one:
	.incbin "data/residual/banim_pal_one.bin"
	.global banim_pal_xys_2
banim_pal_xys_2:
	.incbin "data/residual/banim_pal_xys_2.bin"
	.global banim_pal_mer_2
banim_pal_mer_2:
	.incbin "data/residual/banim_pal_mer_2.bin"
	.global banim_pal_ber
banim_pal_ber:
	.incbin "data/residual/banim_pal_ber.bin"
	.global banim_pal_ame_2
banim_pal_ame_2:
	.incbin "data/residual/banim_pal_ame_2.bin"
	.global banim_pal_gil_2
banim_pal_gil_2:
	.incbin "data/residual/banim_pal_gil_2.bin"
	.global banim_pal_vig
banim_pal_vig:
	.incbin "data/residual/banim_pal_vig.bin"
	.global banim_pal_tir
banim_pal_tir:
	.incbin "data/residual/banim_pal_tir.bin"
	.global banim_pal_for
banim_pal_for:
	.incbin "data/residual/banim_pal_for.bin"
	.global banim_pal_fra
banim_pal_fra:
	.incbin "data/residual/banim_pal_fra.bin"
	.global banim_pal_gil_3
banim_pal_gil_3:
	.incbin "data/residual/banim_pal_gil_3.bin"
	.global banim_pal_kyl
banim_pal_kyl:
	.incbin "data/residual/banim_pal_kyl.bin"
	.global banim_pal_ame_3
banim_pal_ame_3:
	.incbin "data/residual/banim_pal_ame_3.bin"
	.global banim_pal_dus
banim_pal_dus:
	.incbin "data/residual/banim_pal_dus.bin"
	.global banim_pal_aia
banim_pal_aia:
	.incbin "data/residual/banim_pal_aia.bin"
	.global banim_pal_lut
banim_pal_lut:
	.incbin "data/residual/banim_pal_lut.bin"
	.global banim_pal_ewa_3
banim_pal_ewa_3:
	.incbin "data/residual/banim_pal_ewa_3.bin"
	.global banim_pal_xys_3
banim_pal_xys_3:
	.incbin "data/residual/banim_pal_xys_3.bin"
	.global banim_pal_zon
banim_pal_zon:
	.incbin "data/residual/banim_pal_zon.bin"
	.global banim_pal_ewa_4
banim_pal_ewa_4:
	.incbin "data/residual/banim_pal_ewa_4.bin"
	.global banim_pal_lar
banim_pal_lar:
	.incbin "data/residual/banim_pal_lar.bin"
	.global banim_pal_lut_2
banim_pal_lut_2:
	.incbin "data/residual/banim_pal_lut_2.bin"
	.global banim_pal_cel
banim_pal_cel:
	.incbin "data/residual/banim_pal_cel.bin"
	.global banim_pal_ass_2
banim_pal_ass_2:
	.incbin "data/residual/banim_pal_ass_2.bin"
	.global banim_pal_jho_2
banim_pal_jho_2:
	.incbin "data/residual/banim_pal_jho_2.bin"
	.global banim_pal_mar_2
banim_pal_mar_2:
	.incbin "data/residual/banim_pal_mar_2.bin"
	.global banim_pal_ame_4
banim_pal_ame_4:
	.incbin "data/residual/banim_pal_ame_4.bin"
	.global banim_pal_for_2
banim_pal_for_2:
	.incbin "data/residual/banim_pal_for_2.bin"
	.global banim_pal_set
banim_pal_set:
	.incbin "data/residual/banim_pal_set.bin"
	.global banim_pal_fra_2
banim_pal_fra_2:
	.incbin "data/residual/banim_pal_fra_2.bin"
	.global banim_pal_kyl_2
banim_pal_kyl_2:
	.incbin "data/residual/banim_pal_kyl_2.bin"
	.global banim_pal_ols
banim_pal_ols:
	.incbin "data/residual/banim_pal_ols.bin"
	.global banim_pal_van_2
banim_pal_van_2:
	.incbin "data/residual/banim_pal_van_2.bin"
	.global banim_pal_tur_2
banim_pal_tur_2:
	.incbin "data/residual/banim_pal_tur_2.bin"
	.global banim_pal_ros_4
banim_pal_ros_4:
	.incbin "data/residual/banim_pal_ros_4.bin"
	.global banim_pal_nat_2
banim_pal_nat_2:
	.incbin "data/residual/banim_pal_nat_2.bin"
	.global banim_pal_com_2
banim_pal_com_2:
	.incbin "data/residual/banim_pal_com_2.bin"
	.global banim_pal_mul_2
banim_pal_mul_2:
	.incbin "data/residual/banim_pal_mul_2.bin"
	.global banim_pal_ren
banim_pal_ren:
	.incbin "data/residual/banim_pal_ren.bin"
	.global banim_pal_lut_3
banim_pal_lut_3:
	.incbin "data/residual/banim_pal_lut_3.bin"
	.global banim_pal_ass_3
banim_pal_ass_3:
	.incbin "data/residual/banim_pal_ass_3.bin"
	.global banim_pal_ewa_5
banim_pal_ewa_5:
	.incbin "data/residual/banim_pal_ewa_5.bin"
	.global banim_pal_kno_2
banim_pal_kno_2:
	.incbin "data/residual/banim_pal_kno_2.bin"
	.global banim_pal_mul_3
banim_pal_mul_3:
	.incbin "data/residual/banim_pal_mul_3.bin"
	.global banim_pal_sal
banim_pal_sal:
	.incbin "data/residual/banim_pal_sal.bin"
	.global banim_pal_ewa_6
banim_pal_ewa_6:
	.incbin "data/residual/banim_pal_ewa_6.bin"
	.global banim_pal_kno_3
banim_pal_kno_3:
	.incbin "data/residual/banim_pal_kno_3.bin"
	.global banim_pal_nov
banim_pal_nov:
	.incbin "data/residual/banim_pal_nov.bin"
	.global banim_pal_ewa_7
banim_pal_ewa_7:
	.incbin "data/residual/banim_pal_ewa_7.bin"
	.global banim_pal_kno_4
banim_pal_kno_4:
	.incbin "data/residual/banim_pal_kno_4.bin"
	.global banim_pal_hea
banim_pal_hea:
	.incbin "data/residual/banim_pal_hea.bin"
	.global banim_pal_mer_3
banim_pal_mer_3:
	.incbin "data/residual/banim_pal_mer_3.bin"
	.global banim_pal_ame_5
banim_pal_ame_5:
	.incbin "data/residual/banim_pal_ame_5.bin"
	.global banim_pal_fra_3
banim_pal_fra_3:
	.incbin "data/residual/banim_pal_fra_3.bin"
	.global banim_pal_kyl_3
banim_pal_kyl_3:
	.incbin "data/residual/banim_pal_kyl_3.bin"
	.global banim_pal_for_3
banim_pal_for_3:
	.incbin "data/residual/banim_pal_for_3.bin"
	.global banim_pal_mur
banim_pal_mur:
	.incbin "data/residual/banim_pal_mur.bin"
	.global banim_pal_ish
banim_pal_ish:
	.incbin "data/residual/banim_pal_ish.bin"
	.global banim_pal_hey
banim_pal_hey:
	.incbin "data/residual/banim_pal_hey.bin"
	.global banim_pal_fad
banim_pal_fad:
	.incbin "data/residual/banim_pal_fad.bin"
	.global banim_pal_jho_3
banim_pal_jho_3:
	.incbin "data/residual/banim_pal_jho_3.bin"
	.global banim_pal_mar_3
banim_pal_mar_3:
	.incbin "data/residual/banim_pal_mar_3.bin"
	.global banim_pal_com_3
banim_pal_com_3:
	.incbin "data/residual/banim_pal_com_3.bin"
	.global banim_pal_car
banim_pal_car:
	.incbin "data/residual/banim_pal_car.bin"
	.global banim_pal_lar_2
banim_pal_lar_2:
	.incbin "data/residual/banim_pal_lar_2.bin"
	.global banim_pal_nat_3
banim_pal_nat_3:
	.incbin "data/residual/banim_pal_nat_3.bin"
	.global banim_pal_lar_3
banim_pal_lar_3:
	.incbin "data/residual/banim_pal_lar_3.bin"
	.global banim_pal_gar_3
banim_pal_gar_3:
	.incbin "data/residual/banim_pal_gar_3.bin"
	.global banim_pal_ros_5
banim_pal_ros_5:
	.incbin "data/residual/banim_pal_ros_5.bin"
	.global banim_pal_bin
banim_pal_bin:
	.incbin "data/residual/banim_pal_bin.bin"
	.global banim_pal_tur_3
banim_pal_tur_3:
	.incbin "data/residual/banim_pal_tur_3.bin"
	.global banim_pal_van_3
banim_pal_van_3:
	.incbin "data/residual/banim_pal_van_3.bin"
	.global banim_pal_cug_3
banim_pal_cug_3:
	.incbin "data/residual/banim_pal_cug_3.bin"
	.global banim_pal_wal
banim_pal_wal:
	.incbin "data/residual/banim_pal_wal.bin"
	.global banim_pal_geb
banim_pal_geb:
	.incbin "data/residual/banim_pal_geb.bin"
	.global banim_pal_pab
banim_pal_pab:
	.incbin "data/residual/banim_pal_pab.bin"
	.global banim_pal_cet
banim_pal_cet:
	.incbin "data/residual/banim_pal_cet.bin"
