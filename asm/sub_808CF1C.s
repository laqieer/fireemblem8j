	.syntax unified
	.set ApplyBoxDialoguePosition, 0x0808CAC0 + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SetBoxDialogueSize, 0x0808CB48 + 1
	.set SetHelpBoxInitPosition, 0x0808B528 + 1
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_800A004, 0x0800A004 + 1
	.set sub_808B54C, 0x0808B54C + 1
	.set sub_808C834, 0x0808C834 + 1
	.set sub_808CDEC, 0x0808CDEC + 1
	.set sub_808DD70, 0x0808DD70 + 1
	.set sub_808DDB4, 0x0808DDB4 + 1
	.section .text.sub_808CF1C, "ax", %progbits
@ sub_808CF1C @ JP 0x0808CF1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808CF1C
	.thumb_func
sub_808CF1C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r5, #0
	str r5, [sp]
	str r5, [sp, #4]
	ldr r4, _0808CF6C @ =0x08A737F8
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl SetHelpBoxInitPosition
	adds r0, r4, #0
	bl sub_808B54C
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x48
	strh r5, [r0]
	bl sub_808C834
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808CF70
	adds r0, r4, #0
	adds r0, #0x4a
	strh r5, [r0]
	b _0808CF78
	.align 2, 0
_0808CF6C: .4byte 0x08A737F8
_0808CF70:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0xc
	strh r0, [r1]
_0808CF78:
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0
	strh r0, [r1]
	adds r5, r4, #0
	adds r5, #0x4c
	mov r0, r8
	strh r0, [r5]
	movs r0, #1
	bl SetTextFontGlyphs
	ldrh r0, [r5]
	bl sub_8009FA8
	bl sub_800A004
	add r2, sp, #4
	mov r1, sp
	bl sub_808CDEC
	movs r0, #0
	bl SetTextFontGlyphs
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl SetBoxDialogueSize
	bl sub_808C834
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808CFE6
	adds r0, r4, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xd8
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r6, r6, r0
	adds r0, r4, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x90
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r7, r7, r0
_0808CFE6:
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ApplyBoxDialoguePosition
	bl sub_808DDB4
	ldrh r0, [r5]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_808DD70
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

