	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80BD548, "ax", %progbits
@ sub_80BD548 @ JP 0x080BD548 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD548
	.thumb_func
sub_80BD548:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BD558 @ =0x08AC10C0
	bl sub_8002BCC
	pop {r1}
	bx r1
	.align 2, 0
_080BD558: .4byte 0x08AC10C0

