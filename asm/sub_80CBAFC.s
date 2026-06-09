	.syntax unified
	.set sub_80D6368, 0x080D6368 + 1
	.section .text.sub_80CBAFC, "ax", %progbits
@ sub_80CBAFC @ JP 0x080CBAFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBAFC
	.thumb_func
sub_80CBAFC:
	push {lr}
	sub sp, #0x14
	movs r2, #0x80
	lsls r2, r2, #9
	str r2, [sp]
	str r2, [sp, #4]
	mov r3, sp
	movs r2, #0x78
	strh r2, [r3, #8]
	movs r2, #0x50
	strh r2, [r3, #0xa]
	mov r2, sp
	strh r0, [r2, #0xc]
	strh r0, [r2, #0xe]
	mov r0, sp
	lsls r1, r1, #8
	strh r1, [r0, #0x10]
	ldr r1, _080CBB2C @ =0x03003068
	movs r2, #1
	bl sub_80D6368
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_080CBB2C: .4byte 0x03003068

