	.syntax unified
	.set AnyLinkArenaTeamExists, 0x08043318 + 1
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SioStrCpy, 0x08042D4C + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8043438, 0x08043438 + 1
	.set sub_8043744, 0x08043744 + 1
	.set sub_804DFE4, 0x0804DFE4 + 1
	.set sub_80AB18C, 0x080AB18C + 1
	.set sub_80AB354, 0x080AB354 + 1
	.section .text.sub_8043574, "ax", %progbits
@ sub_8043574 @ JP 0x08043574 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8043574
	.thumb_func
sub_8043574:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x40]
	ldr r1, _080435FC @ =0x085D33A8
	ldr r0, _08043600 @ =0x0203DA20
	mov sb, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	lsls r4, r5, #2
	adds r4, r4, r5
	adds r0, r4, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _08043604 @ =0x0203DB78
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrb r1, [r4, #0xf]
	movs r0, #0x7f
	ands r0, r1
	bl sub_80AB18C
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80AB354
	movs r0, #0x61
	bl sub_8009FA8
	adds r1, r4, #0
	bl SioStrCpy
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r4, #0x10]
	movs r2, #0x80
	rsbs r2, r2, #0
	adds r1, r2, #0
	adds r0, r5, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	adds r0, r5, #0
	bl sub_8043438
	bl AnyLinkArenaTeamExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08043608
	mov r1, sb
	ldrb r0, [r1]
	adds r1, r7, #0
	bl sub_8043744
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0804361C
	.align 2, 0
_080435FC: .4byte 0x085D33A8
_08043600: .4byte 0x0203DA20
_08043604: .4byte 0x0203DB78
_08043608:
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804361C
	mov r2, sb
	ldrb r0, [r2]
	adds r1, r7, #0
	bl sub_8043744
_0804361C:
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804DFE4
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

