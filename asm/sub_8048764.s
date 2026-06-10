	.syntax unified
	.set sub_800D340, 0x0800D340 + 1
	.section .text.sub_8048764, "ax", %progbits
@ sub_8048764 @ JP 0x08048764 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048764
	.thumb_func
sub_8048764:
	push {lr}
	ldr r0, _08048774 @ =0x085D3E50
	movs r1, #3
	bl sub_800D340
	pop {r0}
	bx r0
	.align 2, 0
_08048774: .4byte 0x085D3E50

