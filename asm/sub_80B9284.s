	.syntax unified
	.set AddItemToConvoy, 0x080314E0 + 1
	.set sub_80B9FC4, 0x080B9FC4 + 1
	.section .text.sub_80B9284, "ax", %progbits
@ sub_80B9284 @ JP 0x080B9284 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9284
	.thumb_func
sub_80B9284:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	lsls r1, r1, #1
	subs r0, #0x2c
	adds r0, r0, r1
	ldrh r0, [r0]
	bl AddItemToConvoy
	adds r0, r4, #0
	bl sub_80B9FC4
	pop {r4}
	pop {r0}
	bx r0

