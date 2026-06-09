	.syntax unified
	.set InitDungeon, 0x08037CD8 + 1
	.section .text.sub_8087F18, "ax", %progbits
@ sub_8087F18 @ JP 0x08087F18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087F18
	.thumb_func
sub_8087F18:
	push {lr}
	movs r0, #0
	bl InitDungeon
	pop {r0}
	bx r0

