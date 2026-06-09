	.syntax unified
	.set nullsub_79, 0x0809D634 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809D638, "ax", %progbits
@ sub_809D638 @ JP 0x0809D638 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D638
	.thumb_func
sub_809D638:
	push {lr}
	bl nullsub_79
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0xd0
	movs r1, #0x68
	movs r2, #0
	bl sub_80B1FBC
	pop {r0}
	bx r0

