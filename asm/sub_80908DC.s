	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8089094, 0x08089094 + 1
	.set sub_808FF94, 0x0808FF94 + 1
	.set sub_8090474, 0x08090474 + 1
	.section .text.sub_80908DC, "ax", %progbits
@ sub_80908DC @ JP 0x080908DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80908DC
	.thumb_func
sub_80908DC:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x2e
	ldrb r7, [r3]
	adds r4, r5, #0
	adds r4, #0x3e
	movs r0, #0
	strb r0, [r4]
	ldr r1, _0809090C @ =0x085775CC
	ldr r6, [r1]
	ldrh r2, [r6, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	mov ip, r1
	cmp r0, #0
	beq _08090910
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_808FF94
	b _080909E4
	.align 2, 0
_0809090C: .4byte 0x085775CC
_08090910:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08090964
	ldrb r1, [r3]
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	beq _08090944
	ldr r0, [r2, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08090944
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	bl sub_8089094
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_08090944:
	ldr r0, _08090960 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08090956
	movs r0, #0x6a
	bl m4aSongNumStart
_08090956:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _080909E4
	.align 2, 0
_08090960: .4byte 0x0202BCEC
_08090964:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0809098C
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _08090988 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080909E4
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080909E4
	.align 2, 0
_08090988: .4byte 0x0202BCEC
_0809098C:
	ldrh r1, [r6, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080909A0
	ldrb r0, [r3]
	cmp r0, #0
	beq _080909A0
	subs r0, #1
	strb r0, [r3]
_080909A0:
	mov r1, ip
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x2e
	cmp r0, #0
	beq _080909BC
	ldrb r0, [r4]
	cmp r0, #0
	bne _080909BC
	adds r0, #1
	strb r0, [r4]
_080909BC:
	ldrb r0, [r4]
	cmp r0, r7
	beq _080909E4
	ldr r0, _080909EC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080909D4
	movs r0, #0x66
	bl m4aSongNumStart
_080909D4:
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_8090474
_080909E4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080909EC: .4byte 0x0202BCEC

