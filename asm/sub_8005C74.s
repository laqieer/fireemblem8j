	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8006374, 0x08006374 + 1
	.section .text.sub_8005C74, "ax", %progbits
@ sub_8005C74 @ JP 0x08005C74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005C74
	.thumb_func
sub_8005C74:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	cmp r0, #0
	bge _08005C94
	adds r0, r4, #0
	bl sub_8006374
	str r0, [r4, #0x38]
	movs r0, #0
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl sub_8002DE4
_08005C94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

