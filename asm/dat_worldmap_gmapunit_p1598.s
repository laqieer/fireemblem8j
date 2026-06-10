	.section .rodata.dat_worldmap_gmapunit_p1598, "a", %progbits
@ Img_MenuScrollBar — the menu scroll-bar UI graphic (16x64, 4bpp), JP ROM file
@ offset 0x00A9645C, length 0xA0 (160 bytes, LZ77-compressed).
@
@ PILOT ASSET (Phase 0): this is the FIRST FE8J region whose ROM bytes come from
@ a REBUILT, committed source asset instead of `.incbin "baserom.gba"`:
@
@   graphics/misc/Img_MenuScrollBar.png   (committed source, extracted from ROM)
@     --gbagfx-->  .4bpp  --gbagfx -mindist 2-->  .4bpp.lz  --.incbin-->  here.
@
@ The Makefile builds Img_MenuScrollBar.4bpp.lz from the PNG via the generic asset
@ rules (%.4bpp: %.png, %.lz: %); the per-asset LZ_FLAGS pin -mindist 2 (gbagfx's
@ default, the value that byte-matches the original FE8 compressor here). With
@ baserom.gba REMOVED, this region is still produced byte-for-byte by gbagfx, and
@ `make compare` stays OK. See docs/tools/gbagfx.md.
	.global Img_MenuScrollBar
Img_MenuScrollBar:
	.incbin "graphics/misc/Img_MenuScrollBar.4bpp.lz"
	.size Img_MenuScrollBar, .-Img_MenuScrollBar
