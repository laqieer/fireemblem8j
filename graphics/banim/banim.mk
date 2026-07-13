# graphics/banim -- battle-animation asset wiring (Phase-1, banim subsystem).
# Auto-included by the root Makefile via `-include $(GRAPHICS_MK)`.
# Region-SAME with US (JP bytes == US bytes): each committed PNG/.agbpal under
# graphics/banim/ rebuilds (gbagfx png->4bpp->LZ, or .agbpal[.lz]) byte-identical
# to the original ROM blob. The per-asset `LZ_FLAGS := -mindist N` lines below pin
# gbagfx's match distance so the LZ output is byte-exact (banim palettes need 1,
# DemonLight dragonfx sheets need 3, etc.); deleting them shifts the affected
# region. The OAM/script/modes data is built from editable banim/*_motion.s via
# the compressing linker (BA1). Live src/data asset prerequisites are generated
# in layout/data_incbin_deps.mk; this file retains the non-default LZ flags.


# non-default -mindist pins (default is gbagfx's mindist 2):
graphics/banim/banim_arcf_ar1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_arcf_ar1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_arcm_ar1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_arcm_ar1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_armm_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_armm_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_armm_sp1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_armm_sp1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_asnm_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_asnm_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_asnm_sw1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_asnm_sw1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bae_at1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bae_at1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_banm_ax1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_banm_ax1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_banm_ax1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bgl_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bgl_mg1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bisf_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bisf_mg1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bism_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bism_mg1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bos_at1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bos_at1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bram_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bram_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bram_sw1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_bram_sw1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_brsm_ax1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_brsm_ax1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_brsm_ax1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_cer_at1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_cyc_ax1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_cyc_ax1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_cyc_ax1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_danf_da1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drkm_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drkm_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drkm_sp1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drkm_sp1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drmm_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drmm_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drmm_sp1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drmm_sp1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drmm_sp1_5.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drmm_sp1_6.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_druf_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_druf_mg1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drum_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drum_mg1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_drz_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_fakf_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_fakf_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_fakf_sp1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_fifd_he1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_fifd_hk1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_fifd_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_fifd_mg1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_figm_ax1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_figm_ax1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_figm_ax1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_forf_ar1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_forf_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_forf_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_form_ar1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_form_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_form_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_gar_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_gar_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_gar_sp1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_gar_sp1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_genm_al1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_genm_al1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_genm_al1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_genm_al1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_genm_al1_5.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_genm_al1_6.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_genm_al1_7.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_genm_al1_8.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_genm_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_genm_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_gog_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_grkm_ax1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_grkm_ax1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_grkm_ax1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_grkm_ax1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_grkm_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_grkm_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_grkm_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_grkm_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_grkm_sw1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_grkm_sw1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_lomf_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_lomf_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_lomm_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_lomm_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_lorf_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_lorf_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_lorf_sw1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_lorf_sw1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_lorm_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_lorm_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_magf_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_magm_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mcd_ar1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mcd_ax1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mcd_ax1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mcd_ax1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mcd_ax1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mcd_ax1_5.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mcd_ax1_6.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mdg_at1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_merm_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_merm_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mf_mi1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mgkf_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mgkf_mg1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mgkm_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_mgkm_mg1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_monm_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_myrf_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_myrf_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_myrm_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_myrm_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_necm_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_necm_ro1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_paif_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_paif_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_paif_sw1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pakm_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pakm_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pakm_sw1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pbfm_ax1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pbfm_ax1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pbfm_ax1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pbmm_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pbrf_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pbrf_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pekf_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pekf_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pirm_ax1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pirm_ax1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_pirm_ax1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_prif_ro1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_prif_ro1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_prim_ro1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_prim_ro1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_rogm_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_rogm_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sagf_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sagf_mg1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sagm_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sagm_mg1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_shaf_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sham_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_ska_ar1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_ska_ar1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sks_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sks_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sks_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sks_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sks_sw1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sks_sw1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sks_sw1_5.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sks_sw1_6.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_smnm_ro1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_smnm_ro1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_snif_ar1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_snif_ar1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_snim_ar1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_snim_ar1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sokf_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sokf_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sokf_sp1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sokm_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sokm_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_sokm_sp1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_solm_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_solm_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_stam_ar1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_swmf_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_swmf_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_swmm_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_swmm_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_thim_sw1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_thim_sw1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_trof_ro1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_trof_ro1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_valf_mg1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_valf_mg1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_warm_ar1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_warm_ax1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_warm_ax1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_warm_ax1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_wykm_sp1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_wykm_sp1_2.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_wykm_sp1_3.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_wykm_sp1_4.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_zom_at1.agbpal.lz: LZ_FLAGS := -mindist 1
graphics/banim/banim_zom_at1_2.agbpal.lz: LZ_FLAGS := -mindist 1


