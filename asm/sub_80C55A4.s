	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C55A4, "ax", %progbits
@ sub_80C55A4 @ JP 0x080C55A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C55A4
	.thumb_func
sub_80C55A4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080C55BC
	ldr r0, _080C55B8 @ =0x08AC20A4
	bl Proc_StartBlocking
	b _080C55C4
	.align 2, 0
_080C55B8: .4byte 0x08AC20A4
_080C55BC:
	ldr r0, _080C55D8 @ =0x08AC20A4
	movs r1, #3
	bl sub_8002BCC
_080C55C4:
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x2f
	strb r4, [r2]
	adds r1, #0x2e
	strb r5, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C55D8: .4byte 0x08AC20A4

