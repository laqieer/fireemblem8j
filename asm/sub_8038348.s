	.syntax unified
	.set sub_8000CE4, 0x08000CE4 + 1
	.section .text.sub_8038348, "ax", %progbits
@ sub_8038348 @ JP 0x08038348 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8038348
	.thumb_func
sub_8038348:
	push {lr}
	ldr r0, _08038358 @ =0x020038C4
	ldr r0, [r0]
	bl sub_8000CE4
	pop {r0}
	bx r0
	.align 2, 0
_08038358: .4byte 0x020038C4

