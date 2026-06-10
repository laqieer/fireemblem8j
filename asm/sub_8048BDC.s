	.syntax unified
	.set sub_8003AFC, 0x08003AFC + 1
	.section .text.sub_8048BDC, "ax", %progbits
@ sub_8048BDC @ JP 0x08048BDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048BDC
	.thumb_func
sub_8048BDC:
	push {lr}
	ldr r2, _08048BEC @ =0x080DEF00
	movs r0, #8
	movs r1, #0x10
	bl sub_8003AFC
	pop {r0}
	bx r0
	.align 2, 0
_08048BEC: .4byte 0x080DEF00

