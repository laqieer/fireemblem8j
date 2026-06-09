	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutText, 0x08003DA0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D98, 0x08003D98 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_808E5CC, 0x0808E5CC + 1
	.set sub_808E75C, 0x0808E75C + 1
	.set sub_808EA0C, 0x0808EA0C + 1
	.section .text.sub_808EA4C, "ax", %progbits
@ sub_808EA4C @ JP 0x0808EA4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808EA4C
	.thumb_func
sub_808EA4C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _0808EBC0 @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _0808EA70
	adds r0, #7
_0808EA70:
	asrs r0, r0, #3
	mov sl, r0
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _0808EA88
	adds r0, #7
_0808EA88:
	asrs r4, r0, #3
	mov r0, sl
	adds r1, r4, #0
	bl sub_808EA0C
	mov r8, r0
	ldr r0, _0808EBC4 @ =0x08A73918
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sl, r0
	ldr r0, _0808EBC8 @ =0x08A7391E
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r4, r0
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, sl
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #5
	strb r0, [r1]
	ldr r2, [sp]
	ldr r0, [r2]
	ldrh r0, [r0]
	bl sub_8009FA8
	mov sb, r0
	movs r0, #0x38
	mov r1, sb
	bl sub_8003EAC
	adds r6, r0, #0
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	bl sub_8003CF8
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl sub_8003D98
	adds r0, r5, #0
	mov r1, sb
	bl sub_8003F28
	ldr r0, _0808EBCC @ =0x08A73906
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, r4, r1
	lsls r1, r1, #5
	ldr r0, _0808EBD0 @ =0x08A73900
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sl
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r6, _0808EBD4 @ =0x02022CA8
	adds r1, r1, r6
	adds r0, r5, #0
	bl PutText
	adds r1, r4, #3
	lsls r0, r1, #5
	adds r0, #1
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	movs r3, #0
	strh r3, [r0]
	mov r0, sl
	adds r0, #1
	adds r2, r7, #0
	adds r2, #0x46
	strh r0, [r2]
	adds r0, r7, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r7, #0
	ldr r1, [sp]
	bl sub_808E75C
	lsls r0, r4, #5
	add r0, sl
	lsls r0, r0, #1
	ldr r5, _0808EBD8 @ =0x020234A8
	adds r0, r0, r5
	ldr r1, _0808EBDC @ =0x08A73924
	mov r2, r8
	lsls r2, r2, #2
	mov r8, r2
	add r1, r8
	ldr r1, [r1]
	movs r6, #0xc4
	lsls r6, r6, #6
	adds r2, r6, #0
	bl j_TmApplyTsa
	adds r0, r4, #1
	lsls r0, r0, #5
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, _0808EBE0 @ =0x08A93350
	adds r2, r6, #0
	bl j_TmApplyTsa
	adds r4, #4
	lsls r4, r4, #5
	add r4, sl
	lsls r4, r4, #1
	adds r4, r4, r5
	ldr r0, _0808EBE4 @ =0x08A7393C
	add r8, r0
	mov r3, r8
	ldr r1, [r3]
	adds r0, r4, #0
	adds r2, r6, #0
	bl j_TmApplyTsa
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, [sp]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	movs r1, #3
	bl sub_808E5CC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EBC0: .4byte 0x0202BCAC
_0808EBC4: .4byte 0x08A73918
_0808EBC8: .4byte 0x08A7391E
_0808EBCC: .4byte 0x08A73906
_0808EBD0: .4byte 0x08A73900
_0808EBD4: .4byte 0x02022CA8
_0808EBD8: .4byte 0x020234A8
_0808EBDC: .4byte 0x08A73924
_0808EBE0: .4byte 0x08A93350
_0808EBE4: .4byte 0x08A7393C

