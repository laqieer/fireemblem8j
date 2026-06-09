	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806F280, "ax", %progbits
@ sub_806F280 @ JP 0x0806F280 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F280
	.thumb_func
sub_806F280:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806F2A0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F2A0: .4byte 0x0201774C

