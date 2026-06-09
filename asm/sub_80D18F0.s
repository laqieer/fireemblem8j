	.syntax unified
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D19DC, 0x080D19DC + 1
	.section .text.sub_80D18F0, "ax", %progbits
@ sub_80D18F0 @ JP 0x080D18F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D18F0
	.thumb_func
sub_80D18F0:
	push {r4, lr}
	ldr r4, _080D1918 @ =0x08AB162C
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080D191C @ =0x06003000
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080D1920 @ =0x02023CA8
	ldr r1, _080D1924 @ =0x08AB17A4
	movs r2, #0x8c
	lsls r2, r2, #5
	bl sub_80D19DC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1918: .4byte 0x08AB162C
_080D191C: .4byte 0x06003000
_080D1920: .4byte 0x02023CA8
_080D1924: .4byte 0x08AB17A4

