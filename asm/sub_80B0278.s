	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutText, 0x08003DA0 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80B0278, "ax", %progbits
@ SaveMenuDrawSubSelBoxExt @ JP 0x080B0278 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SaveMenuDrawSubSelBoxExt
	.thumb_func
SaveMenuDrawSubSelBoxExt:
	push {r4, r5, lr}
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _080B02DC
	bl sub_8009FA8
	adds r5, r0, #0
	ldr r0, _080B02CC @ =0x02000920
	bl SetTextFont
	ldr r4, _080B02D0 @ =0x02000938
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D84
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8003F28
	adds r0, r4, #0
	movs r1, #0x2c
	bl sub_8003D84
	ldr r0, _080B02D4 @ =0x000007C3
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	ldr r1, _080B02D8 @ =0x020238F6
	adds r0, r4, #0
	bl PutText
	b _080B02E8
	.align 2, 0
_080B02CC: .4byte 0x02000920
_080B02D0: .4byte 0x02000938
_080B02D4: .4byte 0x000007C3
_080B02D8: .4byte 0x020238F6
_080B02DC:
	ldr r0, _080B02F4 @ =0x020238F6
	movs r1, #0xb
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
_080B02E8:
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B02F4: .4byte 0x020238F6

