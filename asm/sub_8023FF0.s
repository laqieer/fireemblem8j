	.syntax unified
	.set sub_8086350, 0x08086350 + 1
	.section .text.sub_8023FF0, "ax", %progbits
@ sub_8023FF0 @ JP 0x08023FF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023FF0
	.thumb_func
sub_8023FF0:
	push {lr}
	ldr r0, _0802400C @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _08024008
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08024010
_08024008:
	movs r0, #3
	b _08024026
	.align 2, 0
_0802400C: .4byte 0x03004DF0
_08024010:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_8086350
	movs r1, #3
	cmp r0, #0x17
	bne _08024024
	movs r1, #1
_08024024:
	adds r0, r1, #0
_08024026:
	pop {r1}
	bx r1
	.align 2, 0

