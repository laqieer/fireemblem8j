	.syntax unified
	.set sub_8026ED0, 0x08026ED0 + 1
	.set sub_8027BDC, 0x08027BDC + 1
	.section .text.sub_809E764, "ax", %progbits
@ sub_809E764 @ JP 0x0809E764 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809E764
	.thumb_func
sub_809E764:
	push {lr}
	sub sp, #4
	movs r3, #0xc8
	lsls r3, r3, #8
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x78
	movs r2, #0xa
	bl sub_8027BDC
	bl sub_8026ED0
	add sp, #4
	pop {r0}
	bx r0

