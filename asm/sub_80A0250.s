	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80A019C, 0x080A019C + 1
	.section .text.sub_80A0250, "ax", %progbits
@ sub_80A0250 @ JP 0x080A0250 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A0250
	.thumb_func
sub_80A0250:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r1, r6, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _080A027E
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r3, r0, #0
	subs r3, #0x60
_080A027E:
	adds r5, r6, #0
	adds r5, #0x35
	cmp r4, #4
	bne _080A029E
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A0290
	movs r0, #8
	b _080A0292
_080A0290:
	subs r0, #1
_080A0292:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_80A019C
	ldr r3, [sp]
_080A029E:
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r7
	blt _080A02BE
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	adds r3, r0, #0
_080A02BE:
	movs r0, #0xff
	ands r3, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	lsls r0, r7, #1
	cmp r1, r0
	bne _080A02EC
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_080A02EC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

