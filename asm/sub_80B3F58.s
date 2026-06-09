	.syntax unified
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.section .text.sub_80B3F58, "ax", %progbits
@ sub_80B3F58 @ JP 0x080B3F58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3F58
	.thumb_func
sub_80B3F58:
	push {lr}
	ldrh r1, [r0, #0x2a]
	adds r0, #0x36
	ldrb r0, [r0]
	adds r2, r0, #3
	asrs r2, r2, #2
	movs r0, #8
	movs r3, #5
	bl UpdateMenuScrollBarConfig
	pop {r0}
	bx r0

