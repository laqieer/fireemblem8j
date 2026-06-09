	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D98, 0x08003D98 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8005890, 0x08005890 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8018FEC, 0x08018FEC + 1
	.set sub_808DF94, 0x0808DF94 + 1
	.set sub_808E5CC, 0x0808E5CC + 1
	.set sub_808E75C, 0x0808E75C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_808E8CC, "ax", %progbits
@ sub_808E8CC @ JP 0x0808E8CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808E8CC
	.thumb_func
sub_808E8CC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sl, r0
	str r0, [sp, #4]
	ldr r1, _0808E984 @ =0x02003D2C
	mov sb, r1
	ldr r2, _0808E988 @ =0x01000060
	add r0, sp, #4
	bl sub_80D636C
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r6, r0, #0
	movs r0, #0x38
	adds r1, r6, #0
	bl sub_8003EAC
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl sub_8003D98
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8003F28
	mov r1, sb
	adds r1, #0x4a
	adds r0, r4, #0
	bl PutText
	mov r0, r8
	bl sub_8018FEC
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808E942
	adds r2, #1
_0808E942:
	mov r1, sb
	adds r1, #0x42
	mov r0, sl
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0xf0
	movs r3, #4
	bl sub_8005890
	mov r0, sb
	adds r0, #0xca
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	mov r1, sl
	strh r1, [r0]
	ldr r2, _0808E98C @ =0x08A738E0
	adds r1, r7, #0
	adds r1, #0x50
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808E990
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #5
	b _0808E996
	.align 2, 0
_0808E984: .4byte 0x02003D2C
_0808E988: .4byte 0x01000060
_0808E98C: .4byte 0x08A738E0
_0808E990:
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #0x17
_0808E996:
	strh r0, [r2]
	ldr r0, _0808E9B4 @ =0x08A738E0
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808E9B8
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #3
	b _0808E9BE
	.align 2, 0
_0808E9B4: .4byte 0x08A738E0
_0808E9B8:
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #0x11
_0808E9BE:
	strh r0, [r1]
	adds r0, r7, #0
	mov r1, r8
	bl sub_808E75C
	ldr r0, _0808EA00 @ =0x02003E36
	movs r2, #0x8a
	lsls r2, r2, #5
	mov r1, r8
	bl sub_808DF94
	ldr r0, _0808EA04 @ =0x0200422C
	ldr r1, _0808EA08 @ =0x08A931D0
	movs r2, #0xc0
	lsls r2, r2, #6
	bl j_TmApplyTsa
	mov r1, r8
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	movs r1, #3
	bl sub_808E5CC
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EA00: .4byte 0x02003E36
_0808EA04: .4byte 0x0200422C
_0808EA08: .4byte 0x08A931D0

