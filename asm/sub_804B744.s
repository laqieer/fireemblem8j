	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set LinkArenaBattleMap_AdvancePhase, 0x0804A0E4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_804B744, "ax", %progbits
@ sub_804B744 @ JP 0x0804B744 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B744
	.thumb_func
sub_804B744:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r1, _0804B7E8 @ =0x03001810
	ldr r5, _0804B7EC @ =0x0203DD8C
	ldrb r0, [r5, #4]
	adds r0, r0, r1
	ldrb r6, [r0]
	ldrb r0, [r5, #5]
	adds r0, r0, r1
	ldrb r7, [r0]
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r1, [r4, #0xc]
	ldr r3, _0804B7F0 @ =0x00010004
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _0804B780
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0xc]
_0804B780:
	ldr r1, [r2, #0xc]
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _0804B792
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
_0804B792:
	lsrs r0, r6, #6
	adds r1, r0, #0
	adds r2, r5, #0
	adds r2, #0xa
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _0804B7AE
	lsrs r1, r7, #6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804B80A
_0804B7AE:
	adds r4, r1, #0
	ldr r2, _0804B7EC @ =0x0203DD8C
	ldr r3, _0804B7F4 @ =0x0203DA20
	adds r3, #0xa0
	ldrb r0, [r3]
	ldrb r1, [r2, #0xe]
	subs r0, r0, r1
	adds r1, r2, #0
	adds r1, #0xf
	adds r0, r0, r1
	strb r4, [r0]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r3]
	cmp r0, r3
	bne _0804B80A
	adds r1, r5, #0
	adds r0, r2, #0
	adds r0, #0xa
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804B7F8
	adds r4, r1, #0
	b _0804B7FA
	.align 2, 0
_0804B7E8: .4byte 0x03001810
_0804B7EC: .4byte 0x0203DD8C
_0804B7F0: .4byte 0x00010004
_0804B7F4: .4byte 0x0203DA20
_0804B7F8:
	lsrs r4, r7, #6
_0804B7FA:
	strb r4, [r2, #0xf]
	movs r0, #0xff
	bl LinkArenaBattleMap_AdvancePhase
	mov r0, r8
	bl sub_8002DE4
	b _0804B818
_0804B80A:
	ldr r0, _0804B824 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	bl LinkArenaBattleMap_AdvancePhase
	mov r0, r8
	bl sub_8002DE4
_0804B818:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B824: .4byte 0x0202BCEC

