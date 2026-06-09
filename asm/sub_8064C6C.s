	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8064C6C, "ax", %progbits
@ sub_8064C6C @ JP 0x08064C6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064C6C
	.thumb_func
sub_8064C6C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08064CB0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064CB4 @ =0x0860127C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08064CB8 @ =0x080E3142
	str r1, [r0, #0x48]
	ldr r1, _08064CBC @ =0x08601294
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08064CC0 @ =0x08756304
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _08064CC4 @ =0x08755834
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064CB0: .4byte 0x0201774C
_08064CB4: .4byte 0x0860127C
_08064CB8: .4byte 0x080E3142
_08064CBC: .4byte 0x08601294
_08064CC0: .4byte 0x08756304
_08064CC4: .4byte 0x08755834

