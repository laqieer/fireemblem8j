	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C7744, 0x080C7744 + 1
	.section .text.sub_80C77D4, "ax", %progbits
@ sub_80C77D4 @ JP 0x080C77D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C77D4
	.thumb_func
sub_80C77D4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C7744
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080C77F0
	adds r0, r4, #0
	bl sub_8002DE4
_080C77F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

