	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C7474, "ax", %progbits
@ sub_80C7474 @ JP 0x080C7474 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7474
	.thumb_func
sub_80C7474:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080C7488
	ldr r0, _080C7484 @ =0x08AC25A8
	bl Proc_StartBlocking
	b _080C7490
	.align 2, 0
_080C7484: .4byte 0x08AC25A8
_080C7488:
	ldr r0, _080C7494 @ =0x08AC25A8
	movs r1, #3
	bl sub_8002BCC
_080C7490:
	pop {r1}
	bx r1
	.align 2, 0
_080C7494: .4byte 0x08AC25A8

