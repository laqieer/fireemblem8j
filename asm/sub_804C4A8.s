	.syntax unified
	.set sub_800D340, 0x0800D340 + 1
	.section .text.sub_804C4A8, "ax", %progbits
@ sub_804C4A8 @ JP 0x0804C4A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C4A8
	.thumb_func
sub_804C4A8:
	push {lr}
	ldr r0, _0804C4B8 @ =0x085D437C
	movs r1, #1
	bl sub_800D340
	pop {r0}
	bx r0
	.align 2, 0
_0804C4B8: .4byte 0x085D437C

