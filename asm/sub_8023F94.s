	.syntax unified
	.set sub_8086350, 0x08086350 + 1
	.section .text.sub_8023F94, "ax", %progbits
@ sub_8023F94 @ JP 0x08023F94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023F94
	.thumb_func
sub_8023F94:
	push {lr}
	ldr r0, _08023FB0 @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _08023FAC
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023FB4
_08023FAC:
	movs r0, #3
	b _08023FCA
	.align 2, 0
_08023FB0: .4byte 0x03004DF0
_08023FB4:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_8086350
	movs r1, #3
	cmp r0, #0x16
	bne _08023FC8
	movs r1, #1
_08023FC8:
	adds r0, r1, #0
_08023FCA:
	pop {r1}
	bx r1
	.align 2, 0

