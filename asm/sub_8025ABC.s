	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set IsSameAllegiance, 0x08024D54 + 1
	.section .text.sub_8025ABC, "ax", %progbits
@ sub_8025ABC @ JP 0x08025ABC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025ABC
	.thumb_func
sub_8025ABC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08025B0C @ =0x02033F38
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl IsSameAllegiance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025B06
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08025B06
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _08025B06
	cmp r1, #0xd
	beq _08025B06
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_08025B06:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025B0C: .4byte 0x02033F38

