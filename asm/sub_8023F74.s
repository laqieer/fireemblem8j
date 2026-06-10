	.syntax unified
	.set sub_80A0DD8, 0x080A0DD8 + 1
	.section .text.sub_8023F74, "ax", %progbits
@ sub_8023F74 @ JP 0x08023F74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023F74
	.thumb_func
sub_8023F74:
	push {lr}
	ldr r1, _08023F8C @ =0x0203A954
	movs r0, #0x1d
	strb r0, [r1, #0x11]
	ldr r0, _08023F90 @ =0x03004DF0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80A0DD8
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08023F8C: .4byte 0x0203A954
_08023F90: .4byte 0x03004DF0

