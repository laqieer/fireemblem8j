	.syntax unified
	.set GetStringNextLine, 0x080D32B8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80D3658, "ax", %progbits
@ sub_80D3658 @ JP 0x080D3658 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D3658
	.thumb_func
sub_80D3658:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r5, [r7, #0x34]
	adds r0, r5, #0
	movs r1, #5
	bl __modsi3
	adds r4, r0, #0
	ldr r2, _080D3694 @ =0x08BB2E60
	ldr r0, _080D3698 @ =0x08BABAF4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	bl sub_8009FA8
	adds r6, r0, #0
	b _080D369E
	.align 2, 0
_080D3694: .4byte 0x08BB2E60
_080D3698: .4byte 0x08BABAF4
_080D369C:
	subs r5, #1
_080D369E:
	cmp r5, #0
	beq _080D36AE
	adds r0, r6, #0
	bl GetStringNextLine
	adds r6, r0, #0
	cmp r6, #0
	bne _080D369C
_080D36AE:
	ldr r5, _080D36DC @ =0x08BABAF4
	lsls r4, r4, #3
	adds r4, #0xbc
	ldr r0, [r5]
	adds r0, r0, r4
	bl sub_8003CF8
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _080D36E0 @ =0x0202393E
	movs r2, #0x11
	str r2, [sp]
	str r6, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	movs r0, #0
	str r0, [r7, #0x34]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D36DC: .4byte 0x08BABAF4
_080D36E0: .4byte 0x0202393E

