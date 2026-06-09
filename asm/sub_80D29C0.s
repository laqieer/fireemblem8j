	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80D2938, 0x080D2938 + 1
	.section .text.sub_80D29C0, "ax", %progbits
@ sub_80D29C0 @ JP 0x080D29C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D29C0
	.thumb_func
sub_80D29C0:
	push {r4, r5, lr}
	sub sp, #0x48
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x14]
	ldr r1, [r0, #0x14]
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #0x2c
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetClassData
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80D2938
	add sp, #0x48
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

