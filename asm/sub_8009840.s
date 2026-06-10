	.syntax unified
	.set GetGlobalCompletionCount, 0x080A95F4 + 1
	.set GetRealChaperIndex, 0x080096D8 + 1
	.set sub_80A9C30, 0x080A9C30 + 1
	.set sub_80A9C44, 0x080A9C44 + 1
	.section .text.sub_8009840, "ax", %progbits
@ sub_8009840 @ JP 0x08009840 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009840
	.thumb_func
sub_8009840:
	push {r4, r5, r6, lr}
	sub sp, #0x4c
	bl GetGlobalCompletionCount
	cmp r0, #0
	beq _08009850
_0800984C:
	movs r0, #9
	b _080098CA
_08009850:
	movs r5, #0
	movs r4, #0
	mov r6, sp
_08009856:
	adds r0, r4, #0
	bl sub_80A9C30
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009882
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A9C44
	ldrh r0, [r6, #0x2e]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	cmp r0, #0
	bne _0800984C
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	bl GetRealChaperIndex
	cmp r5, r0
	bge _08009882
	adds r5, r0, #0
_08009882:
	adds r4, #1
	cmp r4, #2
	ble _08009856
	cmp r5, #0x11
	ble _08009890
	movs r0, #8
	b _080098CA
_08009890:
	cmp r5, #0xf
	ble _08009898
	movs r0, #7
	b _080098CA
_08009898:
	cmp r5, #0xd
	ble _080098A0
	movs r0, #6
	b _080098CA
_080098A0:
	cmp r5, #0xb
	ble _080098A8
	movs r0, #5
	b _080098CA
_080098A8:
	cmp r5, #9
	ble _080098B0
	movs r0, #4
	b _080098CA
_080098B0:
	cmp r5, #7
	ble _080098B8
	movs r0, #3
	b _080098CA
_080098B8:
	cmp r5, #5
	ble _080098C0
	movs r0, #2
	b _080098CA
_080098C0:
	cmp r5, #3
	bgt _080098C8
	movs r0, #0
	b _080098CA
_080098C8:
	movs r0, #1
_080098CA:
	add sp, #0x4c
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

