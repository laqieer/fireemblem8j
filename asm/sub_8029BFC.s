	.syntax unified
	.section .text.sub_8029BFC, "ax", %progbits
@ sub_8029BFC @ JP 0x08029BFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029BFC
	.thumb_func
sub_8029BFC:
	push {lr}
	bl StartUnitResChangeInfoWindow
	pop {r1}
	bx r1
	.align 2, 0

