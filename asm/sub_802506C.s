	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_802506C, "ax", %progbits
@ sub_802506C @ JP 0x0802506C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802506C
	.thumb_func
sub_802506C:
	push {r4, r5, r6, lr}
	movs r0, #0
	bl sub_802EAC4
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0802511E
	ldr r6, _08025124 @ =0x0202E4D8
	ldr r5, _08025128 @ =0x0202E4E0
_08025080:
	cmp r0, #2
	bne _08025116
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _080250B4
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080250B4
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl AddTarget
_080250B4:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _080250E6
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080250E6
	adds r1, #1
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl AddTarget
_080250E6:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _08025116
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08025116
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl AddTarget
_08025116:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08025080
_0802511E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025124: .4byte 0x0202E4D8
_08025128: .4byte 0x0202E4E0

