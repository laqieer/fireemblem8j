	.syntax unified
	.set sub_80171F8, 0x080171F8 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80A8C0C, "ax", %progbits
@ sub_80A8C0C @ JP 0x080A8C0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8C0C
	.thumb_func
sub_80A8C0C:
	push {r4, r5, lr}
	sub sp, #4
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r1, _080A8C4C @ =0x0203E890
	ldr r2, _080A8C50 @ =0x01000230
	bl sub_80D6370
	ldr r4, _080A8C54 @ =0x0202BCEC
	ldr r0, [r4, #0x38]
	ldr r1, _080A8C58 @ =0xF00000FF
	ands r0, r1
	str r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r0, #0x38
	strb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r1, _080A8C5C @ =0xFFF00000
	ands r0, r1
	str r0, [r4, #0x34]
	bl sub_80171F8
	str r0, [r4, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8C4C: .4byte 0x0203E890
_080A8C50: .4byte 0x01000230
_080A8C54: .4byte 0x0202BCEC
_080A8C58: .4byte 0xF00000FF
_080A8C5C: .4byte 0xFFF00000