# --- descriptive-symbol banim (ekrdragonfx + data_banim_p), region-SAME ---
# Each committed source under graphics/banim/_us/ rebuilds (gbagfx
# png->4bpp[->lz] / .pal->gbapal / .map.bin[->lz] / verbatim palette)
# byte-identical to the JP ROM.








































































































# non-default -mindist pins (default is gbagfx's mindist 2):
graphics/banim/_us/banim/assets/tsa/005DDAF4_Tsa_085DDAF4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E64D8_Tsa_085E64D8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E6860_Tsa_085E6860.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E6948_Tsa_085E6948.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E6B70_Tsa_085E6B70.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E6CA4_Tsa_085E6CA4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E8308_Tsa_EfxCriricalEffectBG_L.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E87A8_Tsa_EfxCriricalEffectBG_R.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E9170_Tsa1_EfxNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E923C_Tsa2_EfxNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E933C_Tsa3_EfxNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E944C_Tsa4_EfxNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E9558_Tsa5_EfxNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E965C_Tsa6_EfxNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E9748_Tsa7_EfxNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E981C_Tsa8_EfxNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005E98D8_Tsa9_EfxNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005EFE90_Tsa19_EfxMagfcastBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005EFF60_Tsa20_EfxMagfcastBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F0018_Tsa21_EfxMagfcastBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F0E24_Tsa1_EfxMagdhisEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F0F24_Tsa2_EfxMagdhisEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F1018_Tsa3_EfxMagdhisEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F10EC_Tsa4_EfxMagdhisEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F387C_Tsa_EfxThuderBg1.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F3948_Tsa_EfxThuderBg2.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F6520_Tsa_085F6520.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F65F0_Tsa_085F65F0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F66F0_Tsa_085F66F0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F67F8_Tsa_085F67F8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F690C_Tsa_085F690C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F6A44_Tsa_085F6A44.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F6B48_Tsa_085F6B48.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F6C1C_Tsa_085F6C1C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F6FAC_Tsa_085F6FAC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F707C_Tsa_085F707C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F717C_Tsa_085F717C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F7284_Tsa_085F7284.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F7398_Tsa_085F7398.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F74D0_Tsa_085F74D0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F75D4_Tsa_085F75D4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/005F76A8_Tsa_085F76A8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006013BC_Tsa_086013BC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006014B0_Tsa_086014B0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006015C8_Tsa_086015C8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006016F4_Tsa_086016F4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0060182C_Tsa_0860182C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00601970_Tsa_08601970.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00601AC4_Tsa_08601AC4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00601C1C_Tsa_08601C1C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00601D84_Tsa_08601D84.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00601EF0_Tsa_08601EF0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0060206C_Tsa_0860206C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00602A10_Tsa_08602A10.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00608E78_Tsa_BoltingBg_E.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00608F90_Tsa_BoltingBg_F.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0060913C_Tsa_BoltingBg_G.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0060925C_Tsa_BoltingBg_H.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00609348_Tsa_BoltingBg_I.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006094C8_Tsa_BoltingBg_K.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00610404_Tsa_FimbulvetrBg_D.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006104D8_Tsa_FimbulvetrBg_E.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006105D4_Tsa_FimbulvetrBg_F.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00610714_Tsa_FimbulvetrBg_G.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006108AC_Tsa_FimbulvetrBg_H.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00610A80_Tsa_FimbulvetrBg_I.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00617F24_Tsa_FimbulvetrBg_Tornado_A.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00618110_Tsa_FimbulvetrBg_Tornado_B.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006182E8_Tsa_FimbulvetrBg_Tornado_C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006184B0_Tsa_FimbulvetrBg_Tornado_D.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006186E4_Tsa_FimbulvetrBg_Tornado_E.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0061892C_Tsa_FimbulvetrBg_Tornado_F.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0061F7F4_Tsa_0861F7F4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0061F918_Tsa_0861F918.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0061FC40_Tsa_0861FC40.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0061FD28_Tsa_0861FD28.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0061FE0C_Tsa_0861FE0C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0061FFCC_Tsa_0861FFCC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006200AC_Tsa_086200AC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006201A0_Tsa_086201A0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00620294_Tsa_08620294.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00620398_Tsa_08620398.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006204A0_Tsa_086204A0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006205B8_Tsa_086205B8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006211E4_Tsa_086211E4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00621304_Tsa_08621304.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00621420_Tsa_08621420.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00621534_Tsa_08621534.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062162C_Tsa_0862162C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00621714_Tsa_08621714.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006217E4_Tsa_086217E4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006218A8_Tsa_086218A8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00622FEC_Tsa_AircaliburBg_A.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00623174_Tsa_AircaliburBg_B.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062A310_Tsa_0862A310.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062A40C_Tsa_0862A40C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062A50C_Tsa_0862A50C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062A610_Tsa_0862A610.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062A708_Tsa_0862A708.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062A814_Tsa_0862A814.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062B2AC_Tsa_0862B2AC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062B3A8_Tsa_0862B3A8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062B49C_Tsa_0862B49C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062B594_Tsa_0862B594.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062B680_Tsa_0862B680.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062B764_Tsa_0862B764.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062B83C_Tsa_0862B83C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062B90C_Tsa_0862B90C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062B9D8_Tsa_0862B9D8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062BAA0_Tsa_0862BAA0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0062BB54_Tsa_0862BB54.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00636660_Tsa_08636660.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00636CF8_Tsa_08636CF8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00636E00_Tsa_08636E00.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00636F1C_Tsa_08636F1C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00637058_Tsa_08637058.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006371A8_Tsa_086371A8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00637300_Tsa_08637300.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00637458_Tsa_08637458.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006375AC_Tsa_086375AC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006376FC_Tsa_086376FC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0063784C_Tsa_0863784C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00637984_Tsa_08637984.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00637AB0_Tsa_08637AB0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00637BCC_Tsa_08637BCC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00637CD8_Tsa_08637CD8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00637DD0_Tsa_08637DD0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00637EBC_Tsa_08637EBC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00637F8C_Tsa_08637F8C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638048_Tsa_08638048.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006380FC_Tsa_086380FC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006381AC_Tsa_086381AC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638258_Tsa_08638258.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638300_Tsa_08638300.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006383B4_Tsa_086383B4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638474_Tsa_08638474.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638540_Tsa_08638540.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638608_Tsa_08638608.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006386D0_Tsa_086386D0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006387A4_Tsa_086387A4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638880_Tsa_08638880.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638968_Tsa_08638968.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638A5C_Tsa_08638A5C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638B64_Tsa_08638B64.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638C6C_Tsa_08638C6C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638D90_Tsa_08638D90.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638EB0_Tsa_08638EB0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00638FCC_Tsa_08638FCC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006390DC_Tsa_086390DC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006391E8_Tsa_086391E8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006392E8_Tsa_086392E8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00641DA4_Tsa_08641DA4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00641F38_Tsa_08641F38.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064213C_Tsa_0864213C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064240C_Tsa_0864240C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006426DC_Tsa_086426DC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064298C_Tsa_0864298C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00642C40_Tsa_08642C40.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00642ECC_Tsa_08642ECC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00643150_Tsa_08643150.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006433C4_Tsa_086433C4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00643658_Tsa_08643658.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006438E0_Tsa_086438E0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00643B7C_Tsa_08643B7C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00643E04_Tsa_08643E04.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00644080_Tsa_08644080.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006442B0_Tsa_086442B0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00644500_Tsa_08644500.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00644730_Tsa_08644730.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00644928_Tsa_08644928.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00644B0C_Tsa_08644B0C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00644CA8_Tsa_08644CA8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00645624_Tsa_08645624.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00645708_Tsa_08645708.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006457BC_Tsa_086457BC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00645858_Tsa_08645858.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00645AC8_Tsa_08645AC8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00645B64_Tsa_08645B64.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00645C00_Tsa_08645C00.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00645C9C_Tsa_08645C9C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00645D38_Tsa_08645D38.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064E7D0_Tsa_EclipseBg_A.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064EAB4_Tsa_EclipseBg_D.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064EB68_Tsa_EclipseBg_E.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064EC1C_Tsa_EclipseBg_F.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064ECD0_Tsa_EclipseBg_G.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064EDAC_Tsa_EclipseBg_H.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064EE88_Tsa_EclipseBg_I.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064EF9C_Tsa_EclipseBg_J.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064F0B0_Tsa_EclipseBg_K.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064F1C4_Tsa_EclipseBg_L.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064F2D8_Tsa_EclipseBg_M.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064F3EC_Tsa_EclipseBg_N.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064F4F8_Tsa_EclipseBg_O.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064F5D0_Tsa_EclipseBg_P.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064F6E0_Tsa_EclipseBg_Q.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064F848_Tsa_EclipseBg_R.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064FA0C_Tsa_EclipseBg_S.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064FBD0_Tsa_EclipseBg_T.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064FD8C_Tsa_EclipseBg_U.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0064FF3C_Tsa_EclipseBg_V.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006500EC_Tsa_EclipseBg_W.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00650440_Tsa_EclipseBg_Y.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006505D8_Tsa_EclipseBg_Z.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00650768_Tsa_EclipseBg_AA.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00656934_Tsa_08656934.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006569F0_Tsa_086569F0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00656AAC_Tsa_08656AAC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00656B68_Tsa_08656B68.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00656C24_Tsa_08656C24.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00656CE0_Tsa_08656CE0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00656D9C_Tsa_08656D9C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00656EA0_Tsa_08656EA0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00656FA4_Tsa_08656FA4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00659FE0_Tsa_08659FE0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0065A194_Tsa_0865A194.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0065A348_Tsa_0865A348.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0065A964_Tsa_0865A964.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0065ADC4_Tsa_0865ADC4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00667DB0_Tsa_08667DB0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00667ED4_Tsa_08667ED4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00667FF4_Tsa_08667FF4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00668100_Tsa_08668100.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006681FC_Tsa_086681FC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006682E4_Tsa_086682E4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006683CC_Tsa_086683CC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006684AC_Tsa_086684AC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00668588_Tsa_08668588.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00668668_Tsa_08668668.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066875C_Tsa_0866875C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00668850_Tsa_08668850.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00668954_Tsa_08668954.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00668A5C_Tsa_08668A5C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00668B74_Tsa_08668B74.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00668C98_Tsa_08668C98.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00668DAC_Tsa_08668DAC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00668ED0_Tsa_08668ED0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00668FF4_Tsa_08668FF4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00669104_Tsa_08669104.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00669204_Tsa_08669204.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006692EC_Tsa_086692EC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006693CC_Tsa_086693CC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006694A8_Tsa_086694A8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00669584_Tsa_08669584.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00669668_Tsa_08669668.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066975C_Tsa_0866975C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066984C_Tsa_0866984C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00669950_Tsa_08669950.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00669A58_Tsa_08669A58.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00669B6C_Tsa_08669B6C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00669C90_Tsa_08669C90.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066AD9C_Tsa_0866AD9C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066AFB0_Tsa_0866AFB0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066B16C_Tsa_0866B16C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066B348_Tsa_0866B348.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066B54C_Tsa_0866B54C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066B754_Tsa_0866B754.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066B968_Tsa_0866B968.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066BBC8_Tsa_0866BBC8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066BDFC_Tsa_0866BDFC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066C070_Tsa_0866C070.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066C2B8_Tsa_0866C2B8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066CC7C_Tsa_0866CC7C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066CF60_Tsa_0866CF60.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066D230_Tsa_0866D230.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066D4C8_Tsa_0866D4C8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066D760_Tsa_0866D760.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066D98C_Tsa_0866D98C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066DC40_Tsa_0866DC40.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066DF00_Tsa_0866DF00.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066E230_Tsa_0866E230.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066E580_Tsa_0866E580.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0066E8F8_Tsa_0866E8F8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00677E80_Tsa_08677E80.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00677F8C_Tsa_08677F8C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0067808C_Tsa_0867808C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00678198_Tsa_08678198.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006782A4_Tsa_086782A4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0067BA68_Tsa_0867BA68.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0067BB50_Tsa_0867BB50.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0067BC40_Tsa_0867BC40.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0067BD40_Tsa_0867BD40.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0067BE4C_Tsa_0867BE4C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0067BF6C_Tsa_0867BF6C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0067C09C_Tsa_0867C09C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006806BC_Tsa_086806BC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006807CC_Tsa_086807CC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00681570_Tsa_08681570.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00681658_Tsa_08681658.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00681748_Tsa_08681748.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00681848_Tsa_08681848.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00681954_Tsa_08681954.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00681A74_Tsa_08681A74.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00681BA4_Tsa_08681BA4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006861C4_Tsa_086861C4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006862A0_Tsa_086862A0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0068637C_Tsa_0868637C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00686458_Tsa_08686458.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00686534_Tsa_08686534.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00686610_Tsa_08686610.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006866EC_Tsa_086866EC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006867C8_Tsa_086867C8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006868A4_Tsa_086868A4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00686980_Tsa_08686980.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00686A5C_Tsa_08686A5C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00686B38_Tsa_08686B38.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00686C14_Tsa_08686C14.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00686CF0_Tsa_08686CF0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00686DCC_Tsa_08686DCC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00686EA8_Tsa_08686EA8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0068E118_Tsa_0868E118.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0068E208_Tsa_0868E208.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0068E338_Tsa_0868E338.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00696860_Tsa_08696860.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006968F8_Tsa_086968F8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00696A8C_Tsa_08696A8C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00696C28_Tsa_08696C28.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00696DC4_Tsa_08696DC4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0069E970_Tsa_0869E970.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0069EE2C_Tsa_0869EE2C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0069F090_Tsa_0869F090.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0069F304_Tsa_0869F304.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0069F5C0_Tsa_0869F5C0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0069F888_Tsa_0869F888.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0069FB4C_Tsa_0869FB4C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0069FDFC_Tsa_0869FDFC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006A00B0_Tsa_086A00B0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006A0388_Tsa_086A0388.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006A1D00_Tsa_086A1D00.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C796C_Tsa_086C796C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C7A2C_Tsa_086C7A2C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C7AF8_Tsa_086C7AF8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C7BD0_Tsa_086C7BD0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C7CBC_Tsa_086C7CBC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C7DC0_Tsa_086C7DC0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C7ED4_Tsa_086C7ED4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C7FFC_Tsa_086C7FFC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C8138_Tsa_086C8138.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C828C_Tsa_086C828C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C8404_Tsa_086C8404.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C8570_Tsa_086C8570.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C86E4_Tsa_086C86E4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C8860_Tsa_086C8860.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C89EC_Tsa_086C89EC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C8B30_Tsa_086C8B30.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C8C84_Tsa_086C8C84.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C8DE8_Tsa_086C8DE8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006C8F4C_Tsa_086C8F4C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D36D4_Tsa_086D36D4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D37B4_Tsa_086D37B4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D3890_Tsa_086D3890.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D3978_Tsa_086D3978.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D3A7C_Tsa_086D3A7C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D3B78_Tsa_086D3B78.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D3C84_Tsa_086D3C84.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D3D8C_Tsa_086D3D8C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D3E94_Tsa_086D3E94.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D3FBC_Tsa_086D3FBC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D40CC_Tsa_086D40CC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D41F4_Tsa_086D41F4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D4318_Tsa_086D4318.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D4428_Tsa_086D4428.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D454C_Tsa_086D454C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D466C_Tsa_086D466C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D4788_Tsa_086D4788.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D489C_Tsa_086D489C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D49D0_Tsa_086D49D0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D4ADC_Tsa_086D4ADC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D8B54_Tsa_086D8B54.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006D8C64_Tsa_086D8C64.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006E7914_Tsa_086E7914.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006E7AFC_Tsa_086E7AFC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006F4A98_Tsa_086F4A98.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006F4CCC_Tsa_086F4CCC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006F4ED8_Tsa_086F4ED8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006FDA64_Tsa_086FDA64.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/006FE320_Tsa_086FE320.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00725AF0_Tsa_FireBreathBg.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007270B4_Tsa_ShineBg1_Left.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00727510_Tsa_ShineBg1_Right.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0072974C_Tsa_LunaBg1_A.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0072A1BC_Tsa_LunaBg2.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0072FA84_Tsa_ExcaliburBg2_Left.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0072FEB8_Tsa_ExcaliburBg2_Right.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00732368_Tsa_GespenstBg4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007331FC_Tsa_087331FC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007332A4_Tsa_087332A4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0073334C_Tsa_0873334C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007333F8_Tsa_087333F8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007334B0_Tsa_087334B0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00733568_Tsa_08733568.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00733618_Tsa_08733618.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007336C4_Tsa_087336C4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0073376C_Tsa_0873376C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0073380C_Tsa_0873380C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00733940_Tsa_08733940.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00733A58_Tsa_08733A58.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00733B94_Tsa_08733B94.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00733CE4_Tsa_08733CE4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00733E20_Tsa_08733E20.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00733F24_Tsa_08733F24.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00733FC8_Tsa_08733FC8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00734064_Tsa_08734064.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00734100_Tsa_08734100.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0073419C_Tsa_0873419C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00734238_Tsa_08734238.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007342D4_Tsa_087342D4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00734390_Tsa_08734390.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007457A8_Tsa1_EfxChillEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00745B74_Tsa2_EfxChillEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00745FD0_Tsa3_EfxChillEffectBG.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00750288_Tsa_08750288.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007503E4_Tsa_087503E4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00750810_Tsa_08750810.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00754910_Tsa_08754910.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007549B8_Tsa_087549B8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00754A64_Tsa_08754A64.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00754B14_Tsa_08754B14.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00754BD8_Tsa_08754BD8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00754CA4_Tsa_08754CA4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00754D7C_Tsa_08754D7C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00754E5C_Tsa_08754E5C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00754F3C_Tsa_08754F3C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755028_Tsa_08755028.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/0075511C_Tsa_0875511C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755218_Tsa_08755218.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755310_Tsa_08755310.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755410_Tsa_08755410.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755510_Tsa_08755510.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755610_Tsa_08755610.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755714_Tsa_08755714.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755804_Tsa_08755804.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007558EC_Tsa_087558EC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/007559D0_Tsa_087559D0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755AB8_Tsa_08755AB8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755B94_Tsa_08755B94.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755C64_Tsa_08755C64.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755D20_Tsa_08755D20.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755DE0_Tsa_08755DE0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755E94_Tsa_08755E94.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/assets/tsa/00755F3C_Tsa_08755F3C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Img_DemonLightSprites_087A5BA4.4bpp.lz: LZ_FLAGS := -mindist 3
graphics/banim/_us/banim/dragonfx/Img_DemonLightSprites_087A5E9C.4bpp.lz: LZ_FLAGS := -mindist 3
graphics/banim/_us/banim/dragonfx/Tsa_8799818.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_8799ABC.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_8799D64.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_879A008.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_879A444.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_879A6A0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_879A87C.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_879A9E8.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_879AB10.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_1.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_3.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Close_4.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_0.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_1.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_2.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_3.map.bin.lz: LZ_FLAGS := -mindist 1
graphics/banim/_us/banim/dragonfx/Tsa_DemonLightBg3_Far_4.map.bin.lz: LZ_FLAGS := -mindist 1

