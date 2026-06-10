	.syntax unified
	.set sub_80187B0, 0x080187B0 + 1
	.section .text.sub_8023E14, "ax", %progbits
@ sub_8023E14 @ JP 0x08023E14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023E14
	.thumb_func
sub_8023E14:
	push {r4, lr}
	ldr r4, _08023E30 @ =0x0203A954
	movs r0, #0x14
	strb r0, [r4, #0x11]
	ldr r0, _08023E34 @ =0x03004DF0
	ldr r0, [r0]
	movs r1, #0x21
	bl sub_80187B0
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023E30: .4byte 0x0203A954
_08023E34: .4byte 0x03004DF0

