	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80D2AD8, "ax", %progbits
@ sub_80D2AD8 @ JP 0x080D2AD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2AD8
	.thumb_func
sub_80D2AD8:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080D2AE8 @ =0x08BABA58
	bl sub_8002BCC
	pop {r1}
	bx r1
	.align 2, 0
_080D2AE8: .4byte 0x08BABA58

