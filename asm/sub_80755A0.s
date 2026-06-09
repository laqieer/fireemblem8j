	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_80755A0, "ax", %progbits
@ sub_80755A0 @ JP 0x080755A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80755A0
	.thumb_func
sub_80755A0:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08075688 @ =0x087A9780
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x5c]
	movs r1, #0
	mov sb, r1
	mov r2, sb
	strh r2, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, _0807568C @ =0x087E62D4
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _08075690 @ =0x086B1590
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _08075694 @ =0x086B1690
	ldr r1, _08075698 @ =0x020234A8
	movs r2, #1
	mov r8, r2
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8056158
	movs r0, #1
	movs r1, #0xe
	movs r2, #8
	movs r3, #0
	bl SetBlendConfig
	ldr r4, _0807569C @ =0x03003020
	adds r3, r4, #0
	adds r3, #0x37
	ldrb r1, [r3]
	movs r6, #0x20
	orrs r1, r6
	ldrb r2, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r4, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r0, #8
	orrs r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r3]
	mov r0, sb
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r4, #0x3d
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldrh r1, [r5, #8]
	ldr r0, _080756A0 @ =0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075688: .4byte 0x087A9780
_0807568C: .4byte 0x087E62D4
_08075690: .4byte 0x086B1590
_08075694: .4byte 0x086B1690
_08075698: .4byte 0x020234A8
_0807569C: .4byte 0x03003020
_080756A0: .4byte 0x0000F3FF

