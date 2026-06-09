	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.section .text.sub_806FD84, "ax", %progbits
@ sub_806FD84 @ JP 0x0806FD84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806FD84
	.thumb_func
sub_806FD84:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _0806FDA4
	bl sub_8056130
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_0806FDA4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

