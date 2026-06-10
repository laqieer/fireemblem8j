	.syntax unified
	.set WfxFlames_Init, 0x0803081C + 1
	.set WfxNone_Init, 0x08030190 + 1
	.set sub_80301A8, 0x080301A8 + 1
	.set sub_80302E0, 0x080302E0 + 1
	.set sub_80303C4, 0x080303C4 + 1
	.set sub_8030490, 0x08030490 + 1
	.set sub_803061C, 0x0803061C + 1
	.set sub_80309A8, 0x080309A8 + 1
	.section .text.WfxInit, "ax", %progbits
@ WfxInit @ JP 0x08030A84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WfxInit
	.thumb_func
WfxInit:
	push {lr}
	ldr r0, _08030A98 @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bhi _08030AEE
	lsls r0, r0, #2
	ldr r1, _08030A9C @ =_08030AA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030A98: .4byte 0x0202BCEC
_08030A9C: .4byte _08030AA0
_08030AA0: @ jump table
	.4byte _08030AC0 @ case 0
	.4byte _08030AC6 @ case 1
	.4byte _08030AD2 @ case 2
	.4byte _08030ADE @ case 3
	.4byte _08030AD8 @ case 4
	.4byte _08030AE4 @ case 5
	.4byte _08030ACC @ case 6
	.4byte _08030AEA @ case 7
_08030AC0:
	bl WfxNone_Init
	b _08030AEE
_08030AC6:
	bl sub_80301A8
	b _08030AEE
_08030ACC:
	bl sub_80303C4
	b _08030AEE
_08030AD2:
	bl sub_8030490
	b _08030AEE
_08030AD8:
	bl sub_80302E0
	b _08030AEE
_08030ADE:
	bl sub_803061C
	b _08030AEE
_08030AE4:
	bl WfxFlames_Init
	b _08030AEE
_08030AEA:
	bl sub_80309A8
_08030AEE:
	pop {r0}
	bx r0
	.align 2, 0

