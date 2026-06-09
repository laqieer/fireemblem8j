	.syntax unified
	.set GetItemCost, 0x080173E4 + 1
	.section .text.sub_80B9DEC, "ax", %progbits
@ sub_80B9DEC @ JP 0x080B9DEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9DEC
	.thumb_func
sub_80B9DEC:
	push {lr}
	bl GetItemCost
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0

