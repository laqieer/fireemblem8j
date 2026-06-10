# graphics/worldmap -- worldmap sprite/path graphics (region-SAME with US
# graphics/misc). dat_anim_worldmap_sprite.s is mostly descriptive OAM/rect data
# tables (Sprite_0, gWorldmapSprite_N) -- left as incbin (data-table phase). Only
# the three real graphics blobs are extracted here:
#   gImg_WorldmapNodeRevealEffect  LZ tiles  (png -> 4bpp -> lz, mindist 2)
#   Img_GmapPath                   LZ tiles  (png -> 4bpp -> lz, mindist 2)
#   gPal_WorldmapNodeRevealEffect  uncompressed palette (.pal -> .gbapal)

asm/dat_anim_worldmap_sprite.o: \
  graphics/worldmap/Img_GmapPath.4bpp.lz \
  graphics/worldmap/gImg_WorldmapNodeRevealEffect.4bpp.lz \
  graphics/worldmap/gPal_WorldmapNodeRevealEffect.gbapal
