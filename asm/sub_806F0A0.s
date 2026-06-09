	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_806F0A0, "ax", %progbits
@ sub_806F0A0 @ JP 0x0806F0A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F0A0
	.thumb_func
sub_806F0A0:
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	ldrh r2, [r0, #0x10]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0806F0C2
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0806F0C2
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	bl sub_8002DE4
_0806F0C2:
	pop {r0}
	bx r0
	.align 2, 0

