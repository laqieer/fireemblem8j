	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_806EC28, 0x0806EC28 + 1
	.section .text.sub_806EBE8, "ax", %progbits
@ sub_806EBE8 @ JP 0x0806EBE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EBE8
	.thumb_func
sub_806EBE8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806EC0C
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl sub_8054BF8
	b _0806EC22
_0806EC0C:
	cmp r0, #4
	bne _0806EC18
	adds r0, r1, #0
	bl sub_806EC28
	b _0806EC22
_0806EC18:
	cmp r0, #0x18
	bne _0806EC22
	adds r0, r4, #0
	bl sub_8002DE4
_0806EC22:
	pop {r4}
	pop {r0}
	bx r0

