	.syntax unified
	.set StartUnitStaffOffenseInfoWindow, 0x08035004 + 1
	.section .text.sub_8029C68, "ax", %progbits
@ sub_8029C68 @ JP 0x08029C68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029C68
	.thumb_func
sub_8029C68:
	push {lr}
	bl StartUnitStaffOffenseInfoWindow
	pop {r1}
	bx r1
	.align 2, 0

