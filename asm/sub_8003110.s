	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8003110, "ax", %progbits
@ sub_8003110 @ JP 0x08003110 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003110
	.thumb_func
sub_8003110:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

