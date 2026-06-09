	.syntax unified
	.set GetItemIconId, 0x080174A8 + 1
	.set GetUnit, 0x08019108 + 1
	.set NewPopup2_PlanA, 0x0801F654 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_802F728, 0x0802F728 + 1
	.section .text.sub_802F860, "ax", %progbits
@ sub_802F860 @ JP 0x0802F860 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802F860
	.thumb_func
sub_802F860:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802F8B8 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	ldr r1, _0802F8BC @ =0x0203A568
	adds r1, #0x6f
	movs r2, #0xff
	strb r2, [r1]
	ldrb r1, [r4, #0x12]
	bl sub_802F728
	adds r5, r0, #0
	ldr r0, _0802F8C0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802F89A
	movs r0, #0x5a
	bl m4aSongNumStart
_0802F89A:
	adds r0, r6, #0
	bl GetItemIconId
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_8009FA8
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl NewPopup2_PlanA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F8B8: .4byte 0x0203A954
_0802F8BC: .4byte 0x0203A568
_0802F8C0: .4byte 0x0202BCEC

