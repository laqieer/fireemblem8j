	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8033168, "ax", %progbits
@ sub_8033168 @ JP 0x08033168 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033168
	.thumb_func
sub_8033168:
	push {r4, r5, lr}
	ldr r0, _0803317C @ =0x0202BCEC
	ldrb r1, [r0, #0x1b]
	cmp r1, #1
	blt _08033186
	cmp r1, #2
	ble _08033180
	cmp r1, #3
	beq _08033184
	b _08033186
	.align 2, 0
_0803317C: .4byte 0x0202BCEC
_08033180:
	movs r5, #1
	b _08033186
_08033184:
	movs r5, #0xf
_08033186:
	ldrb r0, [r0, #0xe]
	cmp r0, #5
	bne _08033194
	movs r0, #0xf
	b _080331D4
_08033190:
	ldrb r0, [r2, #4]
	b _080331D4
_08033194:
	bl sub_80C1E74
	cmp r0, #0
	beq _080331D2
	adds r0, r5, #0
	bl GetUnitFromCharId
	cmp r0, #0
	beq _080331B0
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080331D2
_080331B0:
	movs r4, #1
_080331B2:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080331CC
	ldr r2, [r0]
	cmp r2, #0
	beq _080331CC
	ldr r0, [r0, #0xc]
	ldr r1, _080331DC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _08033190
_080331CC:
	adds r4, #1
	cmp r4, #0x3f
	ble _080331B2
_080331D2:
	adds r0, r5, #0
_080331D4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080331DC: .4byte 0x0001000C

