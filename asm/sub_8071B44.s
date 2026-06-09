	.syntax unified
	.section .text.sub_8071B44, "ax", %progbits
@ sub_8071B44 @ JP 0x08071B44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071B44
	.thumb_func
sub_8071B44:
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _08071B64
	ldr r0, _08071B68 @ =0x0865A830
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	strh r3, [r1, #0x2c]
_08071B64:
	pop {r0}
	bx r0
	.align 2, 0
_08071B68: .4byte 0x0865A830

