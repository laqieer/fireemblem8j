	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80096C0, 0x080096C0 + 1
	.section .text.sub_80C6814, "ax", %progbits
@ sub_80C6814 @ JP 0x080C6814 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6814
	.thumb_func
sub_80C6814:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80096C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C6828
	adds r0, r4, #0
	bl sub_8002DE4
_080C6828:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

