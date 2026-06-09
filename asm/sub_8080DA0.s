	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.section .text.sub_8080DA0, "ax", %progbits
@ sub_8080DA0 @ JP 0x08080DA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080DA0
	.thumb_func
sub_8080DA0:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x58]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r6, #0
	adds r4, #0x64
	ldrh r1, [r4]
	adds r5, r6, #0
	adds r5, #0x68
	ldrh r2, [r5]
	bl BG_SetPosition
	adds r0, r6, #0
	adds r0, #0x66
	ldrh r0, [r0]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	adds r0, r6, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

