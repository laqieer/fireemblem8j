	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_807702C, "ax", %progbits
@ sub_807702C @ JP 0x0807702C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807702C
	.thumb_func
sub_807702C:
	push {lr}
	ldr r0, _08077040 @ =0x087A9A98
	bl Proc_EndEach
	ldr r1, _08077044 @ =0x02020138
	movs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08077040: .4byte 0x087A9A98
_08077044: .4byte 0x02020138

