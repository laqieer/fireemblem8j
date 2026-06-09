	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set DisplayMovementViewTile, 0x08019864 + 1
	.set InitBmBgLayers, 0x08015624 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8019914, 0x08019914 + 1
	.section .text.sub_801D590, "ax", %progbits
@ sub_801D590 @ JP 0x0801D590 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D590
	.thumb_func
sub_801D590:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r2, _0801D634 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r4, _0801D638 @ =0x0202BCAC
	ldrb r1, [r4, #4]
	movs r0, #1
	orrs r0, r1
	strb r0, [r4, #4]
	bl sub_8019914
	movs r5, #9
	adds r7, r4, #0
_0801D5BC:
	movs r4, #0xe
	subs r6, r5, #1
_0801D5C0:
	movs r0, #0x24
	ldrsh r1, [r7, r0]
	adds r1, r1, r4
	movs r0, #0x26
	ldrsh r2, [r7, r0]
	adds r2, r2, r5
	str r5, [sp]
	ldr r0, _0801D63C @ =0x02023CA8
	adds r3, r4, #0
	bl DisplayMovementViewTile
	subs r4, #1
	cmp r4, #0
	bge _0801D5C0
	adds r5, r6, #0
	cmp r5, #0
	bge _0801D5BC
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropB
	bl InitBmBgLayers
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D634: .4byte 0x03003020
_0801D638: .4byte 0x0202BCAC
_0801D63C: .4byte 0x02023CA8

