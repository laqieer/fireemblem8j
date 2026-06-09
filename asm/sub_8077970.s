	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8077970, "ax", %progbits
@ sub_8077970 @ JP 0x08077970 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077970
	.thumb_func
sub_8077970:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	mov sb, r2
	adds r6, r3, #0
	ldr r0, _080779A8 @ =0x087A9B68
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	ldr r0, _080779AC @ =0x0203E198
	ldr r7, [r0]
	cmp r4, #0
	bne _080779B8
	ldr r3, _080779B0 @ =0x087AA434
	ldr r6, _080779B4 @ =0x080EAC84
	b _080779E4
	.align 2, 0
_080779A8: .4byte 0x087A9B68
_080779AC: .4byte 0x0203E198
_080779B0: .4byte 0x087AA434
_080779B4: .4byte 0x080EAC84
_080779B8:
	cmp r6, #1
	beq _080779D0
	cmp r6, #1
	bhs _080779E0
	ldr r3, _080779C8 @ =0x087AA4C4
	ldr r6, _080779CC @ =0x080EAFA4
	b _080779E4
	.align 2, 0
_080779C8: .4byte 0x087AA4C4
_080779CC: .4byte 0x080EAFA4
_080779D0:
	ldr r3, _080779D8 @ =0x087AA554
	ldr r6, _080779DC @ =0x080EB378
	b _080779E4
	.align 2, 0
_080779D8: .4byte 0x087AA554
_080779DC: .4byte 0x080EB378
_080779E0:
	ldr r3, _08077A24 @ =0x087AA5E0
	ldr r6, _08077A28 @ =0x080EB7AC
_080779E4:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r1, r0, #0
	str r1, [r5, #0x60]
	ldr r0, _08077A2C @ =0x00008840
	strh r0, [r1, #8]
	ldr r4, _08077A30 @ =0x0201A790
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_80D6394
	ldr r1, _08077A34 @ =0x02022BA8
	adds r0, r4, #0
	movs r2, #8
	bl sub_80D636C
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80D6394
	ldr r0, _08077A38 @ =0x0203E198
	ldr r7, [r0, #4]
	mov r0, sb
	cmp r0, #0
	bne _08077A44
	ldr r3, _08077A3C @ =0x087AA434
	ldr r6, _08077A40 @ =0x080EAC84
	b _08077A70
	.align 2, 0
_08077A24: .4byte 0x087AA5E0
_08077A28: .4byte 0x080EB7AC
_08077A2C: .4byte 0x00008840
_08077A30: .4byte 0x0201A790
_08077A34: .4byte 0x02022BA8
_08077A38: .4byte 0x0203E198
_08077A3C: .4byte 0x087AA434
_08077A40: .4byte 0x080EAC84
_08077A44:
	ldr r0, [sp, #0x20]
	cmp r0, #1
	beq _08077A5C
	cmp r0, #1
	bhs _08077A6C
	ldr r3, _08077A54 @ =0x087AA4C4
	ldr r6, _08077A58 @ =0x080EAFA4
	b _08077A70
	.align 2, 0
_08077A54: .4byte 0x087AA4C4
_08077A58: .4byte 0x080EAFA4
_08077A5C:
	ldr r3, _08077A64 @ =0x087AA554
	ldr r6, _08077A68 @ =0x080EB378
	b _08077A70
	.align 2, 0
_08077A64: .4byte 0x087AA554
_08077A68: .4byte 0x080EB378
_08077A6C:
	ldr r3, _08077AD8 @ =0x087AA5E0
	ldr r6, _08077ADC @ =0x080EB7AC
_08077A70:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r1, r0, #0
	str r1, [r5, #0x64]
	ldr r0, _08077AE0 @ =0x0000A880
	strh r0, [r1, #8]
	ldr r4, _08077AE4 @ =0x0201AF90
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_80D6394
	ldr r1, _08077AE8 @ =0x02022BE8
	adds r0, r4, #0
	movs r2, #8
	bl sub_80D636C
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80D6394
	ldr r1, _08077AEC @ =0x06010800
	ldr r0, _08077AF0 @ =0xFFFFF800
	adds r4, r4, r0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl RegisterDataMove
	bl sub_8001EE4
	ldr r1, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	adds r0, #0x20
	strh r0, [r1, #2]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077AD8: .4byte 0x087AA5E0
_08077ADC: .4byte 0x080EB7AC
_08077AE0: .4byte 0x0000A880
_08077AE4: .4byte 0x0201AF90
_08077AE8: .4byte 0x02022BE8
_08077AEC: .4byte 0x06010800
_08077AF0: .4byte 0xFFFFF800

