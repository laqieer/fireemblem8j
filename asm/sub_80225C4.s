	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80225C4, "ax", %progbits
@ sub_80225C4 @ JP 0x080225C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80225C4
	.thumb_func
sub_80225C4:
	push {lr}
	ldr r0, _080225D4 @ =0x085C2F58
	bl Proc_EndEach
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080225D4: .4byte 0x085C2F58

