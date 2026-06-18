	.syntax unified
	.set sub_8026ED0, 0x08026ED0 + 1
	.set sub_8027BDC, 0x08027BDC + 1
	.section .text.sub_80B5BB0, "ax", %progbits
@ BonusClaim_DrawTargetUnitSprites @ JP 0x080B5BB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BonusClaim_DrawTargetUnitSprites
	.thumb_func
BonusClaim_DrawTargetUnitSprites:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _080B5C18
	movs r4, #0x30
_080B5BC4:
	ldr r0, _080B5BF0 @ =0x08A9E50C
	ldr r1, [r0]
	lsls r0, r5, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B5BF4
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x70
	adds r2, r4, #0
	movs r3, #0xc4
	lsls r3, r3, #8
	bl sub_8027BDC
	b _080B5C08
	.align 2, 0
_080B5BF0: .4byte 0x08A9E50C
_080B5BF4:
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x70
	adds r2, r4, #0
	movs r3, #0xf4
	lsls r3, r3, #8
	bl sub_8027BDC
_080B5C08:
	adds r4, #0x10
	adds r5, #1
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	blt _080B5BC4
_080B5C18:
	bl sub_8026ED0
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

