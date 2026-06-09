	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001508, 0x08001508 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80130D8, 0x080130D8 + 1
	.set sub_80B7C4C, 0x080B7C4C + 1
	.section .text.sub_80B77A4, "ax", %progbits
@ sub_80B77A4 @ JP 0x080B77A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B77A4
	.thumb_func
sub_80B77A4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r1, _080B7978 @ =0x081F58C4
	add r0, sp, #4
	movs r2, #0x18
	bl memcpy
	add r0, sp, #4
	bl sub_8001ACC
	ldr r3, _080B797C @ =0x03003020
	ldrb r1, [r3]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r3, #0xc]
	movs r2, #3
	orrs r0, r2
	strb r0, [r3, #0xc]
	ldrb r0, [r3, #0x10]
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r1, [r3, #0x14]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	orrs r0, r2
	strb r0, [r3, #0x18]
	ldrb r0, [r3, #1]
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	ldrb r2, [r3, #0x15]
	movs r0, #0x3f
	ands r0, r2
	movs r2, #0x40
	orrs r0, r2
	movs r2, #0x21
	rsbs r2, r2, #0
	ands r0, r2
	strb r0, [r3, #0x15]
	ands r1, r2
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #0x7f
	ands r1, r0
	strb r1, [r3, #1]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	strh r4, [r5, #0x2a]
	movs r1, #0
	movs r4, #9
	adds r0, r5, #0
	adds r0, #0x58
_080B785A:
	str r1, [r0]
	subs r0, #4
	subs r4, #1
	cmp r4, #0
	bge _080B785A
	movs r0, #0
	str r0, [r5, #0x5c]
	ldr r0, _080B7980 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B7984 @ =0x08AB8084
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	movs r6, #0
	movs r4, #0
	ldr r1, [r5, #0x64]
	ldr r0, [r1, #8]
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080B78C4
	ldr r0, _080B7988 @ =0x08AB0024
	mov r8, r0
	ldr r7, _080B798C @ =0x02020188
_080B7890:
	ldr r0, [r1, #8]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	adds r1, r7, #0
	bl sub_8013008
	ldr r0, _080B7990 @ =0x06010000
	adds r1, r6, r0
	adds r0, r7, #0
	movs r2, #4
	movs r3, #4
	bl sub_80130D8
	adds r6, #0x80
	adds r4, #1
	cmp r4, #7
	bgt _080B78C4
	ldr r1, [r5, #0x64]
	ldr r0, [r1, #8]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080B7890
_080B78C4:
	ldr r4, _080B7994 @ =0x08AB15AC
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	movs r1, #0xf8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080B7998 @ =0x08AB0FDC
	ldr r1, _080B799C @ =0x06016000
	bl sub_8013008
	ldr r0, [r5, #0x64]
	ldrb r0, [r0, #0xc]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r0, r0, #1
	subs r0, #0x10
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #0
	bl sub_80B7C4C
	str r0, [r5, #0x34]
	ldr r0, _080B79A0 @ =0x08AB6F14
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl sub_8013008
	ldr r0, _080B79A4 @ =0x08AB70B0
	ldr r4, _080B798C @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080B79A8 @ =0x02022E68
	movs r2, #0x80
	lsls r2, r2, #7
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _080B79AC @ =0x08AB6868
	ldr r1, _080B79B0 @ =0x06000800
	bl sub_8013008
	ldr r0, _080B79B4 @ =0x08AB6DFC
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080B79B8 @ =0x020234A8
	ldr r2, _080B79BC @ =0x00005040
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _080B79C0 @ =0x08AB6EF4
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080B79C4 @ =0x08BB0BB8
	ldr r1, _080B79C8 @ =0x06008000
	bl sub_8013008
	ldr r0, _080B79CC @ =0x02023CA8
	ldr r1, _080B79D0 @ =0x08BB1DBC
	movs r2, #0
	movs r3, #5
	bl sub_8001508
	ldr r0, _080B79D4 @ =0x08BB1F28
	movs r1, #0
	movs r2, #0x60
	bl sub_8000D68
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #0x1c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7978: .4byte 0x081F58C4
_080B797C: .4byte 0x03003020
_080B7980: .4byte 0x02022CA8
_080B7984: .4byte 0x08AB8084
_080B7988: .4byte 0x08AB0024
_080B798C: .4byte 0x02020188
_080B7990: .4byte 0x06010000
_080B7994: .4byte 0x08AB15AC
_080B7998: .4byte 0x08AB0FDC
_080B799C: .4byte 0x06016000
_080B79A0: .4byte 0x08AB6F14
_080B79A4: .4byte 0x08AB70B0
_080B79A8: .4byte 0x02022E68
_080B79AC: .4byte 0x08AB6868
_080B79B0: .4byte 0x06000800
_080B79B4: .4byte 0x08AB6DFC
_080B79B8: .4byte 0x020234A8
_080B79BC: .4byte 0x00005040
_080B79C0: .4byte 0x08AB6EF4
_080B79C4: .4byte 0x08BB0BB8
_080B79C8: .4byte 0x06008000
_080B79CC: .4byte 0x02023CA8
_080B79D0: .4byte 0x08BB1DBC
_080B79D4: .4byte 0x08BB1F28

