	.syntax unified
	.set UpdateMapViewWithFog, 0x0801DF3C + 1
	.section .text.sub_8086E58, "ax", %progbits
@ sub_8086E58 @ JP 0x08086E58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086E58
	.thumb_func
sub_8086E58:
	push {lr}
	movs r0, #0
	bl UpdateMapViewWithFog
	pop {r0}
	bx r0

