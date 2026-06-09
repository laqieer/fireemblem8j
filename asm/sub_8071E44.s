	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F10, 0x08070F10 + 1
	.set sub_8071084, 0x08071084 + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_8071E44, "ax", %progbits
@ sub_8071E44 @ JP 0x08071E44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071E44
	.thumb_func
sub_8071E44:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_8070F08
	adds r6, r0, #0
	ldr r0, _08071E8C @ =0x086042CC
	adds r1, r4, #0
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08071E90 @ =0x080E4D9E
	str r0, [r4, #0x48]
	ldr r0, _08071E94 @ =0x08604328
	str r0, [r4, #0x4c]
	ldr r0, _08071E98 @ =0x086042DC
	str r0, [r4, #0x54]
	ldr r1, _08071E9C @ =0x086F44E4
	adds r0, r5, #0
	bl sub_8071084
	ldr r0, [r6, #0x24]
	bl sub_80D65BC
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_8070F10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071E8C: .4byte 0x086042CC
_08071E90: .4byte 0x080E4D9E
_08071E94: .4byte 0x08604328
_08071E98: .4byte 0x086042DC
_08071E9C: .4byte 0x086F44E4

