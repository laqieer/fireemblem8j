	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F10, 0x08070F10 + 1
	.set sub_8071054, 0x08071054 + 1
	.set sub_8071084, 0x08071084 + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_8071304, "ax", %progbits
@ sub_8071304 @ JP 0x08071304 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071304
	.thumb_func
sub_8071304:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_8070F08
	adds r6, r0, #0
	ldr r0, _0807134C @ =0x08603C2C
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08071350 @ =0x080E4A88
	str r0, [r4, #0x48]
	ldr r0, _08071354 @ =0x08603C44
	str r0, [r4, #0x4c]
	ldr r1, _08071358 @ =0x08620254
	adds r0, r5, #0
	bl sub_8071084
	ldr r0, [r4, #0x5c]
	ldr r1, _0807135C @ =0x0861F998
	bl sub_8071054
	ldr r0, [r6, #0x24]
	bl sub_80D65BC
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_8070F10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807134C: .4byte 0x08603C2C
_08071350: .4byte 0x080E4A88
_08071354: .4byte 0x08603C44
_08071358: .4byte 0x08620254
_0807135C: .4byte 0x0861F998

