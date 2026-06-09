	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F10, 0x08070F10 + 1
	.set sub_8071084, 0x08071084 + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_807193C, "ax", %progbits
@ sub_807193C @ JP 0x0807193C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807193C
	.thumb_func
sub_807193C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_8070F08
	adds r6, r0, #0
	ldr r0, _08071994 @ =0x08603EEC
	adds r1, r4, #0
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08071998 @ =0x080E4C78
	str r0, [r4, #0x48]
	ldr r0, _0807199C @ =0x08603F04
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _080719A0 @ =0x08603FA8
	str r0, [r4, #0x54]
	movs r0, #1
	strh r0, [r4, #0x2e]
	ldr r1, _080719A4 @ =0x08656EC8
	adds r0, r5, #0
	bl sub_8071084
	ldr r0, [r6, #0x24]
	bl sub_80D65BC
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_8070F10
	movs r0, #1
	movs r1, #0xa
	movs r2, #7
	movs r3, #0
	bl SetBlendConfig
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071994: .4byte 0x08603EEC
_08071998: .4byte 0x080E4C78
_0807199C: .4byte 0x08603F04
_080719A0: .4byte 0x08603FA8
_080719A4: .4byte 0x08656EC8

