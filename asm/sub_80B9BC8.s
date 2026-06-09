	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80B8FFC, 0x080B8FFC + 1
	.set sub_80B9B18, 0x080B9B18 + 1
	.section .text.sub_80B9BC8, "ax", %progbits
@ sub_80B9BC8 @ JP 0x080B9BC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9BC8
	.thumb_func
sub_80B9BC8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	bl sub_80B8FFC
	ldr r0, [r4, #0x54]
	bl sub_80B9B18
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

