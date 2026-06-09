	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_802512C, "ax", %progbits
@ sub_802512C @ JP 0x0802512C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802512C
	.thumb_func
sub_802512C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08025160 @ =0x02033F38
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802515A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_0802515A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025160: .4byte 0x02033F38

