	.syntax unified
	.set InitDungeon, 0x08037CD8 + 1
	.section .text.sub_8087F24, "ax", %progbits
@ sub_8087F24 @ JP 0x08087F24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087F24
	.thumb_func
sub_8087F24:
	push {lr}
	movs r0, #1
	bl InitDungeon
	pop {r0}
	bx r0

