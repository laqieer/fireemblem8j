	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C74C0, 0x080C74C0 + 1
	.set sub_80C7744, 0x080C7744 + 1
	.section .text.sub_80C77B0, "ax", %progbits
@ sub_80C77B0 @ JP 0x080C77B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C77B0
	.thumb_func
sub_80C77B0:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C7744
	bl sub_80C74C0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C77CC
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_8002DE4
_080C77CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

