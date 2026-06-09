	.syntax unified
	.set BlendPaletteToColor, 0x080CB8BC + 1
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80CEAC8, "ax", %progbits
@ sub_80CEAC8 @ JP 0x080CEAC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CEAC8
	.thumb_func
sub_80CEAC8:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	adds r4, r0, #0
	ldr r0, _080CEB1C @ =0x08BAA1E0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	ldr r5, _080CEB20 @ =0x020228A8
	lsls r6, r4, #0x10
	movs r4, #7
_080CEAF2:
	adds r0, r5, #0
	ldr r1, _080CEB24 @ =0x00007FFF
	lsrs r2, r6, #0x10
	bl BlendPaletteToColor
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080CEAF2
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x30
	bne _080CEB2C
	ldr r0, _080CEB28 @ =0x02022188
	movs r2, #0
	ldr r1, _080CEB24 @ =0x00007FFF
	strh r1, [r0, #0xc]
	strh r2, [r7, #0x2a]
	adds r0, r7, #0
	bl sub_8002DE4
	b _080CEB30
	.align 2, 0
_080CEB1C: .4byte 0x08BAA1E0
_080CEB20: .4byte 0x020228A8
_080CEB24: .4byte 0x00007FFF
_080CEB28: .4byte 0x02022188
_080CEB2C:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CEB30:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

