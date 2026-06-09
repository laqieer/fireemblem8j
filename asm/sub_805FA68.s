	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_805FA68, "ax", %progbits
@ sub_805FA68 @ JP 0x0805FA68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805FA68
	.thumb_func
sub_805FA68:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805FA88 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FA88: .4byte 0x0201774C

