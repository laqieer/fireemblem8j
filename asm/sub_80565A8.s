	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_80733E8, 0x080733E8 + 1
	.section .text.sub_80565A8, "ax", %progbits
@ sub_80565A8 @ JP 0x080565A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80565A8
	.thumb_func
sub_80565A8:
	push {r4, lr}
	sub sp, #8
	adds r3, r0, #0
	ldr r0, _080565DC @ =0x0203E11C
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r4, r2, #0
	cmp r0, #0
	bne _080565BC
	adds r4, r1, #0
_080565BC:
	adds r0, r3, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080565E4
	ldr r1, _080565E0 @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_80733E8
	b _080565F8
	.align 2, 0
_080565DC: .4byte 0x0203E11C
_080565E0: .4byte 0x020234A8
_080565E4:
	ldr r1, _08056608 @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_080565F8:
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056608: .4byte 0x020234A8

