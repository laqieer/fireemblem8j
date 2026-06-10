	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8013990, "ax", %progbits
@ sub_8013990 @ JP 0x08013990 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013990
	.thumb_func
sub_8013990:
	push {lr}
	ldr r0, _080139A0 @ =0x085C2478
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080139A0: .4byte 0x085C2478

