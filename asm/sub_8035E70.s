	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8035E14, 0x08035E14 + 1
	.section .text.sub_8035E70, "ax", %progbits
@ sub_8035E70 @ JP 0x08035E70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035E70
	.thumb_func
sub_8035E70:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl sub_8035E14
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08035E94
	adds r0, r5, #0
	bl sub_8002DE4
_08035E94:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

