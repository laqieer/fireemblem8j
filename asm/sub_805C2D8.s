	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_805C2D8, "ax", %progbits
@ sub_805C2D8 @ JP 0x0805C2D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C2D8
	.thumb_func
sub_805C2D8:
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r2, #0x44]
	cmp r0, r1
	bne _0805C2F2
	adds r0, r2, #0
	bl sub_8002DE4
_0805C2F2:
	pop {r0}
	bx r0
	.align 2, 0

