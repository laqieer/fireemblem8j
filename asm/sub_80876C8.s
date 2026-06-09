	.syntax unified
	.set sub_80013FC, 0x080013FC + 1
	.section .text.sub_80876C8, "ax", %progbits
@ sub_80876C8 @ JP 0x080876C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80876C8
	.thumb_func
sub_80876C8:
	push {lr}
	movs r0, #0
	bl sub_80013FC
	pop {r0}
	bx r0

