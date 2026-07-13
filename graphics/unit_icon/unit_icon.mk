# graphics/unit_icon -- per-subsystem asset wiring (parallel-safe pin mechanism).
# Auto-included by the root Makefile via `-include $(GRAPHICS_MK)`. See
# graphics/misc/misc.mk for the convention.
#
# src/data/unit_icon/const_data_unit_icon_wait.c includes 107 rebuilt
# graphics/unit_icon/wait/*.4bpp.lz map-sprite sheets (each PNG -> 4bpp -> LZ77 via
# the generic %.4bpp:%.png and %.lz:% rules). Region-SAME with US (JP 0x081a71e0 ==
# US 0x081b7828). These are LZ-COMPRESSED, so -mindist must byte-match the original
# FE8 compressor PER ASSET: 95 sheets use gbagfx's default (mindist 2); the 12 below
# need mindist 1 (discovered by the original 1/2/3 sweep).
UNIT_ICON_WAIT_LZ := $(patsubst %.png,%.4bpp.lz,$(wildcard graphics/unit_icon/wait/*.png))
src/data/unit_icon/const_data_unit_icon_wait.o: $(UNIT_ICON_WAIT_LZ)

graphics/unit_icon/wait/unit_icon_wait_Archer_sheet.4bpp.lz:      LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Archer_F_sheet.4bpp.lz:    LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Sage_sheet.4bpp.lz:        LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Pirate_sheet.4bpp.lz:      LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Monk_sheet.4bpp.lz:        LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Necromancer_sheet.4bpp.lz: LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Bonewalker_sheet.4bpp.lz:  LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Wight_sheet.4bpp.lz:       LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Wight_Bow_sheet.4bpp.lz:   LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Peer_sheet.4bpp.lz:        LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Prince_sheet.4bpp.lz:      LZ_FLAGS := -mindist 1
graphics/unit_icon/wait/unit_icon_wait_Unk77_sheet.4bpp.lz:       LZ_FLAGS := -mindist 1

# --- unit_icon/move map-sprite sheets (Phase 1, batch 2) ---------------------
# 82 region-SAME MOVE sheets across 80 dat_const_data_unit_icon_move_p*.o objects
# (each PNG -> 4bpp -> LZ77, gbagfx DEFAULT mindist 2 -> NO per-asset pins). The
# Region-different sheets were later migrated to live src/data providers. Generic
# object prerequisites are generated in layout/data_incbin_deps.mk.

# --- unit_icon/move batch 3: 14 region-different sheets (D307) ----------------
# These require -num_tiles N (from fe8u graphics_file_rules.mk) to reproduce the
# original compressed data byte-identically. mindist 2 in all cases.
MOVEUNITGFXDIR_D307 := graphics/unit_icon/move

$(MOVEUNITGFXDIR_D307)/unit_icon_move_Ephraim_Master_Lord_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Eirika_Master_Lord_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Hero_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Hero_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Swordmaster_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Swordmaster_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Bishop_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Bishop_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Journeyman_T2_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 241
$(MOVEUNITGFXDIR_D307)/unit_icon_move_General_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Wyvern_Lord_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Wyvern_Knight_F_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Cyclops_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242
$(MOVEUNITGFXDIR_D307)/unit_icon_move_Draco_Zombie_sheet.4bpp: %.4bpp: %.png
	$(GBAGFX) $< $@ -num_tiles 242

graphics/unit_icon/move/unit_icon_move_Ephraim_Master_Lord_sheet.4bpp.lz: LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Eirika_Master_Lord_sheet.4bpp.lz:  LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Hero_sheet.4bpp.lz:                LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Hero_F_sheet.4bpp.lz:              LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Swordmaster_sheet.4bpp.lz:         LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Swordmaster_F_sheet.4bpp.lz:       LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Bishop_sheet.4bpp.lz:              LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Bishop_F_sheet.4bpp.lz:            LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Journeyman_T2_sheet.4bpp.lz:       LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_General_sheet.4bpp.lz:             LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Wyvern_Lord_F_sheet.4bpp.lz:       LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Wyvern_Knight_F_sheet.4bpp.lz:     LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Cyclops_sheet.4bpp.lz:             LZ_FLAGS := -mindist 2
graphics/unit_icon/move/unit_icon_move_Draco_Zombie_sheet.4bpp.lz:        LZ_FLAGS := -mindist 2
