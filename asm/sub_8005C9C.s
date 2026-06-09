	.syntax unified
	.set BG_EnableSync, 0x08001F0C + 1
	.set GetBackgroundFromBufferPointer, 0x08001D50 + 1
	.set GetPortraitData, 0x0800541C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8005A7C, 0x08005A7C + 1
	.section .text.sub_8005C9C, "ax", %progbits
@ sub_8005C9C @ JP 0x08005C9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8005C9C
	.thumb_func
sub_8005C9C:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	lsls r1, r1, #0xc
	subs r0, #2
	ldrh r2, [r0]
	ldr r0, _08005CD0 @ =0x000003FF
	ands r0, r2
	adds r7, r1, r0
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetPortraitData
	adds r5, r0, #0
	movs r6, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bhi _08005D3C
	lsls r0, r0, #2
	ldr r1, _08005CD4 @ =_08005CD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005CD0: .4byte 0x000003FF
_08005CD4: .4byte _08005CD8
_08005CD8: @ jump table
	.4byte _08005D04 @ case 0
	.4byte _08005D8E @ case 1
	.4byte _08005D8E @ case 2
	.4byte _08005D00 @ case 3
	.4byte _08005D8E @ case 4
	.4byte _08005D8E @ case 5
	.4byte _08005D04 @ case 6
	.4byte _08005D8E @ case 7
	.4byte _08005D8E @ case 8
	.4byte _08005D08 @ case 9
_08005D00:
	movs r6, #0x58
	b _08005D3C
_08005D04:
	movs r6, #0x18
	b _08005D3C
_08005D08:
	ldr r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	lsls r1, r1, #0xc
	adds r2, r4, #0
	adds r2, #0x40
	ldrh r3, [r2]
	ldr r2, _08005D38 @ =0x000003FF
	ands r2, r3
	adds r1, r1, r2
	adds r2, r5, #0
	bl sub_8005A7C
	ldr r0, [r4, #0x3c]
	bl GetBackgroundFromBufferPointer
	bl BG_EnableSync
	adds r0, r4, #0
	bl sub_8002DE4
	b _08005D94
	.align 2, 0
_08005D38: .4byte 0x000003FF
_08005D3C:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetPortraitData
	adds r5, r0, #0
	ldrb r0, [r5, #0x17]
	lsls r0, r0, #6
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	ldrb r0, [r5, #0x16]
	lsls r0, r0, #1
	adds r1, r1, r0
	mov ip, r1
	mov r0, ip
	subs r0, #2
	adds r2, r7, r6
	strh r2, [r0]
	adds r1, r2, #1
	strh r1, [r0, #2]
	adds r1, r2, #2
	strh r1, [r0, #4]
	adds r1, r2, #3
	strh r1, [r0, #6]
	adds r1, #0x1d
	mov r3, ip
	strh r1, [r3, #0x3e]
	adds r3, #0x40
	adds r1, #1
	strh r1, [r3]
	adds r3, #2
	adds r1, #1
	strh r1, [r3]
	mov r1, ip
	adds r1, #0x44
	adds r2, #0x23
	strh r2, [r1]
	bl GetBackgroundFromBufferPointer
	bl BG_EnableSync
_08005D8E:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
_08005D94:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

