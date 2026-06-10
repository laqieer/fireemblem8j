	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B674, 0x0801B674 + 1
	.set sub_8041078, 0x08041078 + 1
	.section .text.sub_8041384, "ax", %progbits
@ sub_8041384 @ JP 0x08041384 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8041384
	.thumb_func
sub_8041384:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	movs r7, #0
	ldr r0, _080413B8 @ =0x0202BCEC
	ldrh r0, [r0, #0x10]
	cmp r0, #1
	bne _080413C4
	ldr r2, _080413BC @ =0x0203AA00
	adds r1, r2, #0
	adds r1, #0x86
	strb r0, [r1]
	ldr r0, _080413C0 @ =0x03004DF0
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	adds r3, r2, #0
	adds r3, #0x87
	strb r0, [r3]
	ldrb r1, [r1, #0x11]
	adds r0, r2, #0
	adds r0, #0x88
	b _080414EA
	.align 2, 0
_080413B8: .4byte 0x0202BCEC
_080413BC: .4byte 0x0203AA00
_080413C0: .4byte 0x03004DF0
_080413C4:
	ldr r0, _080414CC @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _080414D0 @ =0x03004DF0
	ldr r0, [r0]
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	movs r0, #0xa6
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0xa6
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_801B674
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_8041078
	ldr r0, [sp]
	mov r1, sl
	ldrb r1, [r1]
	cmp r0, r1
	blt _080414E4
	ldr r0, _080414D4 @ =0x0202E4D0
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _080414A4
_0804141C:
	ldr r0, _080414D4 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r2, r0, #1
	subs r0, r6, #1
	mov sb, r0
	cmp r2, #0
	blt _0804149E
_0804142C:
	ldr r0, _080414D8 @ =0x0202E4D4
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r4, [r0]
	subs r2, #1
	mov r8, r2
	cmp r4, #0
	beq _08041498
	ldr r0, _080414DC @ =0x0202BE40
	ldrb r1, [r0]
	cmp r4, r1
	beq _08041498
	ldrb r0, [r0]
	adds r1, r4, #0
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041498
	adds r0, r4, #0
	bl GetUnit
	adds r4, r0, #0
	mov r2, sl
	ldr r3, [r2, #4]
	ldrb r2, [r3]
	cmp r2, #0
	beq _08041498
	ldr r0, [r4]
	ldrb r1, [r0, #4]
	adds r5, r0, #0
	cmp r1, r2
	bne _0804147E
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	ldrb r1, [r3, #1]
	cmp r0, r1
	beq _08041496
_0804147E:
	adds r3, #0x14
	ldrb r1, [r3]
	cmp r1, #0
	beq _08041498
	ldrb r0, [r5, #4]
	cmp r0, r1
	bne _0804147E
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	ldrb r2, [r3, #1]
	cmp r0, r2
	bne _0804147E
_08041496:
	adds r7, #1
_08041498:
	mov r2, r8
	cmp r2, #0
	bge _0804142C
_0804149E:
	mov r6, sb
	cmp r6, #0
	bge _0804141C
_080414A4:
	mov r0, sl
	ldrb r0, [r0, #1]
	cmp r7, r0
	bge _080414E4
	ldr r2, _080414E0 @ =0x0203AA00
	adds r1, r2, #0
	adds r1, #0x86
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080414D0 @ =0x03004DF0
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	adds r3, r2, #0
	adds r3, #0x87
	strb r0, [r3]
	ldrb r1, [r1, #0x11]
	adds r0, r2, #0
	adds r0, #0x88
	b _080414EA
	.align 2, 0
_080414CC: .4byte 0x0202E4E0
_080414D0: .4byte 0x03004DF0
_080414D4: .4byte 0x0202E4D0
_080414D8: .4byte 0x0202E4D4
_080414DC: .4byte 0x0202BE40
_080414E0: .4byte 0x0203AA00
_080414E4:
	ldr r0, _08041500 @ =0x0203AA00
	adds r0, #0x86
	movs r1, #0
_080414EA:
	strb r1, [r0]
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041500: .4byte 0x0203AA00

