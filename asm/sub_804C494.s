	.syntax unified
	.set sub_800D340, 0x0800D340 + 1
	.section .text.sub_804C494, "ax", %progbits
@ sub_804C494 @ JP 0x0804C494 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C494
	.thumb_func
sub_804C494:
	push {lr}
	ldr r0, _0804C4A4 @ =0x085D4358
	movs r1, #1
	bl sub_800D340
	pop {r0}
	bx r0
	.align 2, 0
_0804C4A4: .4byte 0x085D4358

