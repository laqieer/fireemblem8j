	.syntax unified
	.set sub_8086350, 0x08086350 + 1
	.section .text.sub_802404C, "ax", %progbits
@ sub_802404C @ JP 0x0802404C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802404C
	.thumb_func
sub_802404C:
	push {lr}
	ldr r0, _08024068 @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _08024064
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802406C
_08024064:
	movs r0, #3
	b _08024082
	.align 2, 0
_08024068: .4byte 0x03004DF0
_0802406C:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_8086350
	movs r1, #3
	cmp r0, #0x18
	bne _08024080
	movs r1, #1
_08024080:
	adds r0, r1, #0
_08024082:
	pop {r1}
	bx r1
	.align 2, 0