src/data/worldmap_gmapunit/dat_worldmap_gmapunit_p761.o: \
  graphics/banim/efxlvupfx/Tsa10_EfxLvupBG.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa11_EfxLvupBG.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa1_EfxLvupBG.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa1_EfxLvupBG2.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa2_EfxLvupBG.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa2_EfxLvupBG2.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa3_EfxLvupBG.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa3_EfxLvupBG2.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa4_EfxLvupBG.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa4_EfxLvupBG2.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa5_EfxLvupBG.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa5_EfxLvupBG2.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa6_EfxLvupBG.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa6_EfxLvupBG2.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa7_EfxLvupBG.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa8_EfxLvupBG.map.bin.lz \
  graphics/banim/efxlvupfx/Tsa9_EfxLvupBG.map.bin.lz


src/data/banim_efxhitobj/dat_banim_efxhitobj.o: \
  graphics/banim/efxhitobj/Tsa1_EfxPierceNormalEffectBG.map.bin.lz \
  graphics/banim/efxhitobj/Tsa2_EfxPierceNormalEffectBG.map.bin.lz \
  graphics/banim/efxhitobj/Tsa3_EfxPierceNormalEffectBG.map.bin.lz \
  graphics/banim/efxhitobj/Tsa4_EfxPierceNormalEffectBG.map.bin.lz \
  graphics/banim/efxhitobj/Tsa5_EfxPierceNormalEffectBG.map.bin.lz \
  graphics/banim/efxhitobj/Tsa6_EfxPierceNormalEffectBG.map.bin.lz \
  graphics/banim/efxhitobj/Tsa7_EfxPierceNormalEffectBG.map.bin.lz \
  graphics/banim/efxhitobj/Tsa8_EfxPierceNormalEffectBG.map.bin.lz \
  graphics/banim/efxhitobj/Tsa9_EfxPierceNormalEffectBG.map.bin.lz \
  graphics/banim/dragonfx/Tsa_87932EC.map.bin.lz \
  graphics/banim/efxhitobj/TsaL_EfxPierceCriticalEffectBG.map.bin.lz \
  graphics/banim/efxhitobj/TsaR_EfxPierceCriticalEffectBG.map.bin.lz


