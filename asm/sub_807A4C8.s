	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_80733E8, 0x080733E8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_807A4C8, "ax", %progbits
@ sub_807A4C8 @ JP 0x0807A4C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A4C8
	.thumb_func
sub_807A4C8:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _0807A4E4 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0807A4EC
	ldr r1, _0807A4E8 @ =0x02019790
	adds r0, r3, #0
	bl sub_80D6394
	b _0807A4F4
	.align 2, 0
_0807A4E4: .4byte 0x0203E11C
_0807A4E8: .4byte 0x02019790
_0807A4EC:
	ldr r1, _0807A518 @ =0x02019790
	adds r0, r2, #0
	bl sub_80D6394
_0807A4F4:
	ldr r5, _0807A518 @ =0x02019790
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0807A520
	ldr r1, _0807A51C @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBG
	b _0807A534
	.align 2, 0
_0807A518: .4byte 0x02019790
_0807A51C: .4byte 0x020234A8
_0807A520:
	ldr r1, _0807A544 @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl sub_80733E8
_0807A534:
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A544: .4byte 0x020234A8

