	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.section .text.sub_8025DCC, "ax", %progbits
@ sub_8025DCC @ JP 0x08025DCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025DCC
	.thumb_func
sub_8025DCC:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08025E1C @ =0x02033F38
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025E16
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08025E16
	adds r0, r5, #0
	bl sub_8018E64
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_8018EA4
	cmp r4, r0
	beq _08025E16
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
_08025E16:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025E1C: .4byte 0x02033F38

