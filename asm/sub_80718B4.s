	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F10, 0x08070F10 + 1
	.set sub_8071084, 0x08071084 + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_80718B4, "ax", %progbits
@ sub_80718B4 @ JP 0x080718B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80718B4
	.thumb_func
sub_80718B4:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_8070F08
	adds r6, r0, #0
	ldr r0, _080718FC @ =0x08603EEC
	adds r1, r5, #0
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _08071900 @ =0x080E4C46
	str r0, [r5, #0x48]
	ldr r0, _08071904 @ =0x08603F04
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08071908 @ =0x08603FA8
	str r0, [r5, #0x54]
	strh r1, [r5, #0x2e]
	ldr r1, _0807190C @ =0x08656EA8
	adds r0, r4, #0
	bl sub_8071084
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08071914
	ldr r1, _08071910 @ =0x03003020
	ldrh r0, [r1, #0x20]
	adds r0, #4
	b _0807191A
	.align 2, 0
_080718FC: .4byte 0x08603EEC
_08071900: .4byte 0x080E4C46
_08071904: .4byte 0x08603F04
_08071908: .4byte 0x08603FA8
_0807190C: .4byte 0x08656EA8
_08071910: .4byte 0x03003020
_08071914:
	ldr r1, _08071938 @ =0x03003020
	ldrh r0, [r1, #0x20]
	subs r0, #4
_0807191A:
	strh r0, [r1, #0x20]
	ldrh r0, [r1, #0x22]
	adds r0, #8
	strh r0, [r1, #0x22]
	ldr r0, [r6, #0x24]
	bl sub_80D65BC
	ldr r0, [r5, #0x5c]
	adds r1, r6, #0
	bl sub_8070F10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071938: .4byte 0x03003020

