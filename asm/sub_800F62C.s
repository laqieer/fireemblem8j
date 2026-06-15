	.syntax unified
	.set DeleteAll6CWaitMusicRelated, 0x08002A08 + 1
	.set SetNextChapterId, 0x08009EC4 + 1
	.set SetNextGameActionId, 0x08009EB0 + 1
	.set sub_800226C, 0x0800226C + 1
	.section .text.sub_800F62C, "ax", %progbits
@ sub_800F62C @ JP 0x0800F62C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F62C
	.thumb_func
sub_800F62C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x38]
	ldrb r0, [r1]
	movs r3, #0xf
	ands r3, r0
	movs r0, #2
	ldrsh r2, [r1, r0]
	cmp r2, #0
	bge _0800F646
	ldr r0, _0800F654 @ =0x030004B0
	movs r1, #8
	ldrsh r2, [r0, r1]
_0800F646:
	cmp r3, #4
	bhi _0800F6E2
	lsls r0, r3, #2
	ldr r1, _0800F658 @ =_0800F65C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800F654: .4byte 0x030004B0
_0800F658: .4byte _0800F65C
_0800F65C: @ jump table
	.4byte _0800F670 @ case 0
	.4byte _0800F674 @ case 1
	.4byte _0800F694 @ case 2
	.4byte _0800F6B4 @ case 3
	.4byte _0800F6BE @ case 4
_0800F670:
	movs r0, #0
	b _0800F6D2
_0800F674:
	adds r0, r2, #0
	bl SetNextChapterId
	ldr r2, _0800F690 @ =0x0202BCEC
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	b _0800F6D2
	.align 2, 0
_0800F690: .4byte 0x0202BCEC
_0800F694:
	adds r0, r2, #0
	bl SetNextChapterId
	ldr r2, _0800F6B0 @ =0x0202BCEC
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
	b _0800F6D2
	.align 2, 0
_0800F6B0: .4byte 0x0202BCEC
_0800F6B4:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	bl GotoChapterWithoutSave
	b _0800F6E2
_0800F6BE:
	ldr r2, _0800F700 @ =0x0202BCEC
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #6
	orrs r0, r1
	strb r0, [r2]
	movs r0, #3
_0800F6D2:
	bl SetNextGameActionId
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
_0800F6E2:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	bl DeleteAll6CWaitMusicRelated
	movs r0, #4
	bl sub_800226C
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800F700: .4byte 0x0202BCEC

