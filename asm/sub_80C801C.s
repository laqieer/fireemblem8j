	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C3238, 0x080C3238 + 1
	.section .text.sub_80C801C, "ax", %progbits
@ sub_80C801C @ JP 0x080C801C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C801C
	.thumb_func
sub_80C801C:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C3238
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C8030
	adds r0, r4, #0
	bl sub_8002DE4
_080C8030:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

