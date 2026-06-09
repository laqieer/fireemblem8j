	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8071B18, "ax", %progbits
@ sub_8071B18 @ JP 0x08071B18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071B18
	.thumb_func
sub_8071B18:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08071B40 @ =0x0865A7FC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl AnimSort
	movs r0, #0x27
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071B40: .4byte 0x0865A7FC

