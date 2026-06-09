	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_8089078, "ax", %progbits
@ sub_8089078 @ JP 0x08089078 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089078
	.thumb_func
sub_8089078:
	push {lr}
	ldr r0, _08089084 @ =0x08A7279C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08089084: .4byte 0x08A7279C

