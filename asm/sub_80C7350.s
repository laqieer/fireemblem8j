	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_80BD56C, 0x080BD56C + 1
	.section .text.sub_80C7350, "ax", %progbits
@ sub_80C7350 @ JP 0x080C7350 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7350
	.thumb_func
sub_80C7350:
	push {lr}
	bl sub_80BD56C
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r3, #0
	bl SetBlendConfig
	pop {r0}
	bx r0
	.align 2, 0