src/data/worldmap_gmapunit/dat_worldmap_gmapunit_p756.o: \
  graphics/banim/efxbattle/TsaConf_BanimTmA1.map.bin \
  graphics/banim/efxbattle/TsaConf_BanimTmA2.map.bin \
  graphics/banim/efxbattle/TsaConf_BanimTmA3.map.bin \
  graphics/banim/efxbattle/TsaConf_BanimTmA4.map.bin


src/data/banimmisc/dat_data_banimmisc.o: \
  graphics/banim/misc/Tsa_EkrExpBar.map.bin \
  graphics/banim/misc/Tsa_EkrPopup.map.bin.lz


graphics/banim/efxhitobj/Tsa1_EfxPierceNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 2

graphics/banim/efxhitobj/Tsa2_EfxPierceNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 2

graphics/banim/efxhitobj/Tsa3_EfxPierceNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 2

graphics/banim/efxhitobj/Tsa4_EfxPierceNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 2

graphics/banim/efxhitobj/Tsa5_EfxPierceNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 2

graphics/banim/efxhitobj/Tsa6_EfxPierceNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 2

graphics/banim/efxhitobj/Tsa7_EfxPierceNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 2

graphics/banim/efxhitobj/Tsa8_EfxPierceNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 2

graphics/banim/efxhitobj/Tsa9_EfxPierceNormalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 2

graphics/banim/dragonfx/Tsa_87932EC.map.bin.lz: LZ_FLAGS := -mindist 2

graphics/banim/efxhitobj/TsaL_EfxPierceCriticalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 2

graphics/banim/efxhitobj/TsaR_EfxPierceCriticalEffectBG.map.bin.lz: LZ_FLAGS := -mindist 2
