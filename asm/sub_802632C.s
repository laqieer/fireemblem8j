	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set GetCurrentPhase, 0x08024D6C + 1
	.set GetUnit, 0x08019108 + 1
	.set InitTargets, 0x08050618 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.section .text.sub_802632C, "ax", %progbits
@ sub_802632C @ JP 0x0802632C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802632C
	.thumb_func
sub_802632C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl InitTargets
	bl GetCurrentPhase
	adds r7, r0, #0
	adds r6, r7, #1
	b _080263A4
_0802634E:
	adds r0, r6, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _080263A0
	ldr r0, [r5]
	cmp r0, #0
	beq _080263A0
	ldr r0, [r5, #0xc]
	ldr r1, _080263B4 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080263A0
	adds r0, r5, #0
	bl sub_8018E64
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_8018EA4
	cmp r4, r0
	bne _0802638A
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080263A0
_0802638A:
	cmp r5, r8
	beq _080263A0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
_080263A0:
	adds r6, #1
	adds r0, r7, #0
_080263A4:
	adds r0, #0x80
	cmp r6, r0
	blt _0802634E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080263B4: .4byte 0x0001000C

