	.syntax unified
	.set GetUnitEquippedWeaponSlot, 0x08016900 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set PutTwoSpecialChar, 0x08004C64 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_802A38C, 0x0802A38C + 1
	.section .text.sub_8089100, "ax", %progbits
@ sub_8089100 @ JP 0x08089100 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089100
	.thumb_func
sub_8089100:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r7, _080891E4 @ =0x02003BFC
	ldr r0, [r7, #0xc]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r5, r0, #0
	movs r0, #0x30
	adds r1, r5, #0
	bl sub_8003EAC
	adds r6, r0, #0
	ldr r0, _080891E8 @ =0x02022CA8
	mov r8, r0
	movs r1, #0
	bl sub_80011D0
	ldr r4, [r7, #0xc]
	adds r0, r4, #0
	bl GetUnitEquippedWeaponSlot
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_802A38C
	adds r0, r7, #0
	adds r0, #0x18
	ldr r1, _080891EC @ =0x00000286
	add r1, r8
	movs r4, #0
	str r4, [sp]
	str r5, [sp, #4]
	movs r2, #0
	adds r3, r6, #0
	bl sub_8004374
	ldr r0, [r7, #0xc]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r2, r7, #0
	adds r2, #0x20
	ldr r1, _080891F0 @ =0x00000342
	add r1, r8
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	ldr r0, _080891F4 @ =0x000003C2
	add r0, r8
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	ldr r0, _080891F8 @ =0x000003CA
	add r0, r8
	movs r1, #3
	movs r2, #0x1d
	bl PutSpecialChar
	ldr r0, _080891FC @ =0x00000442
	add r0, r8
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r0, _08089200 @ =0x0000044A
	add r0, r8
	movs r1, #3
	movs r2, #0x16
	bl PutSpecialChar
	movs r0, #0xf2
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r7, #0xc]
	movs r2, #8
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberOrBlank
	ldr r0, _08089204 @ =0x000003CE
	add r0, r8
	ldr r1, [r7, #0xc]
	ldrb r2, [r1, #9]
	movs r1, #2
	bl PutNumberOrBlank
	ldr r0, [r7, #0xc]
	bl sub_8018E64
	cmp r0, #0x63
	ble _0808920C
	ldr r0, _08089208 @ =0x00000446
	add r0, r8
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _08089222
	.align 2, 0
_080891E4: .4byte 0x02003BFC
_080891E8: .4byte 0x02022CA8
_080891EC: .4byte 0x00000286
_080891F0: .4byte 0x00000342
_080891F4: .4byte 0x000003C2
_080891F8: .4byte 0x000003CA
_080891FC: .4byte 0x00000442
_08089200: .4byte 0x0000044A
_08089204: .4byte 0x000003CE
_08089208: .4byte 0x00000446
_0808920C:
	movs r4, #0x89
	lsls r4, r4, #3
	add r4, r8
	ldr r0, [r7, #0xc]
	bl sub_8018E64
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_08089222:
	ldr r5, _0808923C @ =0x02003BFC
	ldr r0, [r5, #0xc]
	bl sub_8018EA4
	cmp r0, #0x63
	ble _08089244
	ldr r0, _08089240 @ =0x020230F4
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _08089256
	.align 2, 0
_0808923C: .4byte 0x02003BFC
_08089240: .4byte 0x020230F4
_08089244:
	ldr r4, _08089264 @ =0x020230F6
	ldr r0, [r5, #0xc]
	bl sub_8018EA4
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_08089256:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089264: .4byte 0x020230F6

