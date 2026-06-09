	.syntax unified
	.set sub_80C2A24, 0x080C2A24 + 1
	.section .text.sub_80C333C, "ax", %progbits
@ sub_80C333C @ JP 0x080C333C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C333C
	.thumb_func
sub_80C333C:
	push {r4, lr}
	sub sp, #8
	adds r4, r2, #0
	ldr r2, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #0
	adds r3, r4, #0
	bl sub_80C2A24
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

