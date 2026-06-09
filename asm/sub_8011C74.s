	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.section .text.sub_8011C74, "ax", %progbits
@ sub_8011C74 @ JP 0x08011C74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011C74
	.thumb_func
sub_8011C74:
	push {lr}
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	pop {r0}
	bx r0
	.align 2, 0

