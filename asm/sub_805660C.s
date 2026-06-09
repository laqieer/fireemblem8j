	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_80733E8, 0x080733E8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_805660C, "ax", %progbits
@ sub_805660C @ JP 0x0805660C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805660C
	.thumb_func
sub_805660C:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _08056628 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08056630
	ldr r1, _0805662C @ =0x02019790
	adds r0, r3, #0
	bl sub_80D6394
	b _08056638
	.align 2, 0
_08056628: .4byte 0x0203E11C
_0805662C: .4byte 0x02019790
_08056630:
	ldr r1, _0805665C @ =0x02019790
	adds r0, r2, #0
	bl sub_80D6394
_08056638:
	ldr r5, _0805665C @ =0x02019790
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08056664
	ldr r1, _08056660 @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_80733E8
	b _08056678
	.align 2, 0
_0805665C: .4byte 0x02019790
_08056660: .4byte 0x020234A8
_08056664:
	ldr r1, _08056688 @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08056678:
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056688: .4byte 0x020234A8

