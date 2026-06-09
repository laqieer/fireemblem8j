	.syntax unified
	.set GetPortraitData, 0x0800541C + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8006600, "ax", %progbits
@ sub_8006600 @ JP 0x08006600 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006600
	.thumb_func
sub_8006600:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetPortraitData
	ldr r0, [r0]
	lsls r4, r4, #5
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r4, r1
	adds r1, r4, #0
	bl sub_8013008
	pop {r4}
	pop {r0}
	bx r0

