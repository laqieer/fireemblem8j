	.syntax unified
	.set sub_80D63C4, 0x080D63C4 + 1
	.set sub_80D63CC, 0x080D63CC + 1
	.section .text.sub_8001C00, "ax", %progbits
@ sub_8001C00 @ JP 0x08001C00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001C00
	.thumb_func
sub_8001C00:
	push {r4, r5, lr}
	ldr r4, _08001C40 @ =0x04000200
	ldrh r5, [r4]
	ldr r1, _08001C44 @ =0x04000132
	ldr r2, _08001C48 @ =0xFFFFC000
	adds r0, r0, r2
	strh r0, [r1]
	ldrh r1, [r4]
	ldr r0, _08001C4C @ =0x0000DF7F
	ands r0, r1
	strh r0, [r4]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	bl sub_80D63C4
	svc #3
	bl sub_80D63CC
	strh r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001C40: .4byte 0x04000200
_08001C44: .4byte 0x04000132
_08001C48: .4byte 0xFFFFC000
_08001C4C: .4byte 0x0000DF7F

