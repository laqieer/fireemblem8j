	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_8089E90, "ax", %progbits
@ sub_8089E90 @ JP 0x08089E90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089E90
	.thumb_func
sub_8089E90:
	push {lr}
	ldr r0, _08089EB8 @ =0x08A728FC
	bl Proc_EndEach
	ldr r2, _08089EBC @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_08089EB8: .4byte 0x08A728FC
_08089EBC: .4byte 0x03003020

