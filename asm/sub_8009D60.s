	.syntax unified
	.set sub_80CA1D4, 0x080CA1D4 + 1
	.section .text.sub_8009D60, "ax", %progbits
@ sub_8009D60 @ JP 0x08009D60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009D60
	.thumb_func
sub_8009D60:
	push {lr}
	adds r3, r0, #0
	ldr r2, _08009D84 @ =0x0202BCEC
	ldrb r1, [r2, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08009D7E
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08009D7E
	adds r0, r3, #0
	bl sub_80CA1D4
_08009D7E:
	pop {r0}
	bx r0
	.align 2, 0
_08009D84: .4byte 0x0202BCEC

