# graphics/misc_gfx -- graphics blobs carved from mixed data providers
# (map-anim FX, UI palettes, opening-anim, title-screen, phase-change).
# LZ77 -> DECOMPRESSED .bin (%.lz: % gbagfx); uncompressed palette -> .pal
# (-> .gbapal); bit-15-set palettes / verbatim blobs -> .bin incbin'd direct.






src/data/mapanim/mapanim_battleinfo.o: \
  graphics/misc_gfx/Img_GmapSoguSprites.4bpp.lz \
  graphics/misc_gfx/Img_LinkArenaWarpFx.4bpp.lz \
  graphics/misc_gfx/Img_MapAnimAntitoxinPureWater.4bpp.lz \
  graphics/misc_gfx/Img_MapAnimBerserkfx.4bpp.lz \
  graphics/misc_gfx/Img_MapAnimBerserkfx_1.4bpp.lz \
  graphics/misc_gfx/Img_MapAnimRepairfx.4bpp.lz \
  graphics/misc_gfx/Img_MapAnimTorchfx.4bpp.lz \
  graphics/misc_gfx/Img_MapAnimUnlockBgfx.4bpp.lz \
  graphics/misc_gfx/Img_MapAnimUnlockObjfx.4bpp.lz \
  graphics/misc_gfx/Img_MapBattleInfoBox.4bpp.lz \
  graphics/misc_gfx/Img_MapBattleInfoHpBar.4bpp.lz \
  graphics/misc_gfx/Img_MapBattleInfoNum.4bpp.lz \
  graphics/misc_gfx/Img_PoisonAnim.4bpp.lz \
  graphics/misc_gfx/Img_ShopGoldBox.4bpp.lz \
  graphics/misc_gfx/Img_WallBreakAnim.4bpp.lz \
  graphics/misc_gfx/Pal_MapAnimBerserkfx.gbapal \
  graphics/misc_gfx/Pal_MapAnimBerserkfx_2.gbapal \
  graphics/misc_gfx/Pal_MapBattleInfoBlue.gbapal \
  graphics/misc_gfx/Pal_MapBattleInfoGreen.gbapal \
  graphics/misc_gfx/Pal_MapBattleInfoPurple.gbapal \
  graphics/misc_gfx/Pal_MapBattleInfoRed.gbapal \
  graphics/misc_gfx/Pal_PoisonAnim.gbapal \
  graphics/misc_gfx/Pal_WallBreakAnim.gbapal \
  graphics/misc_gfx/Tsa_MapBattleBoxGfx1.bin.lz \
  graphics/misc_gfx/Tsa_MapBattleBoxGfx2.bin.lz \
  graphics/misc_gfx/Tsa_MapBattleBoxGfx3.bin.lz \
  graphics/misc_gfx/Tsa_ShopWindows.bin.lz

src/data/mapanim/mapanim_monster_gorgon.o: \
  graphics/misc_gfx/Img_GorgonHatchCloud.4bpp.lz \
  graphics/misc_gfx/Img_MonsterStoneMapAnimfx.4bpp.lz \
  graphics/misc_gfx/Pal_GorgonHatchCloud.gbapal \
  graphics/misc_gfx/Pal_MonsterStoneMapAnimfx.gbapal \
  graphics/misc_gfx/Tsa_GorgonHatchCloud_A.bin.lz \
  graphics/misc_gfx/Tsa_GorgonHatchCloud_B.bin.lz \
  graphics/misc_gfx/Tsa_GorgonHatchCloud_C.bin.lz \
  graphics/misc_gfx/Tsa_GorgonHatchCloud_D.bin.lz \
  graphics/misc_gfx/Tsa_GorgonHatchCloud_E.bin.lz \
  graphics/misc_gfx/Tsa_GorgonHatchCloud_F.bin.lz \
  graphics/misc_gfx/Tsa_GorgonHatchCloud_G.bin.lz

src/data/mapanim/mapanim_nightmare.o: \
  graphics/misc_gfx/Img_ManimBarrierBgfx.4bpp.lz \
  graphics/misc_gfx/Img_NightMareMapAnimfx.4bpp.lz \
  graphics/misc_gfx/Pal_NightMareMapAnimfx.gbapal \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx1.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx10.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx11.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx12.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx13.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx14.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx15.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx16.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx17.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx18.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx19.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx2.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx20.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx21.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx22.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx23.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx24.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx25.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx26.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx27.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx28.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx29.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx3.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx30.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx31.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx32.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx33.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx4.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx5.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx6.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx7.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx8.bin.lz \
  graphics/misc_gfx/Tsa_NightMareMapAnimfx9.bin.lz
