	.syntax unified
	.set GetPortraitData, 0x0800541C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_8006620, "ax", %progbits
@ sub_8006620 @ JP 0x08006620 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006620
	.thumb_func
sub_8006620:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetPortraitData
	ldr r0, [r0, #8]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	pop {r4}
	pop {r0}
	bx r0

