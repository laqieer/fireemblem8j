	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set MakeNewItem, 0x080162E8 + 1
	.set UnitAddItem, 0x080176F0 + 1
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802B970, 0x0802B970 + 1
	.set sub_802C134, 0x0802C134 + 1
	.section .text.sub_8088868, "ax", %progbits
@ AutolevelSecondaryLord @ JP 0x08088868 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AutolevelSecondaryLord
	.thumb_func
AutolevelSecondaryLord:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x80
	ldr r0, _08088880 @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08088884
	cmp r0, #3
	beq _08088888
	b _08088890
	.align 2, 0
_08088880: .4byte 0x0202BCEC
_08088884:
	movs r0, #0xf
	b _0808888A
_08088888:
	movs r0, #1
_0808888A:
	bl GetUnitFromCharId
	adds r6, r0, #0
_08088890:
	movs r0, #8
	ldrsb r0, [r6, r0]
	movs r1, #0x28
	adds r1, r1, r6
	mov r8, r1
	cmp r0, #0xe
	bgt _080888E2
	ldrb r4, [r6, #8]
	adds r0, r4, #6
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bhi _080888AC
	movs r5, #0xa
_080888AC:
	cmp r5, #0xf
	bls _080888B2
	movs r5, #0xf
_080888B2:
	cmp r4, r5
	bhs _080888DE
	mov r7, sp
_080888B8:
	mov r0, sp
	adds r1, r6, #0
	bl sub_802A4F0
	ldrb r0, [r7, #9]
	adds r0, #0x64
	strb r0, [r7, #9]
	mov r0, sp
	bl sub_802B970
	adds r0, r6, #0
	mov r1, sp
	bl sub_802C134
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _080888B8
_080888DE:
	movs r0, #0
	strb r0, [r6, #9]
_080888E2:
	movs r2, #0
	mov r3, r8
	movs r4, #0x47
_080888E8:
	adds r1, r3, r2
	ldrb r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x45
	bhi _080888F8
	strb r4, [r1]
_080888F8:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _080888E8
	movs r2, #0
	b _0808890C
_08088906:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_0808890C:
	cmp r2, #4
	bhi _0808894E
	lsls r0, r2, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _08088906
	ldr r0, _0808892C @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08088930
	cmp r0, #3
	beq _08088940
	b _0808894E
	.align 2, 0
_0808892C: .4byte 0x0202BCEC
_08088930:
	movs r0, #0x16
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r6, #0
	bl UnitAddItem
	b _0808894E
_08088940:
	movs r0, #3
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r6, #0
	bl UnitAddItem
_0808894E:
	add sp, #0x80
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

