	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80CC0CC, "ax", %progbits
@ sub_80CC0CC @ JP 0x080CC0CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC0CC
	.thumb_func
sub_80CC0CC:
	push {lr}
	ldr r0, _080CC0DC @ =0x08B3F2F8
	movs r1, #0
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080CC0DC: .4byte 0x08B3F2F8

