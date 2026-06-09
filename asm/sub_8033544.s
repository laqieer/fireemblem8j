	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_808B7E0, 0x0808B7E0 + 1
	.section .text.sub_8033544, "ax", %progbits
@ sub_8033544 @ JP 0x08033544 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033544
	.thumb_func
sub_8033544:
	push {lr}
	bl sub_808B7E0
	ldr r0, _08033554 @ =0x085C6084
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08033554: .4byte 0x085C6084

