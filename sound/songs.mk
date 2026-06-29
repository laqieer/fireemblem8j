# Per-song mid2agb flags (ported from ../fireemblem8u/songs.mk). AUTO-GEN by
# scripts/gen_d311_songs.py. Each rule rebuilds the song .s from the committed
# .mid with the JP build flags; linked at the JP song address the m4a self-ptr
# + voicegroup relocations resolve to JP-absolute values. See docs/sound.md D311.

MID_SUBDIR := sound/songs/midi

$(MID_SUBDIR)/song001_agbfe3_bgm_opening.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G000 -R020 -P010 -V051

$(MID_SUBDIR)/song002_agbfe3_bgm_op_theme_i.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G001 -R020 -P010 -V050

$(MID_SUBDIR)/song006_agbfe3_bgm_wmap_03.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G005 -R020 -P010 -V051

$(MID_SUBDIR)/song007_agbfe3_bgm_wmap_04.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G006 -R020 -P010 -V056

$(MID_SUBDIR)/song009_agbfe3_bgm_map_pl2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G040 -R020 -P010 -V053

$(MID_SUBDIR)/song010_agbfe3_bgm_map_pl3.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G041 -R020 -P010 -V046

$(MID_SUBDIR)/song011_agbfe3_bgm_map_pl4.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G042 -R020 -P010 -V051

$(MID_SUBDIR)/song012_agbfe3_bgm_map_pl11.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G043 -R020 -P010 -V048

$(MID_SUBDIR)/song013_agbfe3_bgm_map_pl12.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G044 -R020 -P010 -V052

$(MID_SUBDIR)/song014_agbfe3_bgm_map_pl5.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G008 -R020 -P010 -V055

$(MID_SUBDIR)/song015_agbfe3_bgm_map_pl9.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G009 -R020 -P010 -V052

$(MID_SUBDIR)/song017_agbfe3_bgm_map_pl6.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G046 -R020 -P010 -V064

$(MID_SUBDIR)/song019_agbfe3_bgm_map_cp1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G076 -R020 -P010 -V056

$(MID_SUBDIR)/song020_agbfe3_bgm_map_cp2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G076 -R020 -P010 -V053

$(MID_SUBDIR)/song021_agbfe3_bgm_map_cp3.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G076 -R020 -P010 -V045

$(MID_SUBDIR)/song022_agbfe3_bgm_map_cp5.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G010 -R020 -P010 -V055

$(MID_SUBDIR)/song023_agbfe3_bgm_map_cp4.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G048 -R020 -P010 -V062

$(MID_SUBDIR)/song024_agbfe3_bgm_map_cp8.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G049 -R020 -P010 -V068

$(MID_SUBDIR)/song027_agbfe3_bgm_btl_boss1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G052 -R020 -P010 -V046

$(MID_SUBDIR)/song029_agbfe3_bgm_btl_boss4.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G054 -R020 -P010 -V058

$(MID_SUBDIR)/song030_agbfe3_bgm_btl_boss5.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G055 -R020 -P010 -V048

$(MID_SUBDIR)/song034_agbfe3_bgm_btl_staff_b.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G058 -R020 -P010 -V049

$(MID_SUBDIR)/song035_agbfe3_bgm_btl_class_chg.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G059 -R020 -P010 -V043

$(MID_SUBDIR)/song037_agbfe3_bgm_evt_start.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G060 -R020 -P010 -V046

$(MID_SUBDIR)/song038_agbfe3_bgm_evt_enemy.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G061 -R020 -P010 -V051

$(MID_SUBDIR)/song039_agbfe3_bgm_evt_yorokobi.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G062 -R020 -P010 -V054

$(MID_SUBDIR)/song044_agbfe3_bgm_evt_lyon.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G066 -R020 -P010 -V063

$(MID_SUBDIR)/song045_agbfe3_bgm_evt_lyon2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G014 -R020 -P010 -V061

$(MID_SUBDIR)/song046_agbfe3_bgm_evt_enemy2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G015 -R020 -P010 -V052

