	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetEfxHp, 0x08059890 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80536FC, "ax", %progbits
@ sub_80536FC @ JP 0x080536FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80536FC
	.thumb_func
sub_80536FC:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, _0805372C @ =0x02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _080537C8
	movs r0, #1
	str r0, [r1]
	ldr r0, _08053730 @ =0x085E386C
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08053738
	ldr r0, _08053734 @ =0x02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _08053740
	.align 2, 0
_0805372C: .4byte 0x02017728
_08053730: .4byte 0x085E386C
_08053734: .4byte 0x02000000
_08053738:
	ldr r0, _08053798 @ =0x02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_08053740:
	str r0, [r6, #0x60]
	ldr r4, _0805379C @ =0x0203E14E
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #1
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	str r1, [r6, #0x50]
	movs r0, #0
	str r0, [r6, #0x54]
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x4c]
	cmp r0, r1
	bne _080537A0
	movs r0, #1
	str r0, [r6, #0x58]
	b _080537AE
	.align 2, 0
_08053798: .4byte 0x02000000
_0805379C: .4byte 0x0203E14E
_080537A0:
	cmp r0, r1
	ble _080537AA
	movs r0, #1
	rsbs r0, r0, #0
	b _080537AC
_080537AA:
	movs r0, #1
_080537AC:
	str r0, [r6, #0x48]
_080537AE:
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r7, [r6, #0x64]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _080537D0 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
_080537C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080537D0: .4byte 0x02017780

