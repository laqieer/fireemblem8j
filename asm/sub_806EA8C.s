	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806EABC, 0x0806EABC + 1
	.set sub_806EB34, 0x0806EB34 + 1
	.section .text.sub_806EA8C, "ax", %progbits
@ sub_806EA8C @ JP 0x0806EA8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EA8C
	.thumb_func
sub_806EA8C:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806EAAC
	ldr r0, [r4, #0x5c]
	bl sub_806EABC
	ldr r0, [r4, #0x5c]
	bl sub_806EB34
	b _0806EAB6
_0806EAAC:
	cmp r0, #0x11
	bne _0806EAB6
	adds r0, r4, #0
	bl sub_8002DE4
_0806EAB6:
	pop {r4}
	pop {r0}
	bx r0

