	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C4AAC, "ax", %progbits
@ sub_80C4AAC @ JP 0x080C4AAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4AAC
	.thumb_func
sub_80C4AAC:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080C4AC4
	ldr r0, _080C4AC0 @ =0x08AC1FA4
	bl Proc_StartBlocking
	b _080C4ACC
	.align 2, 0
_080C4AC0: .4byte 0x08AC1FA4
_080C4AC4:
	ldr r0, _080C4AE0 @ =0x08AC1FA4
	movs r1, #3
	bl sub_8002BCC
_080C4ACC:
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x29
	strb r4, [r2]
	adds r1, #0x2a
	strb r5, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C4AE0: .4byte 0x08AC1FA4

