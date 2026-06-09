	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B505C, "ax", %progbits
@ sub_80B505C @ JP 0x080B505C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B505C
	.thumb_func
sub_80B505C:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B506C @ =0x08A9E498
	bl sub_8002BCC
	pop {r1}
	bx r1
	.align 2, 0
_080B506C: .4byte 0x08A9E498