$(MID_SUBDIR)/song053_agbfe3_bgm_shop.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G017 -R020 -P010 -V060

$(MID_SUBDIR)/song056_agbfe3_bgm_togijyo_info.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G020 -R020 -P010 -V056

$(MID_SUBDIR)/song058_agbfe3_bgm_ff_togijyo.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G022 -R020 -P010 -V049

$(MID_SUBDIR)/song059_agbfe3_bgm_ff_loop.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G023 -R020 -P010 -V056

$(MID_SUBDIR)/song060_bgm_sys_fase_pl.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G072 -R020 -P010 -V054

$(MID_SUBDIR)/song061_bgm_sys_fase_cp.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G073 -R020 -P010 -V044

$(MID_SUBDIR)/song062_agbfe3_bgm_gameover.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G074 -R020 -P010 -V048

$(MID_SUBDIR)/song066_agbfe3_bgm_ed_staff.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G026 -R050 -P010 -V058

$(MID_SUBDIR)/song067_agbfe3_bgm_op_theme.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G001 -R020 -P010 -V050

$(MID_SUBDIR)/song069_agbfe3_bgm_evt_last.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G028 -R020 -P010 -V049

$(MID_SUBDIR)/song070_agbfe3_bgm_ed_after.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G029 -R020 -P010 -V049

$(MID_SUBDIR)/song073_y_doukutu_4.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G089 -R000 -P010 -V090

$(MID_SUBDIR)/song076_h_se_bird.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G085 -R000 -P010 -V090

$(MID_SUBDIR)/song080_h_evt_hubuki_s.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G031 -P020 -V100

$(MID_SUBDIR)/song085_agbfe3_bgm_btl_boss5_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G055 -R020 -P010 -V048

$(MID_SUBDIR)/song086_agbfe3_bgm_ed_staff_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G026 -R050 -P010 -V058

$(MID_SUBDIR)/song145_se_sys_chapter_start1_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G030 -P020 -V127

$(MID_SUBDIR)/song290_se_btl_fimbul1_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G033 -P020 -V110

$(MID_SUBDIR)/song319_bmp_evt_15_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V099

$(MID_SUBDIR)/song320_bmp_evt_20b_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V099

$(MID_SUBDIR)/song321_bmp_evt_20b_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V102

$(MID_SUBDIR)/song322_mon_mao_die1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V110

$(MID_SUBDIR)/song617_se_bmp_map25_saint_light1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G031 -P020 -V127

$(MID_SUBDIR)/song723_btl_dance2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V105

$(MID_SUBDIR)/song725_bmp_dance2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V105

$(MID_SUBDIR)/song752_h_btl_dragon_shake_01.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G036 -P020 -V078

$(MID_SUBDIR)/song753_h_btl_dragon_scream_01.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G036 -P020 -V090

$(MID_SUBDIR)/song754_h_btl_dragon_bress_01.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G036 -P020 -V110

$(MID_SUBDIR)/song755_h_btl_dragon_out_01.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G032 -P020 -V100

$(MID_SUBDIR)/song790_sys_chapter_start.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P005 -V105

$(MID_SUBDIR)/song896_mon_mao_appear1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V103

$(MID_SUBDIR)/song900_bmp_bos_nightmare1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V110

$(MID_SUBDIR)/song940_btl_bgl_attack7_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V075

$(MID_SUBDIR)/song943_btl_snr_magic2_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V105

$(MID_SUBDIR)/song944_btl_snr_magic2_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V085

$(MID_SUBDIR)/song946_mon_mao_magic1_1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V085

$(MID_SUBDIR)/song947_mon_mao_magic1_2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V100

$(MID_SUBDIR)/song950_mon_gog_magic1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V105

$(MID_SUBDIR)/song951_mon_gog_attack1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V100

$(MID_SUBDIR)/song959_btl_mon_call1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V105

$(MID_SUBDIR)/song967_mon_bgl_attack7.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V100

$(MID_SUBDIR)/song980_btl_evl_magic2.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V090

$(MID_SUBDIR)/song981_btl_mon_magic1.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G038 -P020 -V070

