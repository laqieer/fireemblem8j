	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80827B4, "ax", %progbits
@ sub_80827B4 @ JP 0x080827B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80827B4
	.thumb_func
sub_80827B4:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080827C8
	ldr r0, _080827C4 @ =0x08A14C64
	bl Proc_StartBlocking
	b _080827D0
	.align 2, 0
_080827C4: .4byte 0x08A14C64
_080827C8:
	ldr r0, _080827D4 @ =0x08A14C64
	movs r1, #3
	bl sub_8002BCC
_080827D0:
	pop {r0}
	bx r0
	.align 2, 0
_080827D4: .4byte 0x08A14C64

