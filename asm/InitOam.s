	.syntax unified
	.section .text.InitOam, "ax", %progbits
@ InitOam @ JP 0x0800204C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitOam
	.thumb_func
InitOam:
	push {r4, lr}
	ldr r2, _0800207C @ =0x03000028
	ldr r3, _08002080 @ =0x030030E0
	str r3, [r2]
	movs r4, #0xe0
	lsls r4, r4, #0x13
	str r4, [r2, #4]
	movs r1, #0
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	ldr r2, _08002084 @ =0x03000018
	lsls r1, r0, #3
	adds r3, r1, r3
	str r3, [r2]
	adds r4, r1, r4
	str r4, [r2, #4]
	strh r1, [r2, #8]
	movs r1, #0x80
	subs r1, r1, r0
	strh r1, [r2, #0xa]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800207C: .4byte 0x03000028
_08002080: .4byte 0x030030E0
_08002084: .4byte 0x03000018

