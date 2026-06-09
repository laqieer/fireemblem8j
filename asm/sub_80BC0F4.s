	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetNextChapterStatsSlot, 0x080A8D00 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.section .text.sub_80BC0F4, "ax", %progbits
@ sub_80BC0F4 @ JP 0x080BC0F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BC0F4
	.thumb_func
sub_80BC0F4:
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	adds r4, r0, #0
	movs r1, #0
	str r1, [r4, #0x30]
	movs r0, #0x20
	str r0, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x39
	strb r1, [r0]
	str r1, [r4, #0x2c]
	bl GetNextChapterStatsSlot
	adds r4, #0x38
	strb r0, [r4]
	ldr r5, _080BC1A8 @ =0x03003020
	ldrb r1, [r5, #1]
	movs r4, #2
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	mov sl, r1
	ands r0, r1
	subs r1, #2
	mov sb, r1
	ands r0, r1
	subs r1, #4
	mov r8, r1
	ands r0, r1
	movs r6, #0x11
	rsbs r6, r6, #0
	ands r0, r6
	strb r0, [r5, #1]
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r0, #0
	bl sub_8001ACC
	ldrb r0, [r5, #1]
	ands r4, r0
	mov r0, sl
	ands r4, r0
	mov r1, sb
	ands r4, r1
	mov r0, r8
	ands r4, r0
	ands r4, r6
	strb r4, [r5, #1]
	bl SetDefaultColorEffects
	bl ResetText
	ldrb r1, [r5, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	ldr r0, _080BC1AC @ =0x08AC6C98
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl sub_8000D68
	ldr r0, _080BC1B0 @ =0x020244A8
	ldr r1, _080BC1B4 @ =0x08AC6CD8
	movs r2, #0xe0
	lsls r2, r2, #8
	bl j_TmApplyTsa
	movs r0, #8
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC1A8: .4byte 0x03003020
_080BC1AC: .4byte 0x08AC6C98
_080BC1B0: .4byte 0x020244A8
_080BC1B4: .4byte 0x08AC6CD8

