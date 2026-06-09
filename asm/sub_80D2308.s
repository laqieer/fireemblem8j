	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80D2308, "ax", %progbits
@ sub_80D2308 @ JP 0x080D2308 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2308
	.thumb_func
sub_80D2308:
	push {lr}
	ldr r0, _080D2318 @ =0x08BAB83C
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080D2318: .4byte 0x08BAB83C

