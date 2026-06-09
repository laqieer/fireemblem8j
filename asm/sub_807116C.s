	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F10, 0x08070F10 + 1
	.set sub_8071054, 0x08071054 + 1
	.set sub_8071084, 0x08071084 + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_807116C, "ax", %progbits
@ sub_807116C @ JP 0x0807116C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807116C
	.thumb_func
sub_807116C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_8070F08
	adds r6, r0, #0
	ldr r0, _080711B8 @ =0x08603BA4
	adds r1, r4, #0
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _080711BC @ =0x080E4A24
	str r0, [r4, #0x48]
	ldr r0, _080711C0 @ =0x08603BBC
	str r0, [r4, #0x4c]
	ldr r1, _080711C4 @ =0x08622E08
	adds r0, r5, #0
	bl sub_8071084
	ldr r0, [r4, #0x5c]
	ldr r1, _080711C8 @ =0x08622210
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
_080711B8: .4byte 0x08603BA4
_080711BC: .4byte 0x080E4A24
_080711C0: .4byte 0x08603BBC
_080711C4: .4byte 0x08622E08
_080711C8: .4byte 0x08622210

