	.syntax unified
	.set sub_8018EC4, 0x08018EC4 + 1
	.set sub_8018EE4, 0x08018EE4 + 1
	.set sub_8018F84, 0x08018F84 + 1
	.section .text.sub_802CC14, "ax", %progbits
@ sub_802CC14 @ JP 0x0802CC14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802CC14
	.thumb_func
sub_802CC14:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl sub_8018EC4
	adds r4, r0, #0
	adds r0, r6, #0
	bl sub_8018F84
	subs r4, r4, r0
	lsls r0, r4, #2
	adds r7, r0, r4
	adds r0, r5, #0
	bl sub_8018EE4
	adds r4, r0, #0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802CC44
	subs r1, r0, r2
_0802CC44:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _0802CC54
	subs r0, r2, r3
_0802CC54:
	adds r2, r1, r0
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	bne _0802CC66
	adds r1, r7, r4
	lsls r0, r2, #1
	subs r1, r1, r0
	b _0802CC70
_0802CC66:
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r7, r0
	lsls r1, r2, #1
	subs r1, r0, r1
_0802CC70:
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	beq _0802CC84
	ldr r0, [r6]
	ldrb r0, [r0, #4]
	cmp r0, #0x40
	beq _0802CC84
	cmp r0, #0x6c
	bne _0802CC88
_0802CC84:
	movs r0, #0
	b _0802CC96
_0802CC88:
	cmp r1, #0
	bge _0802CC8E
	movs r1, #0
_0802CC8E:
	cmp r1, #0x64
	ble _0802CC94
	movs r1, #0x64
_0802CC94:
	adds r0, r1, #0
_0802CC96:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

