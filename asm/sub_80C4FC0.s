	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C4FC0, "ax", %progbits
@ sub_80C4FC0 @ JP 0x080C4FC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4FC0
	.thumb_func
sub_80C4FC0:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080C4FD4
	ldr r0, _080C4FD0 @ =0x08AC1FE4
	bl Proc_StartBlocking
	b _080C4FDC
	.align 2, 0
_080C4FD0: .4byte 0x08AC1FE4
_080C4FD4:
	ldr r0, _080C4FE0 @ =0x08AC1FE4
	movs r1, #3
	bl sub_8002BCC
_080C4FDC:
	pop {r1}
	bx r1
	.align 2, 0
_080C4FE0: .4byte 0x08AC1FE4

