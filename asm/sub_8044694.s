	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.section .text.sub_8044694, "ax", %progbits
@ sub_8044694 @ JP 0x08044694 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8044694
	.thumb_func
sub_8044694:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r4, #0x3d
	ldr r5, _080446DC @ =0x0203DD18
	adds r0, r5, #0
	bl sub_8003CF8
	ldrb r0, [r4]
	cmp r0, #0
	beq _080446C6
	adds r6, r5, #0
	movs r5, #0
_080446AC:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8003D84
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80040B8
	adds r4, r0, #0
	adds r5, #9
	ldrb r0, [r4]
	cmp r0, #0
	bne _080446AC
_080446C6:
	ldr r0, _080446DC @ =0x0203DD18
	ldr r1, _080446E0 @ =0x02022E00
	bl PutText
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080446DC: .4byte 0x0203DD18
_080446E0: .4byte 0x02022E00

