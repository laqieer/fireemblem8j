	.syntax unified
	.set GenerateExtendedMovementMap, 0x0801A138 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.section .text.sub_80181F4, "ax", %progbits
@ sub_80181F4 @ JP 0x080181F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80181F4
	.thumb_func
sub_80181F4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	str r1, [sp]
	str r2, [sp, #4]
	ldr r0, _080182F4 @ =0x0000270F
	str r0, [sp, #8]
	ldr r1, _080182F8 @ =0x085C2A50
	movs r4, #0xff
	mov r2, r8
	ldrb r0, [r2, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov sl, r0
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080182FC @ =0x088600EE
	bl GenerateExtendedMovementMap
	ldr r0, _08018300 @ =0x03004DF0
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r3, _08018304 @ =0x0202E4D4
	ldr r1, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r4, [r0]
	mov r1, r8
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, r8
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08018308 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801833A
_08018268:
	ldr r0, _08018308 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	ldr r2, _08018304 @ =0x0202E4D4
	subs r0, r6, #1
	mov sb, r0
	cmp r5, #0
	blt _08018334
	lsls r7, r6, #2
_0801827C:
	ldr r0, _0801830C @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801832E
	ldr r0, [r2]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801832E
	ldr r0, _08018310 @ =0x0202E4E8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801832E
	ldr r0, _08018314 @ =0x0202E4D8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r4, [r0]
	mov r0, sl
	bl GetUnitMovementCost
	movs r1, #0
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080182D0
	movs r1, #1
_080182D0:
	ldr r2, _08018304 @ =0x0202E4D4
	cmp r1, #0
	beq _0801832E
	mov r1, r8
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	subs r2, r5, r0
	cmp r2, #0
	bge _080182E4
	subs r2, r0, r5
_080182E4:
	mov r1, r8
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	subs r1, r6, r0
	cmp r1, #0
	blt _08018318
	adds r0, r2, r1
	b _0801831C
	.align 2, 0
_080182F4: .4byte 0x0000270F
_080182F8: .4byte 0x085C2A50
_080182FC: .4byte 0x088600EE
_08018300: .4byte 0x03004DF0
_08018304: .4byte 0x0202E4D4
_08018308: .4byte 0x0202E4D0
_0801830C: .4byte 0x0202E4DC
_08018310: .4byte 0x0202E4E8
_08018314: .4byte 0x0202E4D8
_08018318:
	subs r0, r0, r6
	adds r0, r2, r0
_0801831C:
	ldr r2, _08018368 @ =0x0202E4D4
	ldr r1, [sp, #8]
	cmp r1, r0
	blt _0801832E
	str r0, [sp, #8]
	ldr r0, [sp]
	str r5, [r0]
	ldr r1, [sp, #4]
	str r6, [r1]
_0801832E:
	subs r5, #1
	cmp r5, #0
	bge _0801827C
_08018334:
	mov r6, sb
	cmp r6, #0
	bge _08018268
_0801833A:
	ldr r0, _0801836C @ =0x03004DF0
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08018368 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018368: .4byte 0x0202E4D4
_0801836C: .4byte 0x03004DF0

